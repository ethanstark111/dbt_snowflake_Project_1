-- This is also singular testcase, here we are calling macro (which contains query) instead of writing query here
-- We are using/calling user created macro from macros folder

{{ no_null_columns(ref("listings_model"))}}