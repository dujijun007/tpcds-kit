--TPC-DS Q41
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 782 and 782+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'chocolate' or i_color = 'grey') and 
        (i_units = 'Pallet' or i_units = 'Gram') and
        (i_size = 'petite' or i_size = 'large')
        ) or
        (i_category = 'Women' and
        (i_color = 'firebrick' or i_color = 'peru') and
        (i_units = 'Gross' or i_units = 'Tsp') and
        (i_size = 'medium' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'cream' or i_color = 'snow') and
        (i_units = 'Ounce' or i_units = 'Dram') and
        (i_size = 'extra large' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'medium' or i_color = 'lawn') and
        (i_units = 'Ton' or i_units = 'Carton') and
        (i_size = 'petite' or i_size = 'large')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'black' or i_color = 'plum') and 
        (i_units = 'Box' or i_units = 'Cup') and
        (i_size = 'petite' or i_size = 'large')
        ) or
        (i_category = 'Women' and
        (i_color = 'midnight' or i_color = 'deep') and
        (i_units = 'Dozen' or i_units = 'Unknown') and
        (i_size = 'medium' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'puff' or i_color = 'cornsilk') and
        (i_units = 'Tbl' or i_units = 'Pound') and
        (i_size = 'extra large' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'salmon' or i_color = 'dark') and
        (i_units = 'Bundle' or i_units = 'Case') and
        (i_size = 'petite' or i_size = 'large')
        )))) > 0
 order by i_product_name
 limit 100;

