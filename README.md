# aws-events
watcher for aws events - gcom challenge

## Running

Create in console an user for automation and give the following permissions to it's group: AWSLambdaFullAccess, IAMFullAccess, CloudWatchFullAccess

Setup env vars for automation user

```
 export AWS_ACCESS_KEY_ID="keyid"
 export AWS_SECRET_ACCESS_KEY="accesskey"
```

Get that Terraform deal going

```
terraform init
terraform apply
```

Only manual step is to add Cloudwatch event trigger to function via Console. Did not found a way to do it using Terraform.

### Important link

https://gist.github.com/gene1wood/55b358748be3c314f956