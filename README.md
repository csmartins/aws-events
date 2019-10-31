# aws-events
watcher for aws events - gcom challenge

## Running

Create in console an user for automation and give the following permissions to it's group: AWSLambdaFullAccess, IAMFullAccess, CloudWatchFullAccess

Setup env vars for automation user

```
 export AWS_ACCESS_KEY_ID="keyid"
 export AWS_SECRET_ACCESS_KEY="accesskey"
```

Setup env vars for the documentdb cluster

```
 export TF_VAR_mongouser=user
 export TF_VAR_mongopassword=password
```

Setup additional env vars for the function

```
 export TF_VAR_mongoendpoint=endpoint
 export TF_VAR_mongoport=port
```

Install dependencies in event_target directory

```
pipenv install --three
```

Copy the dependencies to local folder

```
pipenv run which python
# get the path for the virtual environment

cp -R <path-to-virtual-env>/lib/python3.7/site-packages/pymongo .
cp -R <path-to-virtual-env>/lib/python3.7/site-packages/bson .
cp -R <path-to-virtual-env>/lib/python3.7/site-packages/gridfs .
```

Download the pem to connect to mongo in event_targer folder

```
wget https://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem

```
Get that Terraform deal going

```
terraform init
terraform apply
```

Only manual step is to add Cloudwatch event trigger to function via Console. Did not found a way to do it using Terraform.

### Important link

https://gist.github.com/gene1wood/55b358748be3c314f956