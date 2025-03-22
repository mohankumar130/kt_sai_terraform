resource "aws_instance" "pub_instance" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = "ecs-key"
  security_groups = [ var.pub_sg ]
  subnet_id = var.pub_sn
  tags = {
    Name = "pub_instance"
  }
}
