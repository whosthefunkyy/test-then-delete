terraform {
  backend "s3" {
    bucket         = "devops-popa-2026"
    key            = "cicd-test/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
  }
}