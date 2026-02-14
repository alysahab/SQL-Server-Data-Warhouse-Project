# 📊 SQL Server Data Warehouse | Medallion Architecture

<p align="center">
  <img src="docs/Data Architecture.drawio.png" alt="Data Warehouse Architecture" width="100%">
</p>

## 🚀 Project Overview

Designed and implemented a scalable **Data Warehouse solution using Microsoft SQL Server**, following the **Medallion Architecture (Bronze → Silver → Gold)** pattern.

The system ingests raw CSV data from multiple source systems (CRM & ERP), transforms it through structured data layers, and delivers business-ready datasets optimized for analytics and reporting.

---

## 🏗 Architecture Design

**Bronze Layer (Raw Data)**

* Stores source data as-is
* Full load (Truncate & Insert)
* No transformations
* Ensures traceability & reprocessing capability

**Silver Layer (Cleaned & Standardized)**

* Data cleansing & validation
* Standardization & normalization
* Derived columns & enrichment
* Business rule implementation

**Gold Layer (Analytics-Ready)**

* Star schema modeling
* Fact & dimension design
* Aggregated reporting views
* Optimized for BI & analytics workloads

---

## 🛠 Tech Stack

* Database: Microsoft SQL Server
* Language: T-SQL
* Architecture: Medallion
* Modeling: Star Schema
* Data Source: CSV Files
* ETL Logic: Stored Procedures

---

## 📂 Project Structure

```
data-warehouse/
│
├── 01_bronze/      # Raw ingestion layer
├── 02_silver/      # Cleaned & transformed layer
├── 03_gold/        # Business-ready views
├── docs/           # Architecture diagram
└── README.md
```

---

## 🔄 Data Flow

```
CSV Files (CRM / ERP)
        ↓
Bronze Tables
        ↓
Silver Tables
        ↓
Gold Views (Star Schema)
        ↓
BI / Reporting / ML
```

---

## 📊 Key Data Engineering Concepts Demonstrated

* Layered Data Architecture (Medallion)
* Schema Separation (`bronze`, `silver`, `gold`)
* ETL using Stored Procedures
* Data Cleansing & Standardization
* Dimensional Modeling (Fact & Dimension Tables)
* Aggregation & Reporting Optimization
* Batch Processing Strategy

---

## 🎯 Business Value

* Improved data reliability through layered transformations
* Clear separation between raw, validated, and analytics-ready data
* Reusable and scalable warehouse design
* Optimized for BI tools and analytical queries

---

## 📈 Future Enhancements

* Incremental loading strategy
* Slowly Changing Dimensions (SCD Type 2)
* Index & partition optimization
* Orchestration using SQL Server Integration Services or Azure Data Factory

---

## 👤 About Me

Data Enthusiast
Passionate about building scalable, production-ready data systems.
