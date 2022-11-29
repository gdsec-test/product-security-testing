# product-security-testing [![Repository Prod Workflow](https://github.com/gdcorp-infosec/product-security-testing/actions/workflows/cicd-prod.yml/badge.svg?branch=main)](https://github.com/gdcorp-infosec/product-security-testing/actions/workflows/cicd-prod.yml)

Product security testing repo.

Not suspicious at all.

## Contribute 💻

1. Setup env.

```bash
$ python3 -m venv .venv

$ . .venv/bin/activate

$ pip install --upgrade pip && pip install -r requirements.txt
```

2. Add code
3. Run test

```bash
$ python -m unittest -v
```
| Type | Friendly Name | us-west-2 | us-east-1 | eu-west-1 |
| :--- | :--- | :---: | :---: | :---: |
| S3 | [Aggregated Logs Bucket](#aggregated-logs-bucket) | [:heavy_check_mark:][aggregated-logs-us-west-2] | [:heavy_check_mark:][aggregated-logs-us-east-1] | [:x:][aggregated-logs-eu-west-1] |

[aggregated-logs-us-west-2]:(/sceptre/config/non-pci/dev-private/us-west-2/s3/aggregated-logs.yaml)
[aggregated-logs-us-east-1]:(/sceptre/config/non-pci/dev-private/us-east-1/s3/aggregated-logs.yaml)
[aggregated-logs-eu-west-1]:(/sceptre/config/non-pci/dev-private/eu-west-1/s3/aggregated-logs.yaml)
