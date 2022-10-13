#!/bin/sh

# Deploy the template using the SAM CLI

template_file="$1"
region="$2"
config_file="$3"

echo "Sam build  started..."

sam validate -t ${template_file} --region ${region}

sam build -t ${template_file} --region ${region}
echo "Sam build  finished..."
echo "Sam deploy  started..."
sam deploy --config-file ${config_file} -t ${template_file} --no-confirm-changeset --no-fail-on-empty-changeset  --region ${region}
if [ $? -ne 0 ]; then
  echo "SAM deploy error"
  exit 1
fi
