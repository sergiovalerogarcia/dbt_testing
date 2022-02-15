{% macro create_dataset(default_columns_and_types, list_values, columns) %}
    -- noqa
    {%- set default_columns = [] -%}
    {%- set types = [] -%}

    {%- for default_column_and_type in default_columns_and_types -%}
        {% do default_columns.append(default_column_and_type.column) -%}
        {% do types.append(default_column_and_type.type) -%}
    {%- endfor %}

    {% if dbt_testing.column_not_found_in_defaults_columns(default_columns, columns) -%}
        select 'Column not exists in default_columns'
    {% else -%}
        {% for values in list_values -%}
            select
            {% if columns and ((columns | length) > 0) -%}
                {{ dbt_testing.create_values_using_columns_and_defaults(default_columns, types, values, columns) }}
            {%- else -%}
                {{ dbt_testing.create_values_using_default_columns(default_columns, types, values) }}
            {%- endif %}
            {%- if not loop.last -%}
                union all
            {% endif %}
        {%- endfor -%}
    {%- endif -%}
{% endmacro %}