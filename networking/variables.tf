variable "subnet_1_private_cidr" {
  default = "10.0.1.0/24"
  description = "Your AZ"
}

variable "subnet_2_private_cidr" {
  default = "10.0.2.0/24"
  description = "Your AZ"
}

variable "subnet_1_public_cidr" {
  default = "10.0.3.0/24"
  description = "Your AZ"
}

variable "az_1" {
  default = "us-east-1a"
  description = "Your Az1, use AWS CLI to find your account specific"
}

variable "az_2" {
  default = "us-east-1b"
  description = "Your Az2, use AWS CLI to find your account specific"
}

variable "vpc_name" {}
