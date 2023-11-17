{{ config(materialized='incremental') }}

{%- set source_model = "stg_product_info" -%}
{%- set src_pk = "PRODUCTINFO_PK" -%}
{%- set src_hashdiff = "PRODUCTINFO_HASHDIFF" -%}
{%- set src_payload = [
        "prodcategoryid"
        , "short_descr"
        , "language"
        , "CREATEDBY"
        , "createdat"
        ] ,%}
{%- set src_eff = "EFFECTIVE_FROM" -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ automate_dv.sat(
    src_pk=src_pk,
    src_hashdiff=src_hashdiff,
    src_payload=src_payload,
    src_eff=src_eff,
    src_ldts=src_ldts,
    src_source=src_source,
    source_model=source_model
)}}