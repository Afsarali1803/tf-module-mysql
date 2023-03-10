# Creates Security Group
resource "aws_security_group" "allows_mysql" {
  name               = "roboshop-${var.ENV}-mysql"
  description        = "roboshop-${var.ENV}-mysql"
  vpc_id             = data.terraform_remote_state.vpc.outputs.VPC_ID

  ingress {
    description      = "Allow mysql from default VPC"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = [data.terraform_remote_state.vpc.outputs.DEFAULT_VPC_CIDR]
  }

  ingress {
    description      = "Allow mysql from default VPC"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = [data.terraform_remote_state.vpc.outputs.VPC_CIDR]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "roboshop-${var.ENV}-mysql"
  }
}
