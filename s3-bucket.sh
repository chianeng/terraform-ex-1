#!/bin/bash

 aws s3api create-bucket --bucket primus-bashscript --region us-east-2 --create-bucket-configuration LocationConstraint=us-east-2