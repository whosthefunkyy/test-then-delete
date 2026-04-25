output "vpc_id" {
    description = "vpc_id"
    value = aws_vpc.main_vpc.id
}
output "public_subnet_id" {
    description = "public subnet id"
    value = aws_subnet.public_subnet.id
  
}