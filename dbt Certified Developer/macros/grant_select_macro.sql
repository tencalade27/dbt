{% for i in range(10) %}

  select {{ i }} as number {% if not loop.last %} union all {% endif %}

{% endfor %}

{{ target.name }}
{{ target.role }}
{{ target.schema ))

{% macro grant_select(schema = target.schema, role = target.role) %}

  {% set sql %}
    grant usage on schema {{ schema }} to role {{ role }};
    grant select on all tables in schema {{ schema }} to role {{ role }};
    grant select on all views in schema {{ schema }} to role {{ role }};
  {% endset %}
  
  {{ log('Granting select on all tacbles and views in schema ' ~ schema ~ 'to role ' ~ role, info = True )}}
  {% do run_query(sql) %}
  {{ log('Priviliges granted.', info = True) }}

{% endmacro %}
