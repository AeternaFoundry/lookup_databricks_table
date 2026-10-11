output "table_lookup_id" {
  description = "Map of id values across all table_lookup, keyed the same as var.table_lookup except keys with no id are omitted"
  value       = { for k, v in data.databricks_table.table_lookup : k => v.id if v.id != null && length(v.id) > 0 }
}
output "table_lookup_name" {
  description = "Map of name values across all table_lookup, keyed the same as var.table_lookup except keys with no name are omitted"
  value       = { for k, v in data.databricks_table.table_lookup : k => v.name if v.name != null && length(v.name) > 0 }
}
output "table_lookup_provider_config" {
  description = "Map of provider_config values across all table_lookup, keyed the same as var.table_lookup except keys with no provider_config are omitted"
  value       = { for k, v in data.databricks_table.table_lookup : k => one(v.provider_config) if v.provider_config != null && length(v.provider_config) > 0 }
}
output "table_lookup_table_info" {
  description = "Map of table_info values across all table_lookup, keyed the same as var.table_lookup except keys with no table_info are omitted"
  value       = { for k, v in data.databricks_table.table_lookup : k => one(v.table_info) if v.table_info != null && length(v.table_info) > 0 }
}

