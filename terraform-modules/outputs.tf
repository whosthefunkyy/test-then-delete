output "ec2_id" {
  value = module.ec2.instance_id
}
output "vpc_id" {
  value = module.vpc.vpc_id
}
output "public_ip" {
  value = aws_eip.static_ip.public_ip
}