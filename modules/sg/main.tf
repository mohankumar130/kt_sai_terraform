resource "aws_security_group" "pub_sg" {
  vpc_id = var.vpc_id
  name = "pub_sg"
  description = "pub_sg"
}

resource "aws_vpc_security_group_ingress_rule" "bastion" {
    security_group_id = aws_security_group.pub_sg.id
    cidr_ipv4 = var.sg_cidr_block[0]
    from_port = 22
    ip_protocol = "tcp"
    to_port = 22
    description = "ssh-any-where"
}

resource "aws_vpc_security_group_egress_rule" "bastion_egress" {
    security_group_id = aws_security_group.pub_sg.id
    cidr_ipv4 = var.sg_cidr_block[0]
    ip_protocol = "-1"
    description = "all-traffic"
}