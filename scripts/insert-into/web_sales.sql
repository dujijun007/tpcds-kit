INSERT OVERWRITE TABLE web_sales SELECT *  FROM web_sales_ext ws DISTRIBUTE BY ws_sold_date_sk;
analyze table web_sales COMPUTE STATISTICS  for all columns;
