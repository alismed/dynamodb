terraform {
  backend "s3" {
    bucket  = "alismed-terraform"
    key     = "dynamodb/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}