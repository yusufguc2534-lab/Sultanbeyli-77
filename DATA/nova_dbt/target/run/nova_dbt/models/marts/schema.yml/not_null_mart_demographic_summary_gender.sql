
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select gender
from "dev"."main"."mart_demographic_summary"
where gender is null



  
  
      
    ) dbt_internal_test