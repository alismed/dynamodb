output "dynamodb_table_id" {
  description = "DynamoDB table ID"
  value       = aws_dynamodb_table.items.id
}

output "dynamodb_table_arn" {
  description = "DynamoDB table ARN"
  value       = aws_dynamodb_table.items.arn
}

output "dynamodb_table_name" {
  description = "DynamoDB table name"
  value       = aws_dynamodb_table.items.name
}

output "dynamodb_table_hash_key" {
  description = "DynamoDB table hash key"
  value       = aws_dynamodb_table.items.hash_key
}

output "dynamodb_table_range_key" {
  description = "DynamoDB table range key"
  value       = aws_dynamodb_table.items.range_key
}

output "dynamodb_table_secondary_index" {
  description = "DynamoDB table range key"
  value       = aws_dynamodb_table.items.global_secondary_index
}

output "seeded_items_count" {
  description = "Number of items seeded in the DynamoDB table"
  value       = length(aws_dynamodb_table_item.seed_items)
}

output "seeded_items" {
  description = "Items seeded in the DynamoDB table"
  value       = aws_dynamodb_table_item.seed_items
}