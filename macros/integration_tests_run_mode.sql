{% macro integration_tests_run_mode() %}
    {{ return( var('integration_tests', 'false') == 'true' ) }}
{% endmacro %}
