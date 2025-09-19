-- This is user created file
-- log folder was not present by default. hence creating this file. it will create log folder with dbt.log file
-- Save and run this macro, log file will be created.
-- run ==>  dbt run-operation learn_logging

{%macro learn_logging()%}
    {{log('this is a demo log', info=True)}}
{%endmacro%}

