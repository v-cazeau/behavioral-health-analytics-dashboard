# Healthcare Analysis Report

**Project:** Behavioral Health Analytics Dashboard — OCD Patient Demographics & Clinical Data  
**Analyst:** *(Your Name)*  
**Date:** *(Date of Report)*  
**Version:** *(e.g., v1.0)*  

---

## 1. Executive Summary

*(Provide a 2–3 sentence summary of the analysis. Describe the dataset, the scope of the analysis, and the key themes explored. Do not state conclusions here — save those for Section 5.)*

---

## 2. Dataset Overview

| Attribute | Value |
|---|---|
| **Data Source** | OCD Patient Dataset: Demographics & Clinical Data (Kaggle) |
| **Total Records** | *(Insert record count after loading the data)* |
| **Total Fields** | 17 source fields + *(N)* calculated fields |
| **Record Grain** | One row per patient |
| **Data Type** | Cross-sectional |
| **Date Range of Diagnoses** | *(Insert after reviewing the data)* |
| **Tools Used** | SQL Server / MySQL, Power BI Desktop, DAX, Excel |

### Data Quality Notes

*(Document any data quality issues observed during exploration. Examples:)*

- **Missing values:** *(List any fields with null values and the counts)*
- **Outliers:** *(Describe any values that appear outside the expected range)*
- **Inconsistent values:** *(Note any fields with inconsistent capitalization, spacing, or coding)*
- **Assumptions:** *(List any assumptions made when handling data quality issues)*

---

## 3. Dashboard Structure

The Power BI dashboard contains the following pages:

| Page | Purpose |
|---|---|
| **Patient Demographics** | Visualizes age, gender, ethnicity, marital status, and education distributions |
| **Symptom Severity** | Explores Y-BOCS scores, obsession types, and compulsion types |
| **Medications & Treatment** | Analyzes medication categories and their distribution across patient groups |
| **Family History & Co-morbidities** | Examines family history of OCD and co-occurring depression/anxiety diagnoses |
| **Diagnosis Patterns** | Reviews symptom duration, diagnosis year trends, and previous diagnoses |

---

## 4. Analysis Findings

> **Note:** Replace all placeholder text below with actual observations from the data. Do not invent numbers or percentages. All values should come directly from the loaded dataset.

---

### 4.1 Patient Demographics

**Age Distribution**

*(Describe the age range and distribution observed in the data. Note the most common age bands. Reference the Age Group calculated column.)*

**Gender Distribution**

*(Describe the gender breakdown. Note whether one gender is more represented and by how much.)*

**Ethnicity Distribution**

*(Describe the ethnicity breakdown. Note the most and least represented groups.)*

**Marital Status Distribution**

*(Describe the marital status distribution.)*

**Education Level Distribution**

*(Describe the education level distribution.)*

---

### 4.2 Symptom Severity

**Y-BOCS Score Overview**

*(Describe the average, minimum, and maximum total Y-BOCS scores. Describe which severity bands (Subclinical, Mild, Moderate, Severe, Extreme) are most common.)*

**Obsession Types**

*(Describe the distribution of obsession types. Which type is most common?)*

**Compulsion Types**

*(Describe the distribution of compulsion types. Which type is most common?)*

**Y-BOCS Scores by Demographic Group**

*(If notable differences in Y-BOCS scores exist across gender, age group, or other demographic variables, describe them here. Remember: cross-sectional data shows association, not causation.)*

---

### 4.3 Medications & Treatment

**Medication Distribution**

*(Describe the breakdown of medication categories. What proportion of patients are prescribed SSRIs, SNRIs, benzodiazepines, or no medication?)*

**Medication Distribution by Gender**

*(Are there observable differences in medication distribution by gender?)*

**Y-BOCS Scores by Medication Type**

*(Describe the average Y-BOCS scores observed within each medication group. Note that this dataset does not allow for before/after comparisons.)*

---

### 4.4 Family History & Co-morbidities

**Family History of OCD**

*(What proportion of patients have a family history of OCD?)*

**Co-morbid Depression**

*(What proportion of patients have a co-morbid depression diagnosis?)*

**Co-morbid Anxiety**

*(What proportion of patients have a co-morbid anxiety diagnosis?)*

**Co-morbidity Profile Distribution**

*(Describe the breakdown of patients across the four co-morbidity profile groups: None, Depression Only, Anxiety Only, Depression & Anxiety.)*

**Y-BOCS Scores by Family History Status**

*(Are there observable differences in Y-BOCS scores between patients with and without a family history of OCD?)*

---

### 4.5 Diagnosis Patterns

**Symptom Duration**

*(Describe the distribution of symptom duration in months. What is the average duration? What bands are most common?)*

**Diagnosis Year Trends**

*(Describe how diagnosis counts vary by year. Note any observable patterns.)*

**Previous Diagnoses**

*(What previous diagnoses are most commonly reported alongside OCD?)*

---

## 5. Key Observations

*(List 3–5 notable observations from the analysis. These should describe what the data shows — not claim causation. Each observation should be supportable by the visuals and SQL results.)*

1. *(Observation 1)*
2. *(Observation 2)*
3. *(Observation 3)*
4. *(Observation 4)*
5. *(Observation 5)*

---

## 6. Analytical Limitations

*(Document limitations that affect interpretation of the findings.)*

- **Cross-sectional design:** This dataset captures a single snapshot in time. No conclusions about changes over time, treatment effectiveness, or causal relationships can be drawn.
- **Self-reported fields:** Fields such as family history and previous diagnoses rely on patient-reported information, which may not reflect complete clinical records.
- **Medication categories:** The dataset records broad medication categories, not specific drugs, dosages, or treatment durations.
- **Sample representativeness:** *(Comment on whether the sample appears representative of the broader OCD population based on the distributions observed.)*

---

## 7. Recommendations for Further Analysis

*(Optional: Suggest what types of additional data or study designs would allow deeper analysis.)*

- *(e.g., longitudinal follow-up data to examine treatment outcomes over time)*
- *(e.g., inclusion of therapy type alongside medication to understand combined treatment patterns)*
- *(e.g., more granular age-of-onset data to study early vs. late OCD presentation)*

---

## 8. Technical Appendix

### SQL Queries Used

See [data/sql_queries.sql](../data/sql_queries.sql) for all exploratory and analytical queries used during data preparation.

### DAX Measures

See [data/dax_measures.md](../data/dax_measures.md) for all DAX measures implemented in Power BI.

### Calculated Columns

See [data/calculated_columns.md](../data/calculated_columns.md) for all DAX calculated columns added to the Power BI data model.

### Data Dictionary

See [data/data_dictionary.md](../data/data_dictionary.md) for field-level definitions and clinical reference information.

---

*Report template created for the Behavioral Health Analytics Dashboard portfolio project.*
