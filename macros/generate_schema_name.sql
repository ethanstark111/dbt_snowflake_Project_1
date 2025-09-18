-- This macros is used to change the name of new custome schema created in model.sql 

{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}
    {%- if custom_schema_name is none -%}

        {{ default_schema }}

    {%- else -%}
    
        {{ custom_schema_name | trim }}

    {%- endif -%}

{%- endmacro %}