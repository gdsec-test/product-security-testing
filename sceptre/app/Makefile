ECR_REGISTRY=${AWS_ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com
ECR_REPO=iam-breakout-ecr

.PHONY: all
all: build deploy

.PHONY: build
build:
	docker build -t ${ECR_REPO} .
	docker tag ${ECR_REPO}:latest ${ECR_REGISTRY}/${ECR_REPO}:latest

.PHONY: deploy
deploy: ecr-login delete
	docker push ${ECR_REGISTRY}/${ECR_REPO}:latest

.PHONY: ecr-login
ecr-login:
	aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${ECR_REGISTRY}

.PHONY: delete
delete: ecr-login
	aws ecr batch-delete-image \
		--repository-name ${ECR_REPO} \
		--image-ids imageTag=latest \
		--region ${AWS_REGION}

.PHONY: update
update: deploy
	aws lambda update-function-code \
		--function-name iam-breakout-lambda \
		--image-uri ${ECR_REGISTRY}/${ECR_REPO}:latest \
		--region ${AWS_REGION}
