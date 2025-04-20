variable "my_ami" {
  type = string
  #  default = "ami-065a492fef70f84b1"
}

variable "instance_type" {
  type = string
  #   default = "t2.micro"
}

variable "public_subnet_1_ec2" {}

variable "public_sg_ec2" {}

variable "public_subnet_2_ec2" {}