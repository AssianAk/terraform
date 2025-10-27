resource "aws_s3_bucket" "name" {
    bucket = "mynewbucketforstatefile"
}

resource "aws_dynamodb_table" "dynamodb-for-state-file-lock" {
  name = "terraform-state-lock-dyname"
  hash_key = "akash"
  read_capacity = 20
  write_capacity = 20

  attribute {
    name = "akash"
    type = "S"
  }
}