{{ config(materialized='table') }}
with prod_categories as (
    select * from {{ ref('ProductCategories') }} 
),

prod_text as (
    select * from {{ ref('ProductCategoryText') }}
)

select 
    pc.*,
    pt.language,
    pt.short_descr
from prod_categories pc
join prod_text pt
on pc.prodcategoryid = pt.prodcategoryid