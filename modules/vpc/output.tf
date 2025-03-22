output "vpc_id" {
  value = aws_vpc.demo_vpc.id
}

output "sub_id" {
  value = aws_subnet.pub_sn1.id
}