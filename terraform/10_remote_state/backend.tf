terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  required_version = ">= 0.14.9"
  backend "s3" {
    bucket = "my-terraform-state-bucket12"
    key    = "vpc/terraform.tfstate"
    region = "eu-central-1"
    #
    # Encrypt the state file
    # dynamodb_table = "terraform-lock-table"
    # encrypt        = true
  }
}