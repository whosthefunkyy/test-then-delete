variable "project_name" {
    type = string
    description = "default_name"
    default = "devops"
}
 variable "vpc_cidr" {
    type = string
    description = "cidr vpc"
    default = "10.0.0.0/16" 
 }
 variable "public_subn" {
   type = string
   description = "cidr for public sub"
   default = "10.0.1.0/24"
 }
 variable "private_subn" {
   type = string
   description = "cidr for private sub"
   default = "10.0.2.0/24"
 }