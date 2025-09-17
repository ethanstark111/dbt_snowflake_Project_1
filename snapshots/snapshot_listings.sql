-- Implemented snapshot with timestamp strategy 

{%snapshot scd_2_for_listings%}
    {{
        config(
            target_schema = 'silver',
            unique_key = 'id',
            strategy = 'timestamp',
            updated_at = 'updated_at',
            invalidate_hard_deletes = True
        )
    }}

    select * from {{source('airbnb_bronze','listings')}}
{%endsnapshot%}
