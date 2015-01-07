#!/bin/sh
aws --output json cloudformation describe-stacks | ruby inventory.rb  > inventory

