terraform {
  backend "s3" {
    bucket         = "your-terraform-state-bucket"
    key            = "cicd-test/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
  }
}