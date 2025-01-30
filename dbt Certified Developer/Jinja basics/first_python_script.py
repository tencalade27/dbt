{% set fav_animals = ['lion', 'bull', 'tiger', 'falcon', 'dog'] %}

{%- for animal in fav_animals -%}
  My favorite animal is the {{ animal }}
{% endfor %}



{% set temperature = 45 %}

{%- if temperature < 60 -%}
  Time for a cappuccino!
{%- else -%}
  Time for a cold brew!
{% endif %}



{% set fav_foods = ['steak', 'burger', 'salmon', 'cheesecake'] %}

{%- for food in fav_foods -%}
  {%- if food == 'cheesecake' -%}
    {%- set food_type = 'dessert' -%}
  {%- else -%}
    {%- set food_type = 'meal' -%}
  {%- endif -%}
  The humble {{ food }} is my favorite {{ food_type }}
{% endfor %}

{% set websters_dict = {
  'word' : 'data',
  'speech_part' : 'noun',
  'definition' : 'if you know, you know'
} -%}

{{ websters_dict['word'] }} ({{ websters_dict['speech_part'] }}): defined as "{{ websters_dict['definition'] }}"
