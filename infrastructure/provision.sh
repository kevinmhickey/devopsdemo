#!/bin/bash

export STACK_NAME="fmdemo"

aws cloudformation create-stack --stack-name $STACK_NAME --template-body file://./provisioning/infrastructure-template.json
echo -n "Stack creation initiated.  Waiting for competion..."

aws cloudformation describe-stacks --stack-name $STACK_NAME | grep CREATE_COMPLETE
while [ $? -ne 0 ]
do 
	sleep 3
	echo -n .
	aws cloudformation describe-stacks --stack-name $STACK_NAME | grep CREATE_COMPLETE
done

echo
echo "Stack created.  Installing software."
sleep 5

cd configuration
export ANSIBLE_HOST_KEY_CHECKING=False
aws --output json cloudformation describe-stacks | ruby inventory.rb  > inventory

ansible-playbook playbook.yml -u ubuntu -i inventory --private-key="~/.ssh/us-east-1.pem" 
echo "Provisioning complete."



