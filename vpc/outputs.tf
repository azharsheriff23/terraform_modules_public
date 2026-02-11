output "vpc_id" {
  value = aws_vpc.kpvpctest.id
}
output "subnet_id" {
  value = aws_subnet.kppubsub1.id
}