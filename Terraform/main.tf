provider "aws" {
  region = "us-east-1"

}

# Research the VPC for things needed later on
# Find a public subnet in the given VPC
data "aws_subnets" "public_subnets" {
  filter {
    name   = "vpc-id"
    values = ["vpc-044604d0bfb707142"]
  }
}
#fixed this above, because it broke for me.

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


### from the Assignment - Create SSH key pair
# Generate an SSH key pair
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Save the private key locally
resource "local_file" "private_key" {
  content         = tls_private_key.ssh_key.private_key_pem
  filename        = "${path.module}/builder_key.pem"
  file_permission = "0600"
}

# Create an AWS key pair using the public key
resource "aws_key_pair" "builder_key" {
  key_name   = "builder-key-rotem-meron"
  public_key = tls_private_key.ssh_key.public_key_openssh
}


## Now we are ready to build the aws instance

resource "aws_instance" "builder" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = "t3.medium"
  subnet_id                   = data.aws_subnets.public_subnets.ids[0]
  key_name                    = aws_key_pair.builder_key.key_name
  associate_public_ip_address = true

  vpc_security_group_ids = [aws_security_group.builder_sg.id]

  tags = {
    Name = "builder"
  }

  user_data = file("setup.sh") # installs Docker & Docker Compose

  ## Remote-exec provisioner for Docker and Docker Compose installation
  ## EXTRA POINTS in part 2
  provisioner "remote-exec" {
      inline = [
        "sudo yum update -y",
        "sudo amazon-linux-extras install docker -y",
        "sudo service docker start",
        "sudo usermod -aG docker ec2-user",
        "sudo curl -L \"https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)\" -o /usr/local/bin/docker-compose",
        "sudo chmod +x /usr/local/bin/docker-compose",
        "docker --version",
        "docker-compose --version"
      ]

      connection {
        type        = "ssh"
        user        = "ec2-user"
        private_key = tls_private_key.ssh_key.private_key_pem
        host        = self.public_ip
      }
    }

}

resource "aws_security_group" "builder_sg" {
  name        = "builder-sg-rotem-meron"
  description = "Allow SSH and HTTP for app"
  vpc_id      = "vpc-044604d0bfb707142"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip_cidr]  # just my IP only (see variables)
  }

  ingress {
    description = "HTTP App"
    from_port   = 5001
    to_port     = 5001
    protocol    = "tcp"
    cidr_blocks = [var.my_ip_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


