{% macro generate_name_with_execution_type(name) %}

    {% set execution_type = '' %}

    {% if dbt_testing.integration_tests_run_mode() %}
        {% set execution_type = 'it_' %}
    {% endif %}

    {% if var('unique_identifier', '') != '' %}
        {% set unique_identifier = var('unique_identifier') %}
        {% set execution_type = execution_type ~ unique_identifier ~ '_' %}
    {% endif %}

    {{ return(execution_type ~ name) }}
{% endmacro %}
