[![Build Status](https://travis-ci.org/shntnu/cellpainting_aws.svg?branch=master)](https://travis-ci.org/shntnu/cellpainting_aws)

# AWS infrastructure for Cell Painting 

## Creating an RDS instance in AWS

This example provides sample configuration for creating a mysql or postgres instance. 

The example creates db subnet groups and a VPC security group as inputs to the instance creation

Several parameters are externalized, review the different variables.tf files and change them to fit your needs. Carefully review the CIDR blocks, egress/ingress rules, availability zones that are very specific to your account.
