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
                          '74124','53034','49798','82230','99551','97801',
                          '11742','85581','81191','20945','74758',
                          '67421','14633','52034','39124','47852',
                          '78971','51325','78262','81957','28607',
                          '17547','13601','20136','58757','31811',
                          '30593','11727','14288','92335','86905',
                          '43295','50657','53185','24145','62586',
                          '63918','89479','12291','54506','58694',
                          '40563','17884','31026','21964','97419',
                          '17019','55063','32735','79415','79073',
                          '96915','23133','30192','93177','11683',
                          '84205','72736','72031','55608','88495',
                          '41725','18969','41365','67844','77629',
                          '70839','53797','88910','26973','99034',
                          '61568','62317','47440','50378','24628',
                          '72105','59380','92924','71943','80739',
                          '43197','22158','45616','29459','51283',
                          '63078','65125','28254','28030','25690',
                          '48156','69540','62566','28076','42707',
                          '52021','80418','90248','74330','96098',
                          '47957','75448','63652','51619','86032',
                          '68924','63105','18516','89409','28899',
                          '34181','16636','81332','65238','45588',
                          '59806','13421','54612','76876','77374',
                          '43200','45205','56546','53981','52878',
                          '42676','31411','19011','65963','12399',
                          '57403','73982','94050','70800','66197',
                          '20470','62220','68286','80768','99175',
                          '10952','24009','18689','69228','30033',
                          '81886','55859','16456','85385','11852',
                          '92249','51420','72116','77219','46010',
                          '47344','82737','75820','44150','76664',
                          '59599','88734','14903','48777','99630',
                          '86964','31973','16080','59998','91656',
                          '12013','53236','98781','49086','33636',
                          '73085','50235','65662','24109','16757',
                          '17091','85335','24650','99004','50070',
                          '49739','78546','84411','34950','68632',
                          '82508','64670','30966','23009','50690',
                          '51733','50613','52877','22748','77020',
                          '73392','93492','96422','67498','93228',
                          '13348','29763','16772','78315','65826',
                          '11767','99262','35920','28250','49487',
                          '55262','98769','45324','99642','70373',
                          '21770','93380','60131','42353','17485',
                          '77737','29926','93924','32263','86272',
                          '11450','95778','21067','26177','57691',
                          '16851','42227','31066','67824','38214',
                          '91131','29551','44030','46934','54357',
                          '45405','78401','61170','72542','97062',
                          '75715','76321','78683','77691','38560',
                          '38992','45370','12909','53130','60726',
                          '69766','46513','36807','66135','98431',
                          '96018','26209','98034','33199','12831',
                          '53179','52847','16699','52711','15392',
                          '81346','98998','63865','56825','16701',
                          '50030','56787','19945','78102','64820',
                          '80970','95798','43279','11098','51477',
                          '26754','96995','45229','96152','55455',
                          '26406','86338','71377','80387','57391',
                          '92203','63636','37742','83946','19958',
                          '65672','91812','16687','70315','13536',
                          '85885','31191','15249','64140','84459',
                          '28602','20350','59421','74633','45811',
                          '32648','29188','11824','20020','85523',
                          '29819','22319','59514','55707','80137',
                          '97161','64515','94442','52859','52202',
                          '11196','67888','18537','15330','93322',
                          '58716','94477','63106','62357','31885',
                          '44781','62711','68193','95119','23058',
                          '39843','92900','30091','38896','88505',
                          '88004','35598','83719','72807','20972',
                          '20792','71821','11875','81607','66546',
                          '47663','62177','86536','49973','12229',
                          '41578','83112','98527','57796','31765',
                          '53363','75174','54090','61776','91963',
                          '81879','90541','91808','61011','78793',
                          '19498','66892','31974','25088','23225',
                          '99871','86924','43544','10972','25118',
                          '52675','91716','87815','12308')
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
  and d_qoy = 1 and d_year = 1999
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;

