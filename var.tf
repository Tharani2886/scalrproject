variable aws_region_out {
    type     = string
    default   = "ap-southeast-1"
}


##########################  vpc  #########################

variable cidr_vpc_out {
    type      = string
    default   = "10.0.0.0/16"

}

variable pub_sub_1_out {
    type      = string
    default   = "10.0.1.0/24"

}

variable pub_avz_1_out {
    type      = string
    default   = "ap-southeast-1a"

}


variable pub_sub_2_out {
    type      = string
    default   = "10.0.2.0/24"

}

variable pub_avz_2_out {
    type      = string
    default   = "ap-southeast-1b"

}

variable pvt_sub_1_out {
    type      = string
    default   = "10.0.3.0/24"

}

variable pvt_avz_1_out {
    type      = string
    default   = "ap-southeast-1a"

}

variable pvt_sub_2_out {
    type      = string
    default   = "10.0.4.0/24"

}
    
variable pvt_avz_2_out {
    type      = string
    default   = "ap-southeast-1b"

}


#####################    ec2   #############################

variable ami_id_out {
    type      = string
    default   = "ami-065a492fef70f84b1"  
}

variable instance_type_out {
    type      = string
    default   = "t2.micro"
  
}

######################      db      ########################

variable db_username_out {
    type      = string
    default   = "admin"

}

variable db_password_out {
    type      = string
    default   = "admin123"
    sensitive = true

}

variable db_az_out {
    type      = string
    default   = "ap-southeast-1a"

}

######################  alb   ############################

variable alb_type_out {
    type      = string
    default   = "application"
    

}


