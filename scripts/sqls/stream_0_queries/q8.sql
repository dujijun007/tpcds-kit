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
                          '37188','64945','13415','28004','71520','39362',
                          '65966','83385','86598','68671','41702',
                          '49097','43550','37896','87411','91688',
                          '43321','99912','95996','22803','37574',
                          '46395','93157','17742','39662','54390',
                          '84762','81643','64834','44761','25671',
                          '23918','93316','29126','91131','50693',
                          '17753','80576','87880','85219','32323',
                          '62983','90738','76076','13588','75451',
                          '41124','30428','22838','26591','54061',
                          '78828','75937','70360','64965','70335',
                          '66606','50644','58062','18458','47117',
                          '61147','23142','64922','18869','15551',
                          '53787','93606','24737','25202','36554',
                          '32908','49231','47159','34652','43120',
                          '23948','30103','12652','76977','10396',
                          '76051','92402','10877','29828','22524',
                          '41567','93872','73774','28382','61102',
                          '41098','59267','73914','99159','41491',
                          '19608','85118','42610','25372','88689',
                          '93879','61434','32660','77757','64610',
                          '30212','41709','86125','64661','84757',
                          '86139','83824','27145','71260','18507',
                          '73733','12355','31617','35727','29671',
                          '55689','79793','54744','98822','34059',
                          '91825','90290','48375','16764','13653',
                          '12882','20053','24581','71471','58181',
                          '42185','81471','23665','45531','35034',
                          '97243','84164','83109','50261','97948',
                          '23281','23865','54837','22280','44456',
                          '97497','34581','59890','32814','57096',
                          '20212','29708','28717','12174','18585',
                          '57932','20354','41989','80753','21766',
                          '68731','85594','49718','72967','26770',
                          '52127','77453','22637','81210','13717',
                          '68740','73418','86017','33021','11275',
                          '20604','27679','31587','94353','57726',
                          '11135','72628','51703','24881','56703',
                          '82662','49610','14746','46641','45980',
                          '94436','96124','19729','57069','96922',
                          '29894','19918','54442','23583','80692',
                          '96291','77175','27742','15607','21352',
                          '14549','46976','48194','94620','44677',
                          '18306','36015','27780','10347','40346',
                          '88358','40186','20189','97363','74228',
                          '27967','58411','35693','72775','43100',
                          '33770','37788','21648','77877','43251',
                          '90053','55040','95198','64325','17530',
                          '48348','89900','72537','48660','82861',
                          '97296','34541','30734','64827','69194',
                          '24559','29402','88455','69502','30207',
                          '81827','14680','50415','53610','71879',
                          '52804','66178','16091','24280','61228',
                          '84573','14331','26257','41247','60704',
                          '24420','36748','52536','27919','57550',
                          '75910','25268','59518','69095','34070',
                          '11059','21264','61790','43741','83257',
                          '92305','45408','50825','20578','54433',
                          '29576','90451','19535','11204','27180',
                          '16466','79001','32363','27642','82586',
                          '93857','60516','85302','19030','40575',
                          '27924','25313','17322','53565','96589',
                          '16964','10220','24107','59645','19849',
                          '78039','17300','40001','23390','14107',
                          '37570','68954','48857','80138','25900',
                          '69317','57016','92215','25860','38702',
                          '41096','85998','34506','95343','61660',
                          '80929','43823','52486','95584','22997',
                          '20574','13432','55654','32617','77797',
                          '60944','19979','98759','90097','80085',
                          '66094','10471','34494','63298','43080',
                          '11771','43887','16083','41307','26556',
                          '72109','17924','12679','39849','48529',
                          '51280','15852','40714','70213','80873',
                          '85140','17583','26484','91375','24390',
                          '19718','37215','60559','97250','23843',
                          '62133','47022','56410','63059','68680',
                          '37014','78695','74191','33584','65567',
                          '73596','77370','33742','96078','69661',
                          '52520','16773','35556','48603')
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
  and d_qoy = 2 and d_year = 2000
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;

