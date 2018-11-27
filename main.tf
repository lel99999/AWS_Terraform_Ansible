provider "aws" {
# access_key = ""
# secret_key = ""
  region = "us-east-1"
  shared_credentials_file = "~/.aws/creds"
}

# Create an EC2 resource
resource "aws_instance" "devEC2-01" {
  ami = "ami-6871a115"
  instance_type = "t2.micro"
# count = 3
# subnet_id = "subnet-24d3dc62"
  subnet_id = "subnet-1ceae25a"
  key_name = "lel_aws"
  
resource "aws_security_group" "selected" {
#  default = "sg-04a6f5b8a76b9f445"
  name = "terraform-default"
}
  
  associate_public_ip_address = true

  tags {
    Name = "terraform-devEC2-01"
  }
}

#resource "aws_security_group" "instance" {
#  name = "terraform-devEC2-01"
#
#  ingress {
#    from_port = 8080
#    to_port = 8080
#    protocol = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#
#  ingress {
#    from_port = 22
#    to_port = 22
#    protocol = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#
#  ingress {
#    from_port = 80
#    to_port = 80
#    protocol = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#
#  egress {
#    from_port = 80
#    to_port = 80
#    protocol = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#
#  ingress {
#    from_port = 443
#    to_port = 443
#    protocol = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#
#  egress {
#    from_port = 443
#    to_port = 443
#    protocol = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#}
#
#output "public_ip" {
#  value = "${aws_instance.devEC2-01.public_ip}"
#}
