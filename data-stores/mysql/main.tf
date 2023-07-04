
#FAQ - https://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_CreateDBInstance.html

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.4.0"
}

data "aws_ssm_parameter" "password-mysql" {
  name = var.ssm_password
  with_decryption = true
}

locals {
  db_pass = data.aws_ssm_parameter.password-mysql.value
}

resource "aws_db_instance" "example" {
  identifier_prefix = var.db_identifier_prefix
  engine = var.db_engine
  allocated_storage = 10
  instance_class = var.db_instance_class
  port = var.db_port
  db_name = var.db_name
  username = var.db_username
  password = local.db_pass
  skip_final_snapshot = true
}

