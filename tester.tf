provider "aws" {
# access_key = ""
# secret_key = ""
  region = "us-east-1"
  shared_credentials_file = "~/.aws/creds"
}

# Create an EC2  web resource
#resource "aws_instance" "devWeb01" {
#  ami = "ami-6871a115"
#  instance_type = "t2.micro"
#  count = 3
#  subnet_id = "subnet-24d3dc62"
#  associate_public_ip_address = true

#  tags {
#    Name = "terraform test-instance-${count.index}"
#  }  
#}

resource "aws_instance" "testnodes" {
  ami = "ami-6871a115"
  instance_type= "t2.micro"
  count = 3
  associate_public_ip_address = true

  provisioner "local-exec" {
    command = "echo ${var.test01.name} >> ./aws_hosts"
  }

}
