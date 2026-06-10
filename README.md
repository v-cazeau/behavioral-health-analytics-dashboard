# Behavioral Health Analytics Dashboard

Healthcare analytics dashboard exploring OCD patient demographics, symptom severity, medications, family history, and diagnosis-related patterns using SQL Server, Power BI, and DAX.

---

## Project Overview

This project analyzes a cross-sectional dataset of patients diagnosed with Obsessive-Compulsive Disorder (OCD). The goal is to surface meaningful patterns across patient demographics, symptom profiles, treatment histories, and diagnosis-related variables through interactive Power BI dashboards and supporting SQL/DAX analysis.

This repository is structured as a professional portfolio project targeting entry-level roles such as **Healthcare Data Analyst**, **Clinical Data Analyst**, and **Reporting Analyst**.

---

## Tools Used

| Tool | Purpose |
|---|---|
| **SQL Server / MySQL** | Data extraction, transformation, and exploratory queries |
| **Power BI** | Interactive dashboard development and data visualization |
| **DAX** | Calculated measures and KPIs within Power BI |
| **Excel** | Data inspection, preliminary cleaning, and ad-hoc analysis |

---

## Dashboard Structure

The Power BI dashboard is organized into the following pages:

1. **Patient Demographics** — Age distribution, gender breakdown, marital status, education level, and ethnicity
2. **Symptom Severity** — Y-BOCS (Yale-Brown Obsessive Compulsive Scale) score distributions, obsession type, and compulsion type breakdowns
3. **Medications & Treatment** — Medication categories, prescribing patterns, and medication status
4. **Family History & Co-morbidities** — Family history of OCD, depression and anxiety diagnoses, and co-occurrence patterns
5. **Diagnosis Patterns** — Duration since OCD diagnosis, time-to-diagnosis trends, and clinical subgroup comparisons

---

## Skills Demonstrated

- Writing and optimizing SQL queries for healthcare data exploration
- Building calculated columns and DAX measures for clinical KPIs
- Designing multi-page Power BI dashboards with cross-filter interactions
- Applying data storytelling principles to a clinical dataset
- Structuring a professional analytics portfolio for healthcare roles
- Documenting data assets using a data dictionary

---

## Key Learnings

Working with cross-sectional healthcare data introduces several important analytical considerations:

- **Snapshot vs. longitudinal data:** Cross-sectional datasets represent a single point in time, meaning trends cannot be inferred — only associations and distributions can be described.
- **Clinical variable context:** Healthcare metrics such as Y-BOCS scores, diagnosis codes, and medication categories require domain understanding before drawing analytical conclusions.
- **Data quality in clinical records:** Real-world healthcare datasets often contain missing values, inconsistent coding, or outliers that must be documented and handled transparently.
- **Avoiding causal claims:** Associations observed in cross-sectional data should not be interpreted as causal relationships without further study design considerations.

---

## Repository Contents

```
behavioral-health-analytics-dashboard/
├── README.md                          # This file — project overview and documentation
├── data/
│   ├── README.md                      # Overview of the data folder contents
│   ├── sql_queries.sql                # SQL queries for data exploration and transformation
│   ├── dax_measures.md                # DAX measures used in Power BI
│   ├── calculated_columns.md          # DAX calculated columns used in Power BI
│   └── data_dictionary.md             # Field-level definitions for the dataset
├── dashboard/
│   └── README.md                      # Instructions for the Power BI .pbix file and screenshots
└── report/
    └── healthcare-analysis-report.md  # Template for documenting findings and observations
```

---

## Getting Started

1. Review the [data dictionary](data/data_dictionary.md) to understand the dataset fields.
2. Run the [SQL queries](data/sql_queries.sql) against your database to explore and prepare the data.
3. Open the Power BI `.pbix` file (see [dashboard/README.md](dashboard/README.md)) to explore the interactive dashboard.
4. Review [DAX measures](data/dax_measures.md) and [calculated columns](data/calculated_columns.md) for details on custom calculations.
5. Document your findings in the [analysis report](report/healthcare-analysis-report.md).

---

## Dataset

This project uses the **OCD Patient Dataset: Demographics & Clinical Data** available on [Kaggle](https://www.kaggle.com/). Please refer to the dataset's original license and terms of use before redistribution.

---

*This project was developed as part of a healthcare analytics portfolio. No patient data is stored in this repository.*
