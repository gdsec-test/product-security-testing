echo "fake-aws (new for this file)"
export BAD_SECRETS_iidd=AKIAQQAYVYDDEKVOUJVD
export BAD_SECRETS_kkeeyy=rUcJ2Hpx7o3NTR/BbwAsZRgyp+xJc1l/vVGKxAm

echo "fake-aws-bad-format (new for this file + with single quote)"
export BAD_SECRETS_iidd= 'ASIAJJZVMHOHEJCWLWSA'
export BAD_SECRETS_kkeeyy= UeoUrWczFIplmndVsjDfxadUqkUZnTPxOlqmdJK

echo "fake-slack (new for this file)"
export BAD_SECRETS_loc=https://hooks.slack.com/services/T02CHKTRB/BHNMYJFE2/UuUBjDqSfkM3831vnr1glOy

echo "fake-slack-bad-format (same as config/connection.json + with single quote)"
export BAD_SECRETS_doc='https://api.slack.com/messaging/webhooks'
export BAD_SECRETS_url='https://hooks.slack.com/services/A03CHKTRC/WHNNYJFE2/zuUB1jDqSfkM3831vnr1gly'

echo "fake-slack-broken (same as config/connection.json)"
export BAD_SECRETS_base=https://hooks.slack.com/services
export BAD_SECRETS_team=T03AHKTRA
export BAD_SECRETS_service=BHNNYJFE2
export BAD_SECRETS_auth=WuUBjDqSfkM3831vnr1glOy

echo "random-jwt (same as config/connection.json)"
export BAD_SECRETS_doc=https://jwt.io/
export BAD_SECRETS_key=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5

echo "hashicorp-token (same as config/connection.json)"
export BAD_SECRETS_tok=9e64c3b8-01f7-7a64-1575-30a91f7d1ae

echo "random-token (same as config/connection.json)"
export BAD_SECRETS_tok=92a90d01-02fc-212c-5e1f-8dccebad3f2

env | grep BAD_SECRET
