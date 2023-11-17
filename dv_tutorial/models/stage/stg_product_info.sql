{%- set yaml_metadata -%}
source_model: 'product_info'
derived_columns:
    RECORD_SOURCE: '!product_info'
    LOAD_DATE: CURRENT_DATE
    EFFECTIVE_FROM: CURRENT_DATE
hashed_columns:
    PRODUCTINFO_PK: 
        - 'prodcategoryid' 
    PRODUCTINFO_HASHDIFF:
      is_hashdiff: true
      columns:
        - 'LANGUAGE'
        - 'SHORT_DESCR'
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}
{% set source_model = metadata_dict['source_model'] %}
{% set derived_columns = metadata_dict['derived_columns'] %}
{% set hashed_columns = metadata_dict['hashed_columns'] %}

{{ automate_dv.stage(include_source_columns=true,
                  source_model=source_model,
                  derived_columns=derived_columns,
                  hashed_columns=hashed_columns) }}