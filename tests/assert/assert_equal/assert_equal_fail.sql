with
-- given
model as (
    select
        null::int as demo_num,
        null::varchar as demo_string,
        null::float as demo_null,
        null::boolean as demo_bool
    union all
    select
        2::int as demo_num,
        'string2'::varchar as demo_string,
        null::float as demo_null,
        true as demo_bool
    union all
    select
        3::int as demo_num,
        'string3' as demo_string,
        0.32::float as demo_null,
        false as demo_bool
),

no_expected as (
    select
        null::int as demo_num,
        null::varchar as demo_string,
        null::float as demo_null,
        null::boolean as demo_bool
),

-- when

assert as (
    {{ assert_equal(expected='model', actual='no_expected') }}
),

errors as (
    select count(*) as errors
    from assert
)

-- then

select
    *
from errors
where errors != 2
