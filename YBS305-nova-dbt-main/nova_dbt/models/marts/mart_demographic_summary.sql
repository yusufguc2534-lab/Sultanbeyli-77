with intermediate as (
    select * from {{ ref('int_student_metrics') }}
)

select
    age_group,
    gender,
    usage_category,
    count(student_id) as student_count,
    round(avg(academic_performance_gpa), 2) as avg_gpa,
    round(avg(sleep_duration_hours), 2) as avg_sleep_hours
from intermediate
group by age_group, gender, usage_category