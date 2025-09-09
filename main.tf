provider "aws" {
  region = "us-west-1"
}

# Get the default VPC
data "aws_vpc" "default" {
  default = true
}

# Create security group with all ports open
resource "aws_security_group" "open_all" {
  name        = "open-all-ports"
  description = "Security group with all ports open"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "open-all-ports"
  }
}
