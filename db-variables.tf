variable "identifier" {
  default = "cellpainting-rds"
  description = "Identifier for your DB"
}

variable "storage" {
  default = "10"
  description = "Storage size in GB"
}

variable "engine" {
  default = "mysql"
  description = "Engine type, example values mysql, postgres"
}

variable "engine_version" {
  description = "Engine version"
  default = {
    mysql = "5.6.22"
    postgres = "9.4.1"
  }
}

variable "instance_class" {
  default = "db.t2.micro"
  description = "Instance class"
}

variable "db_name" {
  default = "cellpainting"
  description = "db name"
}

variable "db_username" {
  default = "cpuser"
  description = "User name"
}

variable "db_password" {
  description = "password, provide through your ENV variables"
}
