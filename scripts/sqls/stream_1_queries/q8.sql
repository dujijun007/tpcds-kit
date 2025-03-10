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
                          '96723','93180','98336','91360','84296','14960',
                          '31825','90164','72132','68105','79518',
                          '29834','75452','65783','46704','45068',
                          '62275','39234','76354','18783','65665',
                          '11249','68012','49738','61751','36607',
                          '68124','70631','10297','92285','69573',
                          '30562','36268','23702','36650','80451',
                          '39258','14824','65650','17247','52053',
                          '38637','13285','21965','20745','84643',
                          '49671','98028','66984','88002','39375',
                          '33570','50710','99910','51543','39613',
                          '94077','37307','35560','62590','60182',
                          '18170','41730','59090','24083','49519',
                          '60550','91697','62518','86210','15823',
                          '49285','96149','98490','74008','55940',
                          '11083','27742','17993','22673','44843',
                          '45292','63533','97251','66744','52415',
                          '46837','31111','64875','26568','42420',
                          '26188','76679','24991','98238','21526',
                          '46360','72206','41198','35708','67466',
                          '35745','98730','99829','63285','35798',
                          '43471','13871','18926','80930','18334',
                          '93497','38832','33366','28162','54410',
                          '86672','50441','20915','28008','30339',
                          '51233','54095','80889','40537','38836',
                          '52712','53149','67200','36274','38617',
                          '19042','41572','97888','85321','52925',
                          '66329','71312','10849','96532','30171',
                          '42895','69644','53264','50566','45149',
                          '24087','22895','19666','70697','16659',
                          '53852','64846','15129','23224','42165',
                          '86190','58102','16450','45006','30908',
                          '40866','57898','85125','13999','85481',
                          '11079','89166','49205','13603','64314',
                          '27203','81879','77152','55680','15739',
                          '40507','98254','40118','41428','53845',
                          '14405','53295','20091','29828','53714',
                          '51773','64434','31539','68919','34820',
                          '44933','95176','64616','88325','74687',
                          '20237','60363','71863','47335','38743',
                          '48547','71673','50535','12165','89710',
                          '28031','54100','79866','22451','98579',
                          '37497','39963','41151','13066','17732',
                          '55392','43390','36803','36801','68005',
                          '36306','35497','17519','51080','23857',
                          '65907','74165','16196','79770','34353',
                          '25189','25801','42404','66654','68831',
                          '52886','81335','24297','48539','99139',
                          '42168','49578','76988','36308','73131',
                          '48048','85532','50222','40497','24045',
                          '76912','25478','58023','79812','11059',
                          '79598','51418','29817','11449','26830',
                          '42730','14755','70139','21075','90779',
                          '71226','45231','55211','84846','15924',
                          '14582','29348','80725','16947','32148',
                          '36841','73221','15875','70669','48285',
                          '91142','72551','99158','56115','18224',
                          '37443','57122','48347','16528','76405',
                          '56447','42361','17678','15147','80600',
                          '45585','47009','34626','33720','69253',
                          '30166','40213','22993','37375','61358',
                          '53964','84394','44054','41908','52686',
                          '30069','20450','51572','11604','17460',
                          '86606','72643','20813','75111','40501',
                          '70575','31676','69678','43816','96986',
                          '25064','33247','64748','42104','72350',
                          '39607','54719','54507','43953','23405',
                          '34118','78474','12834','16567','84124',
                          '22360','26100','39141','16338','80046',
                          '73722','98428','35104','14937','43308',
                          '60235','79247','96025','28903','52755',
                          '14058','54666','80221','13763','35448',
                          '46487','55122','33310','60543','91841',
                          '33474','41651','71256','47332','87062',
                          '31414','14263','69338','56772','69145',
                          '67367','79346','27340','93621','26667',
                          '68451','65811','42053','47858','55609',
                          '66200','84611','41970','98751','41217',
                          '78862','29830','70057','71998','61738',
                          '41683','66475','11134','23956')
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
  and d_qoy = 2 and d_year = 2002
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;

