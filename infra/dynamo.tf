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