-- This macro can be called in any model/model_name.sql file or tests/singular_test_name.sql file

{%macro no_null_columns(model)%}
    select * from {{model}}
    where
        {%for col in adapter.get_columns_in_relation(model)%}
            {{col.column}} IS NULL OR
        {%endfor%}
            FALSE
{%endmacro%}