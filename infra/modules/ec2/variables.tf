variable "project_name" {
  type = string
  default = "devops"
}
variable "instance_type" {
  type = string
  default = "t2.micro"
}
variable "vpc_id" {
    type = string
    description = "from vpc module"
  
}
variable "subnet_id" {
  type = string
  description = "from vpc module"
}
variable "key_name" {
  type = string
  default = "devops-key"
}
