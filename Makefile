# Set the shell so we are on the same page
SHELL := bash

# Check to ensure certain environment variables are set
env_require = @( [[ -v '$(1)' ]] && [[ -n '$(2)' ]] ) \
	&& { printf 'export $(1)=$(2)\n' > /dev/stderr; } \
	|| { printf '[FATAL] Required environment variable "$(1)" is unset\n' > /dev/stderr; exit 1; }

# Python things
# use env python3 to get whatever is currently in use instead of hard-coding a value
PYTHON := env python3
VENVDIR := .venv
VENV_ACTIVATE_SCRIPT := $(VENVDIR)/bin/activate
REQUIREMENTS_FILE := requirements.txt

# Name of temporary directories
TMPDIR := .tmp
BUILDDIR := .build
DISTDIR := .dist

.PHONY: help
help:
	@printf 'Available targets:\n'
	@printf '\t check: check that commonly used environment variables are set\n'
	@printf '\t $(VENVDIR): set up the Python 3 VirtualEnvironment needed for development\n'
	@printf '\t setup-dev: set up the local development environment\n'
	@printf '\t clean: clean up temporary directories and all other artifacts, if any\n'

.PHONY: check
check:
	@# Checks for common environment variables needed by many targets
	@# $(call env_require,GD_ORG,$(GD_ORG))
	@# $(call env_require,AWS_ENV,$(AWS_ENV))
	$(call env_require,AWS_REGION,$(AWS_REGION))

$(VENVDIR): $(REQUIREMENTS_FILE)
	$(PYTHON) -m venv $(VENVDIR)
	source $(VENV_ACTIVATE_SCRIPT) && \
		pip --quiet install --upgrade pip && \
		pip --quiet install --requirement $(REQUIREMENTS_FILE)

$(TMPDIR):
	mkdir -vp $(TMPDIR)

$(BUILDDIR):
	mkdir -vp $(BUILDDIR)

$(DISTDIR):
	mkdir -vp $(DISTDIR)


.PHONY: setup-dev
setup-dev: $(REQUIREMENTS_FILE) .pre-commit-config.yaml $(VENVDIR)
	pre-commit install

.PHONY: clean
clean:
	rm -rf $(TMPDIR) $(BUILDDIR) $(DISTDIR) $(VENVDIR)

.PHONY: validate
validate: check $(VENVDIR)
	$(call env_require,AWS_REGION,$(AWS_REGION))
	$(call env_require,AWS_ACCOUNT_ID,$(AWS_ACCOUNT_ID))
	source $(VENV_ACTIVATE_SCRIPT) && \
		cd sceptre && \
		sceptre validate .

.PHONY: gha-manual-action-target
gha-manual-action-target:
	$(call env_require,ACTION_TO_TAKE,$(ACTION_TO_TAKE))
	$(call env_require,TARGET_SCOPE,$(TARGET_SCOPE))
	source $(VENV_ACTIVATE_SCRIPT) && \
		cd sceptre && \
		sceptre $(ACTION_TO_TAKE) -y $(TARGET_SCOPE)
