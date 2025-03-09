variable "region" {
  description = "The AWS region to deploy in"
  type        = string
  default     = "us-east-1"
}

variable "profile" {
  description = "Define the aws profile"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags for DynamoDB table"
  type        = map(string)
  default = {
    Name        = ""
    Description = ""
    Environment = ""
  }
}

variable "var_seed_items" {
  type = list(object({
    Id          = string
    Region      = number
    Name        = string
    description = string
  }))
}

variable "table_name" {
  description = "Name of the DynamoDB table"
  type        = string
  default     = "Items"
}

variable "billing_mode" {
  description = "DynamoDB billing mode"
  type        = string
  default     = "PROVISIONED"
}

variable "read_capacity" {
  description = "Read capacity units"
  type        = number
  default     = 1
}

variable "write_capacity" {
  description = "Write capacity units"
  type        = number
  default     = 1
}

variable "ttl_attribute" {
  description = "TTL attribute name"
  type        = string
  default     = "ExpirationTime"
}

variable "gsi_config" {
  description = "Configuration for Global Secondary Indexes"
  type = map(object({
    hash_key           = string
    range_key          = string
    write_capacity     = number
    read_capacity      = number
    projection_type    = string
    non_key_attributes = optional(list(string))
  }))
  default = {
    RegionIndex = {
      hash_key           = "Region"
      range_key          = "Name"
      write_capacity     = 1
      read_capacity      = 1
      projection_type    = "INCLUDE"
      non_key_attributes = ["Id"]
    }
    DescriptionIndex = {
      hash_key        = "description"
      range_key       = "Id"
      write_capacity  = 1
      read_capacity   = 1
      projection_type = "ALL"
    }
  }
}