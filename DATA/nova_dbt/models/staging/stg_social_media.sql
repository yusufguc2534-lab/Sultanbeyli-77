with source as (
    select * from read_csv_auto('../data/Social_media_impact_on_life.csv')
),

renamed as (
    select
        -- Kimlik ve Demografik Bilgiler
        student_id,
        age,
        lower(gender) as gender,
        lower(academic_level) as academic_level,
        
        -- Sosyal Medya Kullanım Alışkanlıkları
        lower(primary_platform) as primary_platform,
        daily_usage_hours,
        weekend_extra_hours,
        lower(device_type) as device_type,
        
        -- Sağlık, Uyku ve Psikolojik Metrikler
        sleep_duration_hours,
        sleep_quality_score,
        late_night_usage,
        lower(social_comparison_frequency) as social_comparison_frequency,
        
        -- Eksik (NULL) verileri güvenli değerlerle doldurma
        coalesce(perceived_stress_score, 0) as perceived_stress_score,
        mental_health_index,
        coalesce(academic_performance_gpa, 0.0) as academic_performance_gpa,
        
        lower(overall_impact) as overall_impact

    from source
)

select * from renamed