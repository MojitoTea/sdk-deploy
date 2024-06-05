provider "aws" {
  region  = "us-east-1"
  profile = "terraform"
}

resource "aws_key_pair" "id_rsa" {
  key_name   = "id_rsa"
  public_key = file("E:\\keypair\\id_rsa.pub")
}


data "template_file" "userdata" {
  template = file("./scripts/install.sh")
  vars = {
    vpc_id = module.vpc.vpc_id
  }
}


# ------------------------------------------------------------------------------
# BACKEND EC2
# ------------------------------------------------------------------------------

resource "aws_instance" "backendonee" {
  instance_type               = var.instance_type
  ami                         = var.ami
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  subnet_id                   = element(module.vpc.private_subnets, 0)
  availability_zone           = element(module.vpc.azs, 0)
  associate_public_ip_address = true
  user_data                   = data.template_file.userdata.rendered

  root_block_device {
    volume_size = 20 # Set the desired root volume size in GB
  }

  key_name = aws_key_pair.id_rsa.key_name
  tags = {
    Name        = "Backend Main"
    Environment = "Dev"
  }
}
