-- Implementing snapshots with check strategy

{%snapshot scd_2_for_hosts%}
    {{
        config(
            target_schema = 'silver',
            unique_key = 'id',
            strategy= 'check',
            check_cols = ['name'],
            invalidate_hard_deletes = True
        )
    }}

    select * from {{source('airbnb_bronze','hosts')}}
{%endsnapshot%}