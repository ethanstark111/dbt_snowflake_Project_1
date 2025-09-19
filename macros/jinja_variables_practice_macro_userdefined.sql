-- We can provide values for jinja variables in following ways

-- 1. {% set username = "Rutik" %}
-- 2. We can add vars: section in dbt_project.yml
-- 3. using cmd, when calling the macro
-- dbt run-operation show_my_name_on_log --vars '{name: "Shekhar"}'


{%macro show_my_name_on_log()%}
    -- Enable this when not providing values using cmd
    {%set default_name='Default User'%}
    {{ log("Hello Everyone, I am " ~var('name', default_name),info=True)}}
{%endmacro%}



-- This macro first look for the value in run-operation command
-- if it is not there, then check in dbt_project.yml under vars section
-- if not present there then uses default_value
-- if default_value is not present then compilation error.