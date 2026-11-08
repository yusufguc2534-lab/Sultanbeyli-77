
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select student_id
from "dev"."main"."mart_demographic_summary"
where student_id is null



  
  
      
    ) dbt_internal_test