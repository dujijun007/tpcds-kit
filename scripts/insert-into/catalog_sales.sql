INSERT OVERWRITE TABLE catalog_sales SELECT /*+ COALESCE(72)*/ * FROM catalog_sales_ext cs;
analyze table catalog_sales COMPUTE STATISTICS  for all columns;
