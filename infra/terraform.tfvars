region  = "us-east-1"
profile = "default"
tags = {
  Name        = "Items"
  Description = "Items to be processed"
  Environment = "Production"
}
destroy_infra = false

var_seed_items = [
  {
    Id          = "1"
    Region      = 1
    Name        = "Item 1"
    description = "Item 1 description"
  },
  {
    Id          = "2"
    Region      = 1
    Name        = "Item 2"
    description = "Item 2 description"
  },
  {
    Id          = "3"
    Region      = 2
    Name        = "Item 3"
    description = "Item 3 description"
  },
  {
    Id          = "4"
    Region      = 2
    Name        = "Item 4"
    description = "Item 4 description"
  },
  {
    Id          = "5"
    Region      = 3
    Name        = "Item 5"
    description = "Item 5 description"
  }
]
