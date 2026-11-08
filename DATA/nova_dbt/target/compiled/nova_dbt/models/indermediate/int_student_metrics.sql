with staged as (
    select * from "dev"."main"."stg_social_media"
),

enriched as (
    select
        student_id,
        age,
        -- Yaş grupları oluşturma (Dashboard'da kırılım yapmak için harika olur)
        case 
            when age < 18 then '18 Yaş Altı'
            when age between 18 and 20 then '18-20 Yaş'
            else '21+ Yaş'
        end as age_group,
        
        gender,
        academic_level,
        primary_platform,
        daily_usage_hours,
        
        -- Günlük kullanım yoğunluğu sınıflandırması
        case 
            when daily_usage_hours > 6 then 'Yüksek Kullanıcı (>6s)'
            when daily_usage_hours between 3 and 6 then 'Orta Kullanıcı (3-6s)'
            else 'Düşük Kullanıcı (<3s)'
        end as usage_category,
        
        sleep_duration_hours,
        sleep_quality_score,
        perceived_stress_score,
        mental_health_index,
        academic_performance_gpa,
        overall_impact

    from staged
)

select * from enriched