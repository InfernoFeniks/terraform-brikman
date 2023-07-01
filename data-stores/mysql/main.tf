locals {
  db_pass = data.aws_ssm_parameter.password-mysql.value
}

data "aws_ssm_parameter" "password-mysql" {
  name = "stage-data-stores-mysql"
  with_decryption = true
}

resource "aws_db_instance" "example" {
  identifier_prefix = "terraform-infernofeniks"
  engine = "mysql"
  allocated_storage = 10
  instance_class = "db.t3.micro"
  port = 3306
  db_name = "example_database"
  username = "admin"
  password = local.db_pass
  skip_final_snapshot = true
}

