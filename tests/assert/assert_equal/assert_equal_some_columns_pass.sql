with
-- given
model as (
    select
        null::int as demo_num,
        null::varchar as "Demo.String",
        null::float as demo_null,
        null::boolean as demo_bool
    union all
    select
        2::int as demo_num,
        'string2'::varchar as "Demo.String",
        null::float as demo_null,
        true as demo_bool
    union all
    select
        3::int as demo_num,
        'string3' as "Demo.String",
        0.32::float as demo_null,
        false as demo_bool
),

model_only_some_columns_are_equal as (
    select
        null::int as demo_num,
        null::varchar as "Demo.String",
        null::float as demo_null,
        true::boolean as demo_bool
    union all
    select
        2::int as demo_num,
        'string2'::varchar as "Demo.String",
        null::float as demo_null,
        false as demo_bool
    union all
    select
        3::int as demo_num,
        'string3' as "Demo.String",
        0.32::float as demo_null,
        true as demo_bool
),

-- then
assert as (
    {{ assert_equal(
        expected='model',
        actual='model_only_some_columns_are_equal',
        columns=['demo_num', '"Demo.String"', 'demo_null'],
    ) }}
)

select
    *
from assert
