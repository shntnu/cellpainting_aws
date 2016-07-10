[![Build Status](https://travis-ci.org/shntnu/cellpainting_aws.svg?branch=master)](https://travis-ci.org/shntnu/cellpainting_aws)

# AWS infrastructure for Cell Painting 

## How to avoid accidental deletion of resources

- Avoid accidental deletion of S3 bucket, EFS volume and RDS instance by creating the resource ahead of time and only providing the ids to terraform. 
- Everything apart from creating the instances should happen using terraform
- Other ideas 
  - https://github.com/hashicorp/terraform/issues/3468

