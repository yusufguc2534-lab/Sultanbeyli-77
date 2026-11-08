
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select total_students
from "dev"."main"."mart_platform_impact"
where total_students is null



  
  
      
    ) dbt_internal_test