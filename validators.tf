# KeyPair
resource "aws_key_pair" "validator" {
  key_name   = var.ssh_key_name
  public_key = var.ssh_public_key
}

# Validators Security Group

resource "aws_security_group" "validator_sg_443" {
  name        = "Validators Traffic SecurityGroup"
  description = "Allow inbound and outbound traffic to/from validators nodes"
  vpc_id      = module.vpc.vpc_id


  ingress {
    description     = "SSH"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description     = "HTTP"
    type            = "ingress"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description     = "HTTPS"
    type            = "ingress"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description     = "libp2p"
    type            = "ingress"
    from_port       = 30333
    to_port         = 30333
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
    description     = "vpn/wire-gaurd"
    type            = "ingress"
    from_port       = 51820
    to_port         = 51820
    protocol        = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    type            = "ingress"
    from_port       = 9100
    to_port         = 9100
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Outbound Internet Traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Validators Traffic SecurityGroup"
  }
}



# Validators Instances




# Create Instances


# Validators

