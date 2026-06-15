terraform {
  required_version = "> 1.8.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.49.0"
    }
  }
  backend "s3" {
    bucket = "my-terra-bucckk"
    key = "dec-2025/terraform.tfstate"
    region = "ap-south-1"
    encrypt = true
    use_lockfile = true
  }
  
}