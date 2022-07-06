## Pre-req

1. Set AWS_ACCOUNT and AWS_REGION in `env/**/xyz.env`.
2. Source the env file.

## Creating

1. `sceptre launch -y iam-breakout`

---

## Exploit

1. Test execute Lambda
   - This should fail with AuthZ error.
2. SSM into EC2
3. Using AWS CLI, try updating lambda role.

## Deleting

1. `sceptre delete -y iam-breakout`
