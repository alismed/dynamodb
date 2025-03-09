resource "aws_dynamodb_table_item" "seed_items" {
  for_each = { for idx, item in var.var_seed_items : idx => item }

  table_name = aws_dynamodb_table.items.name
  hash_key   = "Id"
  range_key  = "Region"

  item = jsonencode({
    Id = {
      S = each.value.Id
    }
    Region = {
      N = tostring(each.value.Region)
    }
    Name = {
      S = each.value.Name
    }
    description = {
      S = each.value.description
    }
  })

  depends_on = [aws_dynamodb_table.items]
}