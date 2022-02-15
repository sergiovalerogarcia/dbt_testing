{% macro create_column_value_with_type(value, type, column) %}
    {%- if value is none -%}
        {{ 'null::' ~ type ~ ' as ' ~ column }}
    {%- elif type in ['float'] -%}
        {{ value ~ "::" ~ type ~ ' as ' ~ column }}
    {%- else -%}
        {{ "'" ~ value ~ "'::" ~ type ~ ' as ' ~ column }}
    {%- endif -%}
{% endmacro %}