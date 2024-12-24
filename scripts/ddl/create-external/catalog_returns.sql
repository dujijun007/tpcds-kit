create table catalog_returns_ext 
(
    cr_returned_date_sk       int                           ,
    cr_returned_time_sk       int                           ,
    cr_item_sk                int                           ,
    cr_refunded_customer_sk   int                           ,
    cr_refunded_cdemo_sk      int                           ,
    cr_refunded_hdemo_sk      int                           ,
    cr_refunded_addr_sk       int                           ,
    cr_returning_customer_sk  int                           ,
    cr_returning_cdemo_sk     int                           ,
    cr_returning_hdemo_sk     int                           ,
    cr_returning_addr_sk      int                           ,
    cr_call_center_sk         int                           ,
    cr_catalog_page_sk        int                           ,
    cr_ship_mode_sk           int                           ,
    cr_warehouse_sk           int                           ,
    cr_reason_sk              int                           ,
    cr_order_number           bigint                        ,
    cr_return_quantity        int                           ,
    cr_return_amount          decimal(7,2)                  ,
    cr_return_tax             decimal(7,2)                  ,
    cr_return_amt_inc_tax     decimal(7,2)                  ,
    cr_fee                    decimal(7,2)                  ,
    cr_return_ship_cost       decimal(7,2)                  ,
    cr_refunded_cash          decimal(7,2)                  ,
    cr_reversed_charge        decimal(7,2)                  ,
    cr_store_credit           decimal(7,2)                  ,
    cr_net_loss               decimal(7,2)                   
) 
USING com.databricks.spark.csv OPTIONS ( `inferSchema` 'false', `header` 'false', `delimiter` '|', nullValue '')
LOCATION 'dbfs:/mnt/aws-tpcds-audit//tpcds_100000_datafiles_audit/catalog_returns';