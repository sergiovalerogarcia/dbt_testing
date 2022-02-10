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
        columns=['"Column1"', '"no_exist_colum"',],
    )}}
),

-- then
expected as (
    select 'Column not exists in default_columns'
),

assert as (
    {{ assert_equal(expected='expected', actual='dataset') }}
)

select
    *
from assert
