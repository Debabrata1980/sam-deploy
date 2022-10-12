#!/bin/bash

# Deploy the template using the SAM CLI

print $1
print $2
print $3

args[0]="--template-file $1"

if [ ! -z $2 ]
then
args[1]="--region $2"
fi

if [ ! -z $3 ]
then
args[2]="--config-file $3"
fi

#echo "Sam build  started..."
sam build --template-file $1 --region $2 --config-file $3 
echo "Sam build  finished..."
echo "Sam deploy  started..."
sam deploy --no-confirm-changeset --no-fail-on-empty-changeset $({args[@]})
if [ $? -ne 0 ]; then
  echo "SAM deploy error"
  exit 1
fi
