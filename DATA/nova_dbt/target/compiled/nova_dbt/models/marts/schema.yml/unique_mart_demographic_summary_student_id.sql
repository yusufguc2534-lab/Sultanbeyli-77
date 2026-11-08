
    
    

select
    student_id as unique_field,
    count(*) as n_records

from "dev"."main"."mart_demographic_summary"
where student_id is not null
group by student_id
having count(*) > 1


