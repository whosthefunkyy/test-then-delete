resource "aws_security_group" "sg" {
    vpc_id = var.vpc_id
}
resource "aws_vpc_security_group_ingress_rule" "ssh" {
   security_group_id = aws_security_group.sg.id
   cidr_ipv4 = "0.0.0.0/0"
   ip_protocol = "tcp"
   from_port = 22
   to_port = 22
}
resource "aws_vpc_security_group_ingress_rule" "web" {
   security_group_id = aws_security_group.sg.id
   cidr_ipv4 = "0.0.0.0/0"
   ip_protocol = "tcp"
   from_port = 80
   to_port = 80
}
resource "aws_vpc_security_group_egress_rule" "internet" {
   security_group_id = aws_security_group.sg.id
   cidr_ipv4 = "0.0.0.0/0"
   ip_protocol = "-1"
   
}
data "aws_ami" "example" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}
resource "aws_instance" "ec2" {
    ami = data.aws_ami.example.id
    vpc_security_group_ids = [aws_security_group.sg.id]
    subnet_id = var.subnet_id
    instance_type = var.instance_type
    key_name = var.key_name
    tags = {
        Name = "${var.project_name}-ec2"
    }
}
