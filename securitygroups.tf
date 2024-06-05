resource "aws_security_group" "web_sg" {
  name   = var.web_sg_name
  vpc_id = module.vpc.vpc_id
  tags = {
    "Name" = var.web_sg_name
  }

}

resource "aws_security_group_rule" "allow_ssh" {
  type              = "ingress"
  from_port         = var.ssh_port
  to_port           = var.ssh_port
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.web_sg.id
}


resource "aws_security_group_rule" "allow_backendmain" {
  type              = "ingress"
  from_port         = var.backendmain_port
  to_port           = var.backendmain_port
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.web_sg.id
}

resource "aws_security_group_rule" "backendauth_port" {
  type              = "ingress"
  from_port         = var.backendauth_port
  to_port           = var.backendauth_port
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.web_sg.id
}

resource "aws_security_group_rule" "backendstorage_port" {
  type              = "ingress"
  from_port         = var.backendstorage_port
  to_port           = var.backendstorage_port
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.web_sg.id
}

resource "aws_security_group_rule" "allow_out" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.web_sg.id
}
resource "aws_security_group_rule" "allow_http" {
  type              = "ingress"
  from_port         = var.http_port
  to_port           = var.http_port
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.web_sg.id
}
resource "aws_security_group_rule" "allow_https" {
  type              = "ingress"
  from_port         = var.https_port
  to_port           = var.https_port
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.web_sg.id
}
