--TPC-DS Q8
select  s_store_name
      ,sum(ss_net_profit)
 from store_sales
     ,date_dim
     ,store,
     (select ca_zip
     from (
      SELECT substr(ca_zip,1,5) ca_zip
      FROM customer_address
      WHERE substr(ca_zip,1,5) IN (
                          '99101','79678','62831','84154','72347','42541',
                          '26675','24616','70978','47255','45574',
                          '79173','85045','33308','16612','50403',
                          '87766','66182','87606','71918','97678',
                          '30334','13745','97242','45770','47064',
                          '50113','18253','65978','79756','84801',
                          '14179','52819','37217','83804','76937',
                          '78432','86837','18841','18182','36152',
                          '33377','50572','29505','28992','86346',
                          '87060','35499','62981','43141','90544',
                          '14399','44204','79291','73089','35719',
                          '49051','93740','32247','61516','92299',
                          '76358','37025','68397','58143','60396',
                          '90911','62092','11448','17649','76679',
                          '86228','12029','43036','57458','91758',
                          '90402','50392','63012','40124','43876',
                          '70610','10927','31122','64942','42609',
                          '70797','86401','84517','52720','92399',
                          '29945','53024','41706','84109','15766',
                          '56259','98082','32420','44630','39367',
                          '64455','81011','44048','12940','49075',
                          '40064','90186','38257','87113','38584',
                          '34578','42444','49465','18653','39446',
                          '74636','74735','36708','87988','91953',
                          '78078','66501','39547','52675','21645',
                          '22325','22467','71535','68960','17335',
                          '84544','76147','46649','96115','29902',
                          '42519','77927','88475','15038','54710',
                          '65875','69259','96238','93153','82068',
                          '69912','42092','48921','50776','45023',
                          '87437','87105','81312','59296','45661',
                          '99540','46154','87103','29300','56401',
                          '73541','25798','47383','45232','79486',
                          '24479','74551','48965','24284','90773',
                          '86659','44851','66522','37360','22819',
                          '99877','61159','40559','17258','85401',
                          '85848','93971','27156','51982','59301',
                          '21270','47913','11066','20581','26047',
                          '80554','20910','39776','39844','81876',
                          '41784','39554','57672','12324','77794',
                          '14511','54069','61021','40730','49767',
                          '93762','94430','45405','19013','47276',
                          '92690','97057','19936','82551','29550',
                          '21331','69618','42582','10680','86578',
                          '18415','97667','36189','28308','63628',
                          '97857','56044','61528','29156','89139',
                          '33239','46675','74779','75171','10063',
                          '36106','34846','72275','30408','72047',
                          '49687','79547','73631','85804','68222',
                          '52687','52037','82913','91455','11792',
                          '22956','74210','23084','78723','32119',
                          '63040','39422','89356','10394','24387',
                          '85348','28875','99875','86589','18616',
                          '10338','86269','65172','51233','77620',
                          '84504','61204','17101','43387','16929',
                          '66880','81626','25203','65322','53840',
                          '39061','87109','10090','93650','62169',
                          '96967','47511','30734','60606','57110',
                          '40409','56942','59473','26531','23376',
                          '53922','16927','53597','33534','81004',
                          '18962','14442','73172','48379','67574',
                          '19297','66849','36833','51199','72798',
                          '98302','76030','50758','36827','32873',
                          '73132','58703','28873','82815','59715',
                          '41384','14068','97200','40756','43767',
                          '22920','64665','76892','67022','36581',
                          '67484','51235','54220','95870','72857',
                          '13758','65954','86258','19600','33453',
                          '43403','20071','40279','17512','34360',
                          '67568','48890','33927','34613','51560',
                          '74973','52266','20371','22350','90309',
                          '43321','17413','88998','67581','41643',
                          '18609','35135','67331','47680','71393',
                          '20471','84033','88284','54837','18121',
                          '69318','22179','92434','23897','87312',
                          '88565','30220','25700','62737','15708',
                          '85038','26470','84964','89142','42817',
                          '26481','19145','31528','41642','54741',
                          '23636','98128','98447','82921','35554',
                          '37912','90350','93032','41859')
     intersect
      select ca_zip
      from (SELECT substr(ca_zip,1,5) ca_zip,count(*) cnt
            FROM customer_address, customer
            WHERE ca_address_sk = c_current_addr_sk and
                  c_preferred_cust_flag='Y'
            group by ca_zip
            having count(*) > 10)A1)A2) V1
 where ss_store_sk = s_store_sk
  and ss_sold_date_sk = d_date_sk
  and d_qoy = 1 and d_year = 2001
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;

