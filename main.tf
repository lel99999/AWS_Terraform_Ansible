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
# security_group_ids = ["sg-04a6f5b8a76b9f445"]
  key_name = "lel_aws"

  associate_public_ip_address = true

  tags {
    Name = "terraform-devEC2-01"
  }

  provisioner "local-exec" {
# ANSIBLE COMMAND #   $ansible-playbook -u ec2-user --private-key ~/Downloads/lel_aws.pem -i aws_hosts deploy_webserver.yml
    command = "sleep 120; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ec2-user --private-key ~/Downloads/lel_aws.pem -i '${aws_instance.devEC2-01.public_ip},' deploy_webserver.yml"
  }
}

resource "aws_network_interface_sg_attachment" "sg_attachment" {
# security_group_id    = "${aws_security_group.sg.id}"
  security_group_id    = "sg-04a6f5b8a76b9f445"
  network_interface_id = "${aws_instance.devEC2-01.primary_network_interface_id}"
}
  
