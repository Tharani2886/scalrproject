#DB_USERNAME
variable "db_username" {
  type = string
  # default     = "admin"
}

#DB_PASS
variable "db_password" {
  type = string
  # default     = "admin123"
  sensitive = true
}


variable "db_az" {
  type = string
  # default     = "ap-southeast-1a"
}

variable "private_sg_db" {}

variable "private_subnet_1_db" {}

variable "private_subnet_2_db" {}
