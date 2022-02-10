with
-- given
dataset as (
    {{ create_dataset(
        default_columns_and_types=[
            { 'column': '"Column1"',    'type': 'int' },
            { 'column': '"column 2"',   'type': 'varchar' },
            { 'column': '"column(3)"',  'type': 'float' },
            { 'column': 'column_4',     'type': 'varchar' },
        ],
        list_values=[
            [1, 'text', None, 'text'],
            [2, 'text', 1.36489, None],
        ],
        columns=['"Column1"', '"column 2"',],
    )}}
),

-- then
expected as (
    select
        1::int as "Column1",
        'text'::varchar as "column 2",
        null::float as "column3",
        null::varchar as column_4
    union all
    select
        2::int as "Column1",
        'text'::varchar as "column 2",
        null::float as "column3",
        null::varchar as column_4
),

assert as (
    {{ assert_equal(expected='expected', actual='dataset') }}
)

select
    *
from assert
