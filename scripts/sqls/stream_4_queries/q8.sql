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
                          '50855','81503','86197','67767','36484','32280',
                          '99828','44141','83139','19555','12640',
                          '64587','43063','12820','77608','45705',
                          '41443','84743','75452','82195','91915',
                          '88307','33981','11627','57882','80103',
                          '52223','37645','98307','63602','70179',
                          '16654','57573','70625','15650','54478',
                          '14637','14243','90072','30380','86623',
                          '49763','82487','60248','28163','27724',
                          '54754','11824','97668','31356','29942',
                          '64419','37087','51796','35241','29620',
                          '12855','12020','88769','12013','89563',
                          '66003','15143','20851','57739','29462',
                          '95634','75029','35944','78420','95091',
                          '46739','89297','81838','73710','30303',
                          '87393','41751','45881','68725','83692',
                          '42974','76765','30794','37092','95529',
                          '62802','89012','36781','44223','11098',
                          '98921','78584','43518','69206','14069',
                          '53752','41448','58338','12937','93369',
                          '96663','43646','14939','19239','28002',
                          '16177','82915','65734','40583','28217',
                          '14405','41970','28995','78005','32768',
                          '66270','92819','46448','67889','93383',
                          '40434','52597','62124','72959','30477',
                          '70431','60450','10270','12450','12841',
                          '20977','21062','47155','42379','65930',
                          '40250','90047','23051','35475','75466',
                          '32025','58874','88909','12028','76294',
                          '98435','77542','60748','63050','66740',
                          '70902','73361','28251','89130','25195',
                          '60454','65065','64434','29105','65677',
                          '13436','45170','11335','79600','50242',
                          '36163','40873','34273','62867','37308',
                          '80524','86683','51576','68174','31815',
                          '71688','40691','69880','25696','74209',
                          '11866','86167','54775','33885','71157',
                          '87072','76997','15372','13777','74581',
                          '25378','64211','63639','34253','22530',
                          '57317','56915','46644','47602','44357',
                          '72877','94776','54403','35542','79498',
                          '83753','32531','10043','73966','79290',
                          '13634','17996','30023','78667','22496',
                          '88729','29150','10280','45000','60256',
                          '36951','37373','36322','15002','67359',
                          '97196','53560','36570','84146','30606',
                          '47857','47402','16406','83190','48898',
                          '85516','21389','53041','12521','40298',
                          '15173','28033','31071','55489','23331',
                          '85143','19940','56256','26816','87711',
                          '56002','52819','36323','85541','10934',
                          '22246','98241','43722','45794','30848',
                          '67847','91163','60793','84617','45193',
                          '84910','85377','53470','78661','49914',
                          '63900','68443','21978','92547','91726',
                          '61605','30990','77359','54045','74623',
                          '44723','40820','26499','18712','95370',
                          '55072','85036','35896','82767','20424',
                          '39673','56628','24999','61847','14422',
                          '73062','29555','83930','75610','82914',
                          '78929','48476','53502','19873','36968',
                          '83892','56903','46751','11450','98404',
                          '76764','55334','90905','10372','12336',
                          '88998','53926','45192','20660','52350',
                          '11481','54863','25932','56978','33361',
                          '31192','25893','59984','85895','13100',
                          '16267','23367','73037','83970','84044',
                          '48830','19185','27866','76625','79854',
                          '25679','63823','88926','10155','20004',
                          '50002','29333','16307','47944','21260',
                          '52956','55367','47981','48448','24234',
                          '66163','36556','55483','11141','19571',
                          '91621','14400','81764','71185','49736',
                          '65025','85082','27330','67914','64585',
                          '38930','61388','81257','94168','86987',
                          '88746','65648','57466','28818','80969',
                          '10974','16210','55128','19339','50023',
                          '13558','60204','66155','16814','90033',
                          '16097','44040','95197','88244','99793',
                          '70443','25266','54000','75201')
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
  and d_qoy = 2 and d_year = 1998
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;

