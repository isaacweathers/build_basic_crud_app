terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  cloud {
    organization = "isaacweathersnet"
    ## Required for Terraform Enterprise; Defaults to app.terraform.io for Terraform Cloud
    hostname = "app.terraform.io"

    workspaces {
      tags = ["build_basic_crud_app"]
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-west-2"
}


resource "aws_dynamodb_table" "example" {
  name           = "http-crud-tutorial"
  billing_mode   = "PROVISIONED"
  hash_key       = "id"
  attribute {
    name = "id"
    type = "N"
  }
  read_capacity  = 5
  write_capacity = 5
  tags = {
    Name        = "dynamodb-table-1"
    Environment = "dev"
  }
}
