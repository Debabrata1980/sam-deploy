#!/bin/sh

# Deploy the template using the SAM CLI
echo "Sam build  started..."
sam build
echo "Sam build  finished..."
echo "Sam deploy  started..."
sam deploy --no-confirm-changeset --no-fail-on-empty-changeset
if [ $? -ne 0 ]; then
  echo "SAM deploy error"
  exit 1
fi
