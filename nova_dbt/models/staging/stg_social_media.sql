with source as (
    select * from read_csv_auto('../data/Social_media_impact_on_life.csv')
),

renamed as (
    select
        -- Sütun adlarını kendi CSV dosyadaki sütun isimlerine göre düzenleyebilirsin
        -- Örnek olarak sütunları seçip küçük harfe çevirebilir veya yeniden adlandırabilirsin:
        timestamp as response_timestamp,
        age,
        gender,
        -- Diğer sütunlarını buraya ekleyebilirsin
        *
    from source
)

select * from renamed