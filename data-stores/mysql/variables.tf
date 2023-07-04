variable "db_port" {
  description = "The port to db"
  type = number
  default = 3306
}

variable "db_engine" {
  description = "The engine to db (mariadb,mysql,oracle-ee,oracle-ee-cdb,oracle-se2,oracle-se2-cdb,postgres,sqlserver-ee,sqlserver-se,sqlserver-ex,sqlserver-web)"
  type = string
  default = "mysql"
}

variable "db_instance_class" {
  description = "The instance to db (https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.DBInstanceClass.html)"
  type = string
  default = "db.t3.micro"
}

variable "db_identifier_prefix" {
  description = "The identifier for this DB instance."
  type = string
  default = "db-terraform"
}

variable "db_allocated_storage" {
  description = "The amount of storage in gibibytes (GiB) to allocate for the DB instance"
  type = number
  default = 10
}

variable "db_name" {
  description = "The name of the database"
  type = string
  default = "example_database"
}

variable "db_username" {
  description = "The username of the database"
  type = string
  default = "admin"
}

variable "ssm_password" {
  description = "The name of password from ssm aws"
  type = string
  default = "stage-data-stores-mysql"
}