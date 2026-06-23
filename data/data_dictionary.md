# OCD Patient Dataset Data Dictionary

## Overview

This data dictionary defines the fields used in the OCD Patient Healthcare Analytics Dashboard. The dataset contains patient demographic, diagnostic, symptom severity, medication, and mental health history information used for SQL analysis and Power BI dashboard development.

---

## Table Structure Notes

* Dataset contains 17 fields.
* `Patient ID` serves as the patient record identifier.
* The imported table structure does not show a formal primary key constraint.
* All fields are nullable in the imported schema.
* Data types were assigned during import into SQL Server for analysis and dashboard development.

---

## Data Dictionary

| Column Name                   | Data Type | Description                                                                             | Example Values                                             |
| ----------------------------- | --------- | --------------------------------------------------------------------------------------- | ---------------------------------------------------------- |
| Patient ID                    | Integer   | Unique identifier assigned to each patient record.                                      | 1018, 2406                                                 |
| Age                           | Integer   | Patient age at the time of data collection.                                             | 21, 32, 69                                                 |
| Gender                        | Text      | Patient-reported gender.                                                                | Male, Female                                               |
| Ethnicity                     | Text      | Patient ethnicity classification.                                                       | African, Asian, Hispanic, Caucasian                        |
| Marital Status                | Text      | Current marital status of the patient.                                                  | Single, Married, Divorced                                  |
| Education Level               | Text      | Highest education level attained.                                                       | High School, Some College, College Degree, Graduate Degree |
| OCD Diagnosis Date            | Date      | Date the patient was diagnosed with Obsessive-Compulsive Disorder (OCD).                | 2016-07-15                                                 |
| Duration of Symptoms (months) | Integer   | Number of months the patient has experienced OCD symptoms.                              | 46, 126, 203                                               |
| Previous Diagnoses            | Text      | Prior mental health diagnosis documented before or alongside OCD diagnosis.             | MDD, GAD, PTSD, Panic Disorder                             |
| Family History of OCD         | Text      | Indicates whether the patient reports a family history of OCD.                          | Yes, No                                                    |
| Obsession Type                | Text      | Primary obsession category associated with OCD symptoms.                                | Contamination, Harm-related, Symmetry, Hoarding, Religious |
| Compulsion Type               | Text      | Primary compulsive behavior category.                                                   | Washing, Checking, Ordering, Counting, Praying             |
| Y-BOCS Score (Obsessions)     | Integer   | Yale-Brown Obsessive Compulsive Scale score measuring obsession severity. Range: 0–40.  | 17, 31, 40                                                 |
| Y-BOCS Score (Compulsions)    | Integer   | Yale-Brown Obsessive Compulsive Scale score measuring compulsion severity. Range: 0–40. | 10, 25, 39                                                 |
| Depression Diagnosis          | Text      | Indicates whether the patient has a diagnosed depressive disorder.                      | Yes, No                                                    |
| Anxiety Diagnosis             | Text      | Indicates whether the patient has a diagnosed anxiety disorder.                         | Yes, No                                                    |
| Medications                   | Text      | Medication category currently prescribed to the patient.                                | SSRI, SNRI, Benzodiazepine                                 |

---

## Dashboard Measures

The following measures were used to transform patient-level records into dashboard insights:

| Measure                      | Description                                                                      |
| ---------------------------- | -------------------------------------------------------------------------------- |
| Total Patients               | Count of patient records included in the analysis.                               |
| Average Age                  | Average patient age across the dataset.                                          |
| Average Duration of Symptoms | Average duration of OCD symptoms in months.                                      |
| Average Obsession Score      | Average Y-BOCS Obsession score.                                                  |
| Average Compulsion Score     | Average Y-BOCS Compulsion score.                                                 |
| Patients by Gender           | Distribution of patients by gender.                                              |
| Patients by Ethnicity        | Distribution of patients by ethnicity.                                           |
| Medication Distribution      | Distribution of medication categories.                                           |
| Obsession Type Distribution  | Distribution of obsession categories.                                            |
| Compulsion Type Distribution | Distribution of compulsion categories.                                           |
| Family History Distribution  | Distribution of patients reporting a family history of OCD.                      |
| Diagnosis Breakdown          | Distribution of previous diagnoses, anxiety diagnoses, and depression diagnoses. |

---

## Clinical Context

The Yale-Brown Obsessive Compulsive Scale (Y-BOCS) is a widely used clinical assessment tool for measuring the severity of obsessive-compulsive symptoms. Separate scores are recorded for obsessions and compulsions, with higher scores indicating greater symptom severity.

---

## Data Quality Considerations

| Area                | Observation                                                                                  |
| ------------------- | -------------------------------------------------------------------------------------------- |
| Record Identifier   | `Patient ID` serves as the patient identifier within the dataset.                            |
| Nullable Fields     | All fields are shown as nullable in the imported table structure.                            |
| Categorical Data    | Several fields contain categorical values used for segmentation and filtering.               |
| Date Field          | `OCD Diagnosis Date` enables temporal analysis and trend reporting.                          |
| Clinical Metrics    | Y-BOCS scores provide quantitative measures of symptom severity.                             |
| Dashboard Use Cases | Supports demographic, diagnostic, medication, symptom severity, and family history analysis. |
