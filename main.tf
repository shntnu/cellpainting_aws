provider "aws" {

}


module "networking" {
	source = "./networking"

	vpc_name = "cellpainting"
}

module "security" {
	source = "./security"

	vpc_id = "${module.networking.vpc_default_id}"
}

module efs_mount {
	source = "./efs_mount"

	# EFS resource should be created ahead of time. 
	# We avoid using terraform to create this resource to avoid 
	# accidental deletion
	efs_id = "fs-3609f37f"

	subnet_1_private_id = "${module.networking.subnet_1_private_id}"

	subnet_2_private_id = "${module.networking.subnet_2_private_id}"

	nfs_security_group  = "${module.security.security_group_nfs_id}"
}

module "db" {
	source = "./db"

	security_group_id   = "${module.security.security_group_rds_id}"

	subnet_1_private_id = "${module.networking.subnet_1_private_id}"

	subnet_2_private_id = "${module.networking.subnet_2_private_id}"

	db_password = "${db_password}"
}


