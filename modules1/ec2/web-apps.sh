#!/bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo systemctl enable httpd
sudo service httpd start  
echo "<h1> this is color changing app $(hostname) </h1> " > /var/www/html/index.html