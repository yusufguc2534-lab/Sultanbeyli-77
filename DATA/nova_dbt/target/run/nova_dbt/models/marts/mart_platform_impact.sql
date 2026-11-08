
  
  create view "dev"."main"."mart_platform_impact__dbt_tmp" as (
    with intermediate as (
    select * from "dev"."main"."int_student_metrics"
)

select
    primary_platform,
    count(student_id) as total_students,
    round(avg(daily_usage_hours), 2) as avg_daily_hours,
    round(avg(academic_performance_gpa), 2) as avg_gpa,
    round(avg(perceived_stress_score), 2) as avg_stress_score,
    round(avg(mental_health_index), 2) as avg_mental_health
from intermediate
group by primary_platform
order by avg_daily_hours desc
  );
