
#vpc

resource "aws_vpc" "myvpc" {
  cidr_block = var.cidr_vpc

  tags = {
    Name = "vpc"
  }
}


#subnets
#public_subnet_1
resource "aws_subnet" "public_subnet_1" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.pub_sub_1
  availability_zone = var.pub_avz_1

  tags = {
    Name = "public_subnet_1"
  }
}


#public_subnet_2
resource "aws_subnet" "public_subnet_2" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.pub_sub_2
  availability_zone = var.pub_avz_2

  tags = {
    Name = "public_subnet_2"
  }
}

#private_subnet_1
resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.pvt_sub_1
  availability_zone = var.pvt_avz_1

  tags = {
    Name = "private_subnet_1"
  }
}

#private_subnet_2

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.pvt_sub_2
  availability_zone = var.pvt_avz_2

  tags = {
    Name = "private_subnet_2"
  }
}

#Internet gateway

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "Internet gateway"
  }
}


#EIP -1

resource "aws_eip" "eip_1" {
  vpc = true

  tags = {
    Name = "example-eip-1"
  }
}
# EIP -2

resource "aws_eip" "eip_2" {
  vpc = true

  tags = {
    Name = "example-eip-2"
  }
}



#NAT Gateway -1

resource "aws_nat_gateway" "nat_1" {
  allocation_id = aws_eip.eip_1.id
  subnet_id     = aws_subnet.public_subnet_1.id

  tags = {
    Name = "NAT gw - 1"
  }
}
# Nat Gateway -2

resource "aws_nat_gateway" "nat_2" {
  allocation_id = aws_eip.eip_2.id
  subnet_id     = aws_subnet.public_subnet_2.id

  tags = {
    Name = "NAT gw - 2"
  }
}

#RT
# public_rt_1

resource "aws_route_table" "public_rt_1" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public_rt_1"
  }
}

# public_rt_2

resource "aws_route_table" "public_rt_2" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public_rt_2"
  }
}

# private_rt_1

resource "aws_route_table" "private_rt_1" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_1.id
  }

  tags = {
    Name = "private_rt_1"
  }
}

# private_rt_2

resource "aws_route_table" "private_rt_2" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_2.id
  }

  tags = {
    Name = "private_rt_2"
  }
}


#RT association
# public_rt_ass1

resource "aws_route_table_association" "public_rt_ass1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_rt_1.id
}

# public_rt_ass2

resource "aws_route_table_association" "public_rt_ass2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_rt_2.id
}

# private_rt_ass1

resource "aws_route_table_association" "private_rt_ass1" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_rt_1.id
}

# private_rt_ass2

resource "aws_route_table_association" "private_rt_ass2" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_rt_2.id
}

#Sg
# public sg

resource "aws_security_group" "public_sg" {
  name   = "allow_ssh_http"
  vpc_id = aws_vpc.myvpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}


# private sg

resource "aws_security_group" "private_sg" {
  name   = "allow_ssh_http_mysql"
  vpc_id = aws_vpc.myvpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }



  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}
