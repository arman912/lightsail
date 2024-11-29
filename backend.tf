terraform {
  backend "s3" {
    bucket         = "your-s3-bucket-name"
    key            = "terraform/state"
    region         = "eu-west-2"
    dynamodb_table = "your-dynamodb-table"
  }
}
