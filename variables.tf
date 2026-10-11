variable "table_lookup" {
  description = <<EOT
Map of table_lookup, attributes below
Required:
    - name
Optional:
    - provider_config (block):
        - workspace_id (optional)
    - table_info (block):
        - access_point (optional)
        - browse_only (optional)
        - catalog_name (optional)
        - columns (optional, block):
            - comment (optional)
            - mask (optional, block):
                - function_name (optional)
                - using_arguments (optional, block):
                    - column (optional)
                    - constant (optional)
                - using_column_names (optional)
            - name (optional)
            - nullable (optional)
            - partition_index (optional)
            - position (optional)
            - type_interval_type (optional)
            - type_json (optional)
            - type_name (optional)
            - type_precision (optional)
            - type_scale (optional)
            - type_text (optional)
        - comment (optional)
        - created_at (optional)
        - created_by (optional)
        - data_access_configuration_id (optional)
        - data_source_format (optional)
        - deleted_at (optional)
        - delta_runtime_properties_kvpairs (optional, block):
            - delta_runtime_properties (required)
        - effective_predictive_optimization_flag (optional, block):
            - inherited_from_name (optional)
            - inherited_from_type (optional)
            - value (required)
        - enable_predictive_optimization (optional)
        - encryption_details (optional, block):
            - sse_encryption_details (optional, block):
                - algorithm (optional)
                - aws_kms_key_arn (optional)
        - full_name (optional)
        - metastore_id (optional)
        - name (optional)
        - owner (optional)
        - pipeline_id (optional)
        - properties (optional)
        - row_filter (optional, block):
            - function_name (required)
            - input_arguments (optional, block):
                - column (optional)
                - constant (optional)
            - input_column_names (required)
        - schema_name (optional)
        - securable_kind_manifest (optional, block):
            - assignable_privileges (optional)
            - capabilities (optional)
            - options (optional, block):
                - allowed_values (optional)
                - default_value (optional)
                - description (optional)
                - hint (optional)
                - is_copiable (optional)
                - is_creatable (optional)
                - is_hidden (optional)
                - is_loggable (optional)
                - is_required (optional)
                - is_secret (optional)
                - is_updatable (optional)
                - name (optional)
                - oauth_stage (optional)
                - type (optional)
            - securable_kind (optional)
            - securable_type (optional)
        - sql_path (optional)
        - storage_credential_name (optional)
        - storage_location (optional)
        - table_constraints (optional, block):
            - foreign_key_constraint (optional, block):
                - child_columns (required)
                - name (required)
                - parent_columns (required)
                - parent_table (required)
                - rely (optional)
            - named_table_constraint (optional, block):
                - name (required)
            - primary_key_constraint (optional, block):
                - child_columns (required)
                - name (required)
                - rely (optional)
                - timeseries_columns (optional)
        - table_id (optional)
        - table_type (optional)
        - updated_at (optional)
        - updated_by (optional)
        - view_definition (optional)
        - view_dependencies (optional, block):
            - dependencies (optional, block):
                - connection (optional, block):
                    - connection_name (optional)
                - credential (optional, block):
                    - credential_name (optional)
                - function (optional, block):
                    - function_full_name (required)
                - table (optional, block):
                    - table_full_name (required)
EOT

  type = map(object({
    name = string
    provider_config = optional(object({
      workspace_id = optional(string)
    }))
    table_info = optional(object({
      access_point = optional(string)
      browse_only  = optional(bool)
      catalog_name = optional(string)
      columns = optional(list(object({
        comment = optional(string)
        mask = optional(object({
          function_name = optional(string)
          using_arguments = optional(list(object({
            column   = optional(string)
            constant = optional(string)
          })))
          using_column_names = optional(list(string))
        }))
        name               = optional(string)
        nullable           = optional(bool)
        partition_index    = optional(number)
        position           = optional(number)
        type_interval_type = optional(string)
        type_json          = optional(string)
        type_name          = optional(string)
        type_precision     = optional(number)
        type_scale         = optional(number)
        type_text          = optional(string)
      })))
      comment                      = optional(string)
      created_at                   = optional(number)
      created_by                   = optional(string)
      data_access_configuration_id = optional(string)
      data_source_format           = optional(string)
      deleted_at                   = optional(number)
      delta_runtime_properties_kvpairs = optional(object({
        delta_runtime_properties = map(string)
      }))
      effective_predictive_optimization_flag = optional(object({
        inherited_from_name = optional(string)
        inherited_from_type = optional(string)
        value               = string
      }))
      enable_predictive_optimization = optional(string)
      encryption_details = optional(object({
        sse_encryption_details = optional(object({
          algorithm       = optional(string)
          aws_kms_key_arn = optional(string)
        }))
      }))
      full_name    = optional(string)
      metastore_id = optional(string)
      name         = optional(string)
      owner        = optional(string)
      pipeline_id  = optional(string)
      properties   = optional(map(string))
      row_filter = optional(object({
        function_name = string
        input_arguments = optional(list(object({
          column   = optional(string)
          constant = optional(string)
        })))
        input_column_names = list(string)
      }))
      schema_name = optional(string)
      securable_kind_manifest = optional(object({
        assignable_privileges = optional(list(string))
        capabilities          = optional(list(string))
        options = optional(list(object({
          allowed_values = optional(list(string))
          default_value  = optional(string)
          description    = optional(string)
          hint           = optional(string)
          is_copiable    = optional(bool)
          is_creatable   = optional(bool)
          is_hidden      = optional(bool)
          is_loggable    = optional(bool)
          is_required    = optional(bool)
          is_secret      = optional(bool)
          is_updatable   = optional(bool)
          name           = optional(string)
          oauth_stage    = optional(string)
          type           = optional(string)
        })))
        securable_kind = optional(string)
        securable_type = optional(string)
      }))
      sql_path                = optional(string)
      storage_credential_name = optional(string)
      storage_location        = optional(string)
      table_constraints = optional(list(object({
        foreign_key_constraint = optional(object({
          child_columns  = list(string)
          name           = string
          parent_columns = list(string)
          parent_table   = string
          rely           = optional(bool)
        }))
        named_table_constraint = optional(object({
          name = string
        }))
        primary_key_constraint = optional(object({
          child_columns      = list(string)
          name               = string
          rely               = optional(bool)
          timeseries_columns = optional(list(string))
        }))
      })))
      table_id        = optional(string)
      table_type      = optional(string)
      updated_at      = optional(number)
      updated_by      = optional(string)
      view_definition = optional(string)
      view_dependencies = optional(object({
        dependencies = optional(list(object({
          connection = optional(object({
            connection_name = optional(string)
          }))
          credential = optional(object({
            credential_name = optional(string)
          }))
          function = optional(object({
            function_full_name = string
          }))
          table = optional(object({
            table_full_name = string
          }))
        })))
      }))
    }))
  }))
}

