resource "aws_dynamodb_table" "items" {
  name           = var.table_name
  billing_mode   = var.billing_mode
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity
  hash_key       = "Id"
  range_key      = "Region"

  point_in_time_recovery {
    enabled = true
  }

  ttl {
    enabled        = true
    attribute_name = var.ttl_attribute
  }

  attribute {
    name = "Id"
    type = "S"
  }

  attribute {
    name = "Name"
    type = "S"
  }

  attribute {
    name = "Region"
    type = "N"
  }

  attribute {
    name = "description"
    type = "S"
  }

  dynamic "global_secondary_index" {
    for_each = var.gsi_config
    content {
      name               = global_secondary_index.key
      hash_key           = global_secondary_index.value.hash_key
      range_key          = global_secondary_index.value.range_key
      write_capacity     = global_secondary_index.value.write_capacity
      read_capacity      = global_secondary_index.value.read_capacity
      projection_type    = global_secondary_index.value.projection_type
      non_key_attributes = global_secondary_index.value.non_key_attributes
    }
  }

  tags = var.tags
}
