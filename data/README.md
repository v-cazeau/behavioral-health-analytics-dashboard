# Data Folder

This folder contains all data-related assets for the Behavioral Health Analytics Dashboard project.

## Contents

| File | Description |
|---|---|
| `sql_queries.sql` | SQL queries for data exploration, aggregation, and transformation |
| `dax_measures.md` | DAX measures written for Power BI KPIs and calculations |
| `calculated_columns.md` | DAX calculated columns added to the Power BI data model |
| `data_dictionary.md` | Field-level definitions and metadata for the dataset |

## Data Source

This project uses the **OCD Patient Dataset: Demographics & Clinical Data** sourced from [Kaggle](https://www.kaggle.com/). The dataset is cross-sectional and contains de-identified clinical and demographic information for patients diagnosed with OCD.

> **Note:** No raw data files are stored in this repository. Please download the dataset directly from the source and load it into your SQL database or Power BI model before running queries or opening the dashboard.

## How to Use

1. Download the dataset from Kaggle and import it into SQL Server or MySQL.
2. Use `sql_queries.sql` to run exploratory and analytical queries against the imported data.
3. Open Power BI Desktop and connect to your data source.
4. Reference `dax_measures.md` and `calculated_columns.md` to recreate or verify calculations in the Power BI model.
5. Use `data_dictionary.md` as a reference when interpreting field values and clinical variables.
