# Data Dictionary

This file defines all fields in the OCD Patient dataset used by the Behavioral Health Analytics Dashboard. Use this reference when interpreting SQL query results, Power BI visuals, and analysis report findings.

---

## Dataset Overview

**Dataset Name:** OCD Patient Dataset: Demographics & Clinical Data  
**Source:** Kaggle  
**Grain:** One row per patient  
**Record Type:** Cross-sectional (single point-in-time snapshot per patient)  
**Total Fields:** 17  

---

## Field Definitions

### Patient Identifier

| Field Name | Data Type | Description | Example Values |
|---|---|---|---|
| `Patient ID` | Integer | Unique identifier assigned to each patient record. Not a real medical record number. | 1, 2, 3, ... |

---

### Demographics

| Field Name | Data Type | Description | Example Values |
|---|---|---|---|
| `Age` | Integer | Patient age in years at the time of data collection. | 18, 34, 65 |
| `Gender` | String | Patient-reported gender. | Male, Female |
| `Ethnicity` | String | Patient-reported ethnicity or racial/ethnic category. | African, Asian, Caucasian, Hispanic |
| `Marital Status` | String | Patient's marital status at the time of data collection. | Single, Married, Divorced |
| `Education Level` | String | Highest level of education completed by the patient. | High School, Some College, College Degree, Graduate Degree |

---

### Diagnosis & Clinical History

| Field Name | Data Type | Description | Example Values |
|---|---|---|---|
| `OCD Diagnosis Date` | Date | Date the patient received their formal OCD diagnosis. | 2014-03-15 |
| `Duration of Symptoms (months)` | Integer | Number of months the patient experienced OCD symptoms prior to or at the time of data collection. | 6, 24, 120 |
| `Previous Diagnoses` | String | Other psychiatric or mental health diagnoses the patient has received prior to or alongside the OCD diagnosis. | MDD, PTSD, GAD, None |

---

### Family History

| Field Name | Data Type | Description | Example Values |
|---|---|---|---|
| `Family History of OCD` | String | Indicates whether a first-degree family member (parent, sibling) has been diagnosed with OCD. | Yes, No |

---

### Symptom Profile

| Field Name | Data Type | Description | Example Values |
|---|---|---|---|
| `Obsession Type` | String | Primary category of obsessional thoughts experienced by the patient. | Contamination, Harm-related, Hoarding, Religious, Symmetry |
| `Compulsion Type` | String | Primary category of compulsive behaviors performed by the patient. | Checking, Counting, Ordering, Praying, Washing |
| `Y-BOCS Score (Obsessions)` | Integer | Yale-Brown Obsessive Compulsive Scale sub-score for obsessions. Ranges from 0 (no symptoms) to 20 (extreme symptoms). | 0–20 |
| `Y-BOCS Score (Compulsions)` | Integer | Yale-Brown Obsessive Compulsive Scale sub-score for compulsions. Ranges from 0 (no symptoms) to 20 (extreme symptoms). | 0–20 |

**Y-BOCS Total Score Severity Reference:**

| Total Score Range | Severity Classification |
|---|---|
| 0–7 | Subclinical |
| 8–15 | Mild |
| 16–23 | Moderate |
| 24–31 | Severe |
| 32–40 | Extreme |

> The total Y-BOCS score is the sum of the obsession and compulsion sub-scores (maximum = 40).

---

### Co-morbidities

| Field Name | Data Type | Description | Example Values |
|---|---|---|---|
| `Depression Diagnosis` | String | Indicates whether the patient has a co-occurring diagnosis of depression (Major Depressive Disorder or similar). | Yes, No |
| `Anxiety Diagnosis` | String | Indicates whether the patient has a co-occurring diagnosis of an anxiety disorder (Generalized Anxiety Disorder or similar). | Yes, No |

---

### Treatment

| Field Name | Data Type | Description | Example Values |
|---|---|---|---|
| `Medications` | String | Primary medication category currently prescribed to the patient for OCD or related conditions. | SNRI, SSRI, Benzodiazepine, None |

**Common Medication Categories:**

| Category | Description |
|---|---|
| SSRI | Selective Serotonin Reuptake Inhibitor (e.g., fluoxetine, sertraline) — first-line treatment for OCD |
| SNRI | Serotonin-Norepinephrine Reuptake Inhibitor (e.g., venlafaxine) |
| Benzodiazepine | Anti-anxiety medication (e.g., lorazepam, clonazepam) — typically adjunctive |
| None | No medication currently prescribed |

---

## Calculated Fields (Power BI)

The following fields are not present in the source dataset but are derived within Power BI. See [calculated_columns.md](calculated_columns.md) for DAX formulas.

| Field Name | Source | Description |
|---|---|---|
| `Total Y-BOCS Score` | Calculated Column | Sum of Y-BOCS obsession and compulsion sub-scores per patient |
| `Y-BOCS Severity Band` | Calculated Column | Clinical severity label based on total Y-BOCS score |
| `Age Group` | Calculated Column | Age band (e.g., 18-29, 30-39) for demographic grouping |
| `Symptom Duration Band` | Calculated Column | Duration band (e.g., 1-2 Years) for distribution analysis |
| `Diagnosis Year` | Calculated Column | Year extracted from OCD Diagnosis Date |
| `Has Comorbidity` | Calculated Column | Yes/No flag for any co-morbid depression or anxiety diagnosis |
| `Comorbidity Profile` | Calculated Column | Labeled combination of depression and anxiety diagnosis status |

---

## Notes on Data Interpretation

- This dataset is **cross-sectional**: all observations reflect a single point in time. Avoid drawing conclusions about changes over time.
- **Y-BOCS scores** are clinician-administered ratings. Their accuracy depends on the clinician's training and the patient's self-report during assessment.
- **Co-morbidity fields** reflect diagnoses recorded in the dataset and may not capture the full psychiatric history of each patient.
- **Medications** represent a broad category, not a specific drug name or dosage. Prescribing patterns may vary significantly within each category.
- **Family History of OCD** reflects patient-reported information and is limited to whether at least one family member has been diagnosed.
