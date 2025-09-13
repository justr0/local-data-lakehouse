SELECT
    *,
    PARSE_DATE("%Y%m%d", _TABLE_SUFFIX)  as snapshot_date
FROM {{ source('products', 'products') }}