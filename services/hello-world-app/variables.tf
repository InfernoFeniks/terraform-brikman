variable "environment" {
  description = "The name of the environment we're deploying to"
  type = string
}

# variable "db_remote_state_bucket" {
#   description = "The name of the S3 bucket for the database's remote state"
#   type        = string
# }

# variable "db_remote_state_key" {
#   description = "The path for the database's remote state in S3"
#   type        = string
# }

variable "cluster_name" {
  description = "The name to use for all the cluster resources"
  type        = string
}

variable "task_name" {
  description = "The name to use for all app resources"
  type        = string
}

variable "db_address" {
  description = "Connect to the database at this endpoint"
  type        = string
  default = "unknown db address"
}

variable "db_port" {
  description = "The port the database is listening on"
  type        = string
  default = "unknown db port"
}

variable "server_text" {
  description = "The text the web server should return"
  type        = string
  default     = "Hello, World"
  }

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 8080
}

variable "ami" {
  description = "The AMI to run in the cluster"
  default     = "ami-064087b8d355e9051"
  type        = string
}

variable "instance_type" {
  description = "The type of EC2 Instances to run (e.g. t3.micro)"
  type        = string
  default     = "t3.micro"
}

variable "min_size" {
  description = "The minimum number of EC2 Instances in the ASG"
  type        = number
}
variable "max_size" {
  description = "The maximum number of EC2 Instances in the ASG"
  type        = number
}

variable "enable_autoscaling" {
  description = "If set to true, enable auto scaling"
  type        = bool
}

variable "custom_tags" {
  description = "Custom tags to set on the Instances in the ASG"
  type        = map(string)
  default     = {}
}

variable "subnet_ids" {
  description = "The subnet IDs to deploy to"
  type        = list(string)
}

variable "vpc_id" {
  description = "The vpc ID to deploy to"
  type        = string
}