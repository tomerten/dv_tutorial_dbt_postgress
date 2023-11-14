{%- set yaml_metadata -%}
source_model: 'Products'
derived_columns:
    RECORD_SOURCE: '!Products'
    LOAD_DATE: CURRENT_DATE
    EFFECTIVE_FROM: 'CHANGEDAT'
hashed_columns:
    PRODUCT_PK: 
        - 'PRODUCTID' 
    SUPPLIER_PARTNER_PK: 'SUPPLIER_PARTNERID'
    PRODUCTS_HASHDIFF:
      is_hashdiff: true
      columns:
        - 'PRODUCTID'
        - 'TYPECODE'
        - 'PRODCATEGORYID'
        - 'CREATEDBY'
        - 'CREATEDAT'
        - 'CHANGEDBY'
        - 'CHANGEDAT'
        - 'SUPPLIER_PARTNERID'
        - 'TAXTARIFFCODE'
        - 'QUANTITYUNIT'
        - 'WEIGHTMEASURE'
        - 'WEIGHTUNIT'
        - 'CURRENCY'
        - 'PRICE'
        - 'EFFECTIVE_FROM'
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}
{% set source_model = metadata_dict['source_model'] %}
{% set derived_columns = metadata_dict['derived_columns'] %}
{% set hashed_columns = metadata_dict['hashed_columns'] %}

{{ automate_dv.stage(include_source_columns=true,
                  source_model=source_model,
                  derived_columns=derived_columns,
                  hashed_columns=hashed_columns) }}