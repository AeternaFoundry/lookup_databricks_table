data "databricks_table" "table_lookup" {
  for_each = var.table_lookup

  name = each.value.name

  dynamic "provider_config" {
    for_each = each.value.provider_config != null ? [each.value.provider_config] : []
    content {
      workspace_id = provider_config.value.workspace_id
    }
  }

  dynamic "table_info" {
    for_each = each.value.table_info != null ? [each.value.table_info] : []
    content {
      access_point = table_info.value.access_point
      browse_only  = table_info.value.browse_only
      catalog_name = table_info.value.catalog_name
      dynamic "columns" {
        for_each = table_info.value.columns != null ? table_info.value.columns : []
        content {
          comment = columns.value.comment
          dynamic "mask" {
            for_each = columns.value.mask != null ? [columns.value.mask] : []
            content {
              function_name = mask.value.function_name
              dynamic "using_arguments" {
                for_each = mask.value.using_arguments != null ? mask.value.using_arguments : []
                content {
                  column   = using_arguments.value.column
                  constant = using_arguments.value.constant
                }
              }
              using_column_names = mask.value.using_column_names
            }
          }
          name               = columns.value.name
          nullable           = columns.value.nullable
          partition_index    = columns.value.partition_index
          position           = columns.value.position
          type_interval_type = columns.value.type_interval_type
          type_json          = columns.value.type_json
          type_name          = columns.value.type_name
          type_precision     = columns.value.type_precision
          type_scale         = columns.value.type_scale
          type_text          = columns.value.type_text
        }
      }
      comment                      = table_info.value.comment
      created_at                   = table_info.value.created_at
      created_by                   = table_info.value.created_by
      data_access_configuration_id = table_info.value.data_access_configuration_id
      data_source_format           = table_info.value.data_source_format
      deleted_at                   = table_info.value.deleted_at
      dynamic "delta_runtime_properties_kvpairs" {
        for_each = table_info.value.delta_runtime_properties_kvpairs != null ? [table_info.value.delta_runtime_properties_kvpairs] : []
        content {
          delta_runtime_properties = delta_runtime_properties_kvpairs.value.delta_runtime_properties
        }
      }
      dynamic "effective_predictive_optimization_flag" {
        for_each = table_info.value.effective_predictive_optimization_flag != null ? [table_info.value.effective_predictive_optimization_flag] : []
        content {
          inherited_from_name = effective_predictive_optimization_flag.value.inherited_from_name
          inherited_from_type = effective_predictive_optimization_flag.value.inherited_from_type
          value               = effective_predictive_optimization_flag.value.value
        }
      }
      enable_predictive_optimization = table_info.value.enable_predictive_optimization
      dynamic "encryption_details" {
        for_each = table_info.value.encryption_details != null ? [table_info.value.encryption_details] : []
        content {
          dynamic "sse_encryption_details" {
            for_each = encryption_details.value.sse_encryption_details != null ? [encryption_details.value.sse_encryption_details] : []
            content {
              algorithm       = sse_encryption_details.value.algorithm
              aws_kms_key_arn = sse_encryption_details.value.aws_kms_key_arn
            }
          }
        }
      }
      full_name    = table_info.value.full_name
      metastore_id = table_info.value.metastore_id
      name         = table_info.value.name
      owner        = table_info.value.owner
      pipeline_id  = table_info.value.pipeline_id
      properties   = table_info.value.properties
      dynamic "row_filter" {
        for_each = table_info.value.row_filter != null ? [table_info.value.row_filter] : []
        content {
          function_name = row_filter.value.function_name
          dynamic "input_arguments" {
            for_each = row_filter.value.input_arguments != null ? row_filter.value.input_arguments : []
            content {
              column   = input_arguments.value.column
              constant = input_arguments.value.constant
            }
          }
          input_column_names = row_filter.value.input_column_names
        }
      }
      schema_name = table_info.value.schema_name
      dynamic "securable_kind_manifest" {
        for_each = table_info.value.securable_kind_manifest != null ? [table_info.value.securable_kind_manifest] : []
        content {
          assignable_privileges = securable_kind_manifest.value.assignable_privileges
          capabilities          = securable_kind_manifest.value.capabilities
          dynamic "options" {
            for_each = securable_kind_manifest.value.options != null ? securable_kind_manifest.value.options : []
            content {
              allowed_values = options.value.allowed_values
              default_value  = options.value.default_value
              description    = options.value.description
              hint           = options.value.hint
              is_copiable    = options.value.is_copiable
              is_creatable   = options.value.is_creatable
              is_hidden      = options.value.is_hidden
              is_loggable    = options.value.is_loggable
              is_required    = options.value.is_required
              is_secret      = options.value.is_secret
              is_updatable   = options.value.is_updatable
              name           = options.value.name
              oauth_stage    = options.value.oauth_stage
              type           = options.value.type
            }
          }
          securable_kind = securable_kind_manifest.value.securable_kind
          securable_type = securable_kind_manifest.value.securable_type
        }
      }
      sql_path                = table_info.value.sql_path
      storage_credential_name = table_info.value.storage_credential_name
      storage_location        = table_info.value.storage_location
      dynamic "table_constraints" {
        for_each = table_info.value.table_constraints != null ? table_info.value.table_constraints : []
        content {
          dynamic "foreign_key_constraint" {
            for_each = table_constraints.value.foreign_key_constraint != null ? [table_constraints.value.foreign_key_constraint] : []
            content {
              child_columns  = foreign_key_constraint.value.child_columns
              name           = foreign_key_constraint.value.name
              parent_columns = foreign_key_constraint.value.parent_columns
              parent_table   = foreign_key_constraint.value.parent_table
              rely           = foreign_key_constraint.value.rely
            }
          }
          dynamic "named_table_constraint" {
            for_each = table_constraints.value.named_table_constraint != null ? [table_constraints.value.named_table_constraint] : []
            content {
              name = named_table_constraint.value.name
            }
          }
          dynamic "primary_key_constraint" {
            for_each = table_constraints.value.primary_key_constraint != null ? [table_constraints.value.primary_key_constraint] : []
            content {
              child_columns      = primary_key_constraint.value.child_columns
              name               = primary_key_constraint.value.name
              rely               = primary_key_constraint.value.rely
              timeseries_columns = primary_key_constraint.value.timeseries_columns
            }
          }
        }
      }
      table_id        = table_info.value.table_id
      table_type      = table_info.value.table_type
      updated_at      = table_info.value.updated_at
      updated_by      = table_info.value.updated_by
      view_definition = table_info.value.view_definition
      dynamic "view_dependencies" {
        for_each = table_info.value.view_dependencies != null ? [table_info.value.view_dependencies] : []
        content {
          dynamic "dependencies" {
            for_each = view_dependencies.value.dependencies != null ? view_dependencies.value.dependencies : []
            content {
              dynamic "connection" {
                for_each = dependencies.value.connection != null ? [dependencies.value.connection] : []
                content {
                  connection_name = connection.value.connection_name
                }
              }
              dynamic "credential" {
                for_each = dependencies.value.credential != null ? [dependencies.value.credential] : []
                content {
                  credential_name = credential.value.credential_name
                }
              }
              dynamic "function" {
                for_each = dependencies.value.function != null ? [dependencies.value.function] : []
                content {
                  function_full_name = function.value.function_full_name
                }
              }
              dynamic "table" {
                for_each = dependencies.value.table != null ? [dependencies.value.table] : []
                content {
                  table_full_name = table.value.table_full_name
                }
              }
            }
          }
        }
      }
    }
  }
}

