#!/bin/sh

# Deploy the template using the SAM CLI

echo "$1"
echo "$2"
echo "$3"
echo "$*"

#args[0]="--template-file $1"

#if [ ! -z $2 ]
#then
#args[1]="--region $2"
#fi

#if [ ! -z $3 ]
#then
#args[2]="--config-file $3"
#fi

template_file="$1"
region="$2"
config_file="$3"

#echo "Sam build  started..."
sam build  --config-file ${config_file} -t ${template_file} --region ${region}
echo "Sam build  finished..."
echo "Sam deploy  started..."
sam deploy --config-file ${config_file} -t ${template_file} --no-confirm-changeset --no-fail-on-empty-changeset  --region ${region} 
if [ $? -ne 0 ]; then
  echo "SAM deploy error"
  exit 1
fi
