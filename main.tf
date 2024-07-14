provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucketf5"

  tags = {
    Name        = "My bucket 2"
    Environment = "Dev"
  }
}


resource "aws_s3_bucket" "example2" {
  bucket = "my-tf-test-bucketf6"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}