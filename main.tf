provider "aws" {
  region = "us-east-1"
  access_key = "AKIA47CRXMEH72JZY55T"
  secret_key = "ovjTmwy7+tMaEqPUfQjccDiQIb+qKXmHFD9p7Teq"
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