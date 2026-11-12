📊 Sultanbeyli-77: Sosyal Medya Kullanımı, Yaşam Tarzı ve Akademik Başarı Demografik Analiz Projesi

## 📜 Proje Özeti

**Sultanbeyli-77** projesi, üniversite ve lise öğrencilerinin günlük sosyal medya kullanım alışkanlıklarının; akademik başarı (GPA), uyku kalitesi, stres seviyeleri ve genel ruh sağlığı (zihinsel iyi oluş) üzerindeki doğrudan ve dolaylı etkilerini araştıran uçtan uca bir **Veri Mühendisliği ve İş Zekası (BI)** çalışmasıdır.

Bu projede ham veriler modern veri hattı (data pipeline) prensiplerine uygun olarak işlenmiş; **dbt (data build tool)** ve **DuckDB** mimarisi üzerinde modellenerek **Power BI** üzerinden karar vericiler için interaktif panellere dönüştürülmüştür.

## 🏗️ Proje Mimarisi ve Teknoloji Yığını

Proje, modern **ELT (Extract, Load, Transform)** yaklaşımını benimsemektedir:

```
[ Ham Veri (CSV/Raw) ] 
       │
       ▼
[ DuckDB (dev.duckdb) ] ── (Veri Depolama ve Hızlı Sorgulama Motoru)
       │
       ▼
[ dbt Core Engine ] ───── (Modelleme: Staging -> Intermediate -> Marts)
       │
       ▼
[ Python Export Pipeline ] (Power BI Entegrasyonu için CSV Dışa Aktarım)
       │
       ▼
[ Power BI Dashboard ] ── (İş Zekası, KPI & İnteraktif Görselleştirme)

```

### 🛠️ Kullanılan Teknolojiler

* **Veri Depolama & Sorgulama Motoru:** DuckDB (`dev.duckdb`)

* **Veri Dönüştürme & Modelleme Katmanı:** dbt Core (v1.12+)

* **Programlama & Otomasyon:** Python 3.x (`duckdb`, `dbt.cli.main`)

* **İş Zekası & Görselleştirme:** Microsoft Power BI Desktop

* **Geliştirme Ortamı & Versiyon Kontrol:** VS Code, Git & GitHub

## 📁 Detaylı Dizin Yapısı

Proje dizini aşağıdaki işlevsel modüllerden oluşmaktadır:

```
Sultanbeyli-77/
│
├── DATA/
│   └── nova_dbt/                      # dbt projesinin ana çalışma alanı
│       ├── analyses/                  # Özel SQL analiz sorguları
│       ├── macros/                    # dbt SQL makroları ve yardımcı fonksiyonlar
│       ├── models/                    # SQL Veri Dönüştürme Katmanları
│       │   ├── staging/               # Ham verilerin veri tiplerinin düzenlendiği katman
│       │   ├── intermediate/          # Metrik birleştirmeleri ve hesaplama katmanı
│       │   └── marts/                 # İş birimlerine hazır analitik tablolar
│       │       ├── mart_demographic_summary.sql  # Demografik ve GPA özet modeli
│       │       └── mart_platform_impact.sql      # Platform ve psikolojik etki modeli
│       │
│       ├── seeds/                     # Sabit veya referans CSV veri kaynakları
│       ├── snapshots/                 # Zaman içindeki veri değişim takibi (SCD Type 2)
│       ├── tests/                     # Veri kalitesi, benzersizlik ve null testleri
│       │
│       ├── dbt_project.yml            # dbt konfigürasyon ve model kuralları
│       ├── profiles.yml               # DuckDB veritabanı sürücü bağlantı ayarları
│       ├── dev.duckdb                 # Derlenmiş DuckDB veritabanı dosyası
│       ├── mart_demographic_summary.csv # Power BI tüketim verisi (Demografi)
│       └── mart_platform_impact.csv   # Power BI tüketim verisi (Platform Etkisi)
│
├── .gitignore                         # Git takibinden hariç tutulan dosyalar (dev.duckdb vb.)
└── README.md                          # Detaylı proje dokümantasyonu

```

## 📐 dbt Veri Modelleme Katmanları ve SQL Mantığı

Projedeki veriler dbt içerisinde 3 ana katmanda işlenmektedir:

### 1. Staging Katmanı (`models/staging`)

* Ham sütun isimleri standart kelimelere dönüştürülür (örn: `snake_case` yapısı).

* Eksik (`NULL`) değerler temizlenir veya varsayılan değerler atanır.

* Veri tipleri (`INTEGER`, `FLOAT`, `VARCHAR`) doğrulanır.

### 2. Marts Katmanı (`models/marts`)

Analiz ve Power BI görsellerini besleyen ana iş tabloları şunlardır:

* **`mart_demographic_summary`**:

  * **İçerik:** Yaş grupları (`age_group`), cinsiyet (`gender`) ve kullanım kategorilerine (`usage_category`) göre öğrenci sayıları (`student_count`), ortalama akademik başarı (`avg_gpa`) ve ortalama uyku sürelerini (`avg_sleep_hours`) gruplar.

* **`mart_platform_impact`**:

  * **İçerik:** Ana sosyal medya platformları (`primary_platform`) bazında günlük ortalama kullanım süreleri (`avg_daily_hours`), stres skorları (`avg_stress_score`) ve zihinsel sağlık göstergelerini (`avg_mental_health_score`) özetler.

## ⚙️ Kurulum ve Adım Adım Çalıştırma Rehberi

Projenin sıfırdan bir bilgisayarda ayağa kaldırılması için gereken adımlar:

### 1. Gereksinimlerin Kontrol Edilmesi

Sisteminizde **Python 3.8+**, **Git** ve **Power BI Desktop** kurulu olmalıdır.

### 2. Proje Dizinine Geçiş

Terminal veya PowerShell üzerinden projenin dbt klasörüne girin:

```
cd C:\Users\user\Sultanbeyli-77\DATA\nova_dbt

```

### 3. dbt Modellerinin Derlenmesi (`dbt run`)

dbt modellerinin DuckDB üzerinde çalıştırılması ve tabloların üretilmesi için:

```
python -m dbt.cli.main run --profiles-dir .

```

> **Başarı Çıktısı:** Terminalde `Done. PASS=4 WARN=0 ERROR=0` ve `Completed successfully` ibareleri görülmelidir.

### 4. Power BI için CSV Dosyalarının Oluşturulması

DuckDB tablolarının Power BI'a aktarımı için aşağıdaki Python komutunu tek satırda çalıştırın:

```
python -c "import duckdb; con = duckdb.connect('dev.duckdb'); con.execute('COPY mart_demographic_summary TO ''mart_demographic_summary.csv'' (HEADER); COPY mart_platform_impact TO ''mart_platform_impact.csv'' (HEADER);')"

```

Bu komut sonucunda dizinde `mart_demographic_summary.csv` ve `mart_platform_impact.csv` dosyaları hazır hale gelecektir.

## 📊 Power BI Dashboard ve Görselleştirme Mimarisi

Power BI üzerinde kurgulanan iş zekası raporu 3 temel bileşenden oluşmaktadır:

### 1. KPI Kartları (Top-Level Metrics)

* **Toplam Öğrenci Sayısı:** `SUM(mart_demographic_summary.student_count)`

* **Ortalama GPA:** `AVERAGE(mart_demographic_summary.avg_gpa)`

* **Ortalama Daily Ekran Süresi:** `AVERAGE(mart_platform_impact.avg_daily_hours)`

* **Ortalama Stres Skoru:** `AVERAGE(mart_platform_impact.avg_stress_score)`

### 2. Analitik Grafikler

1. **Kullanım Kategorisine Göre GPA Değişimi (Çubuk Grafik / Bar Chart):**

   * *Y Ekseni:* `usage_category` (Düşük, Orta, Yüksek Kullanıcı)

   * *X Ekseni:* `avg_gpa` (Ortalama)

2. **Platformlara Göre Stres ve Zihinsel Sağlık Dağılımı (Kümelenmiş Sütun Grafiği / Clustered Column Chart):**

   * *X Ekseni:* `primary_platform` (Instagram, TikTok, YouTube vb.)

   * *Y Ekseni:* `avg_stress_score` & `avg_mental_health_score` (Ortalama)

3. **Yaş Gruplarına Göre Uyku Süreleri (Çizgi Grafik / Line Chart):**

   * *X Ekseni:* `age_group`

   * *Y Ekseni:* `avg_sleep_hours` (Ortalama)

### 3. İnteraktif Dilimleyiciler (Slicers / Filtreler)

* **Cinsiyet Filtresi:** `gender` (Kadın, Erkek, Non-binary vb.)

* **Ana Platform Filtresi:** `primary_platform`

* **Yaş Grubu Filtresi:** `age_group`

## 🧪 Veri Kalitesi ve Testler

Projede veri bütünlüğünü sağlamak için dbt test mekanizmaları kullanılmıştır:

* **`unique` & `not_null` Testleri:** Anahtar sütunların benzersizliği ve boş olmama durumu doğrulanmıştır.

* **Kabul Edilebilir Değer Testleri:** GPA değerlerinin 0.0 - 4.0 aralığında ve günlük saatlerin 0-24 saat arasında olduğu kontrol edilmiştir.

## 👥 Ekip Üyeleri ve Katkıda Bulunanlar

* **Yusuf Yetkin Güç** (Veri Çekme, DBT Alytapsısı Kurma )

* **Yusuf Bilgin**  (Readme ve Rapor ekleme)

* **Muhammet Furkan Alada** (Dasbord Grafik Ekleme ve CSV Modeli Oluşturma , Mars Modelleri Oluşturma)

* **Eray Kaan Aydınlı** (Dasbord Grafik Ekleme ve Modelleri Test Etme)

* **Asım Aygün** (Dasboard Grafik ekleme ve Staging veri temizleme)

