resource "aws_dynamodb_table" "this" {
  billing_mode   = "PROVISIONED"
  table_class    = "STANDARD_INFREQUENT_ACCESS"
  hash_key       = "id"
  read_capacity  = 1
  write_capacity = 1
  name           = "manufacture_purchase_entity"
  stream_enabled = false

  attribute {
    name = "id"
    type = "S"
  }

  attribute {
    name = "status"
    type = "S"
  }

  attribute {
    name = "date"
    type = "S"
  }

  global_secondary_index {
    name            = "purchase-status-date-index"
    hash_key        = "status"
    range_key       = "date"
    projection_type = "ALL"
    read_capacity   = 1
    write_capacity  = 10
  }

  ttl {
    attribute_name = "ttl"
    enabled        = true
  }
}