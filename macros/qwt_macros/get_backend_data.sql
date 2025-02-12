{% macro get_linenos() %}
 
{% set lineno_query %}
select distinct
lineno
from {{ ref('fct_orders') }}
order by 1
{% endset %}
 
{% set results = run_query(lineno_query) %}
 
{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0].values() %}
{% else %}
{% set results_list = [] %}
{% endif %}
 
{{ return(results_list) }}
 
{% endmacro %}

-----------------------MIN date------------------------------------

{% macro get_min_date() %}
{% set min_date %}

select min(orderdate) as ord
from {{ ref('fct_orders') }}
order by 1
{% endset %}
 
{% set results = run_query(min_date) %}
 
{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0][0] %}
{% else %}
{% set results_list = [] %}
{% endif %}
 
{{ return(results_list) }}
 
{% endmacro %}

--------------------MAX Date---------------------------

{% macro get_max_date() %}
{% set max_date %}

select max(orderdate) as ord
from {{ ref("fct_orders") }}
order by 1
{% endset %}
 
{% set results = run_query(max_date) %}
 
{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0][0] %}
{% else %}
{% set results_list = [] %}
{% endif %}
 
{{ return(results_list) }}
 
{% endmacro %}