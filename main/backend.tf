terraform {
  backend "s3" {
    bucket         = "prashant-s3-demo-abc"
    key            = "prashant/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
