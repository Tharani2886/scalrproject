# web server - 1

resource "aws_instance" "web_1" {
  ami                         = var.my_ami
  instance_type               = var.instance_type
  associate_public_ip_address = true # Replace with your SSH key pair name
  # subnet_id = aws_subnet.public_subnet_1.id
  subnet_id              = var.public_subnet_1_ec2
  user_data              = file("${path.module}/web-apps.sh")
  vpc_security_group_ids = [var.public_sg_ec2]
  key_name               = "pemkey2"

  tags = {
    Name = "WebServer_1"
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    password    = ""
    private_key = file("${path.module}/privatekey/pemkey2.pem")
    host        = self.public_ip
  }

  provisioner "file" {
    source      = "${path.module}/apps/index.html"
    destination = "/tmp/index.html"
  }

  provisioner "remote-exec" {
    inline = [
      "sleep 120",
      "sudo cp /tmp/index.html /var/www/html",
    ]

  }

}



# web server - 2

resource "aws_instance" "web_2" {
  ami                         = var.my_ami # Replace with a valid AMI ID for your region
  instance_type               = var.instance_type
  associate_public_ip_address = true # Replace with your SSH key pair name
  subnet_id                   = var.public_subnet_2_ec2
  user_data                   = file("${path.module}/web-apps.sh")
  vpc_security_group_ids      = [var.public_sg_ec2]
  key_name                    = "pemkey2"

  tags = {
    Name = "WebServer_2"
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    password    = ""
    private_key = file("${path.module}/privatekey/pemkey2.pem")
    host        = self.public_ip
  }

  provisioner "file" {
    source      = "${path.module}/apps/index.html"
    destination = "/tmp/index.html"
  }

  provisioner "remote-exec" {
    inline = [
      "sleep 120",
      "sudo cp /tmp/index.html /var/www/html",
    ]

  }

}