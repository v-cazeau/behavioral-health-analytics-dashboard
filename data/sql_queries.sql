-- =============================================================================
-- OCD Patient Dataset: SQL Queries
-- Project: Behavioral Health Analytics Dashboard
-- Database: SQL Server / MySQL
-- =============================================================================
-- These queries are organized by analytical theme. Replace [table_name] with
-- the actual table name used in your database after importing the dataset.
-- =============================================================================


-- =============================================================================
-- SECTION 1: DATA EXPLORATION & VALIDATION
-- =============================================================================

-- 1.1 Preview the dataset
SELECT TOP 100 *
FROM [table_name];

-- 1.2 Count total records
SELECT COUNT(*) AS total_patients
FROM [table_name];

-- 1.3 Check for NULL values across key columns
SELECT
    SUM(CASE WHEN [Patient ID]         IS NULL THEN 1 ELSE 0 END) AS null_patient_id,
    SUM(CASE WHEN [Age]                IS NULL THEN 1 ELSE 0 END) AS null_age,
    SUM(CASE WHEN [Gender]             IS NULL THEN 1 ELSE 0 END) AS null_gender,
    SUM(CASE WHEN [Ethnicity]          IS NULL THEN 1 ELSE 0 END) AS null_ethnicity,
    SUM(CASE WHEN [Marital Status]     IS NULL THEN 1 ELSE 0 END) AS null_marital_status,
    SUM(CASE WHEN [Education Level]    IS NULL THEN 1 ELSE 0 END) AS null_education_level,
    SUM(CASE WHEN [OCD Diagnosis Date] IS NULL THEN 1 ELSE 0 END) AS null_diagnosis_date,
    SUM(CASE WHEN [Duration of Symptoms (months)] IS NULL THEN 1 ELSE 0 END) AS null_symptom_duration,
    SUM(CASE WHEN [Previous Diagnoses] IS NULL THEN 1 ELSE 0 END) AS null_previous_diagnoses,
    SUM(CASE WHEN [Family History of OCD] IS NULL THEN 1 ELSE 0 END) AS null_family_history,
    SUM(CASE WHEN [Obsession Type]     IS NULL THEN 1 ELSE 0 END) AS null_obsession_type,
    SUM(CASE WHEN [Compulsion Type]    IS NULL THEN 1 ELSE 0 END) AS null_compulsion_type,
    SUM(CASE WHEN [Y-BOCS Score (Obsessions)] IS NULL THEN 1 ELSE 0 END) AS null_ybocs_obsessions,
    SUM(CASE WHEN [Y-BOCS Score (Compulsions)] IS NULL THEN 1 ELSE 0 END) AS null_ybocs_compulsions,
    SUM(CASE WHEN [Depression Diagnosis] IS NULL THEN 1 ELSE 0 END) AS null_depression,
    SUM(CASE WHEN [Anxiety Diagnosis]  IS NULL THEN 1 ELSE 0 END) AS null_anxiety,
    SUM(CASE WHEN [Medications]        IS NULL THEN 1 ELSE 0 END) AS null_medications
FROM [table_name];

-- 1.4 Review distinct values for categorical columns
SELECT DISTINCT [Gender]          FROM [table_name] ORDER BY [Gender];
SELECT DISTINCT [Ethnicity]       FROM [table_name] ORDER BY [Ethnicity];
SELECT DISTINCT [Marital Status]  FROM [table_name] ORDER BY [Marital Status];
SELECT DISTINCT [Education Level] FROM [table_name] ORDER BY [Education Level];
SELECT DISTINCT [Obsession Type]  FROM [table_name] ORDER BY [Obsession Type];
SELECT DISTINCT [Compulsion Type] FROM [table_name] ORDER BY [Compulsion Type];
SELECT DISTINCT [Medications]     FROM [table_name] ORDER BY [Medications];
SELECT DISTINCT [Previous Diagnoses] FROM [table_name] ORDER BY [Previous Diagnoses];

-- 1.5 Summary statistics for numeric columns
SELECT
    MIN([Age])                              AS min_age,
    MAX([Age])                              AS max_age,
    AVG(CAST([Age] AS FLOAT))               AS avg_age,
    MIN([Duration of Symptoms (months)])    AS min_symptom_duration,
    MAX([Duration of Symptoms (months)])    AS max_symptom_duration,
    AVG(CAST([Duration of Symptoms (months)] AS FLOAT)) AS avg_symptom_duration,
    MIN([Y-BOCS Score (Obsessions)])        AS min_ybocs_obsessions,
    MAX([Y-BOCS Score (Obsessions)])        AS max_ybocs_obsessions,
    AVG(CAST([Y-BOCS Score (Obsessions)] AS FLOAT)) AS avg_ybocs_obsessions,
    MIN([Y-BOCS Score (Compulsions)])       AS min_ybocs_compulsions,
    MAX([Y-BOCS Score (Compulsions)])       AS max_ybocs_compulsions,
    AVG(CAST([Y-BOCS Score (Compulsions)] AS FLOAT)) AS avg_ybocs_compulsions
FROM [table_name];


-- =============================================================================
-- SECTION 2: PATIENT DEMOGRAPHICS
-- =============================================================================

-- 2.1 Gender distribution
SELECT
    [Gender],
    COUNT(*) AS patient_count,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS pct_of_total
FROM [table_name]
GROUP BY [Gender]
ORDER BY patient_count DESC;

-- 2.2 Ethnicity distribution
SELECT
    [Ethnicity],
    COUNT(*) AS patient_count,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS pct_of_total
FROM [table_name]
GROUP BY [Ethnicity]
ORDER BY patient_count DESC;

-- 2.3 Marital status distribution
SELECT
    [Marital Status],
    COUNT(*) AS patient_count,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS pct_of_total
FROM [table_name]
GROUP BY [Marital Status]
ORDER BY patient_count DESC;

-- 2.4 Education level distribution
SELECT
    [Education Level],
    COUNT(*) AS patient_count,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS pct_of_total
FROM [table_name]
GROUP BY [Education Level]
ORDER BY patient_count DESC;

-- 2.5 Age distribution by decade
SELECT
    CASE
        WHEN [Age] BETWEEN 18 AND 29 THEN '18-29'
        WHEN [Age] BETWEEN 30 AND 39 THEN '30-39'
        WHEN [Age] BETWEEN 40 AND 49 THEN '40-49'
        WHEN [Age] BETWEEN 50 AND 59 THEN '50-59'
        WHEN [Age] >= 60             THEN '60+'
        ELSE 'Under 18'
    END AS age_group,
    COUNT(*) AS patient_count
FROM [table_name]
GROUP BY
    CASE
        WHEN [Age] BETWEEN 18 AND 29 THEN '18-29'
        WHEN [Age] BETWEEN 30 AND 39 THEN '30-39'
        WHEN [Age] BETWEEN 40 AND 49 THEN '40-49'
        WHEN [Age] BETWEEN 50 AND 59 THEN '50-59'
        WHEN [Age] >= 60             THEN '60+'
        ELSE 'Under 18'
    END
ORDER BY age_group;


-- =============================================================================
-- SECTION 3: SYMPTOM SEVERITY (Y-BOCS)
-- =============================================================================

-- 3.1 Average Y-BOCS scores by gender
SELECT
    [Gender],
    ROUND(AVG(CAST([Y-BOCS Score (Obsessions)] AS FLOAT)), 2)  AS avg_obsession_score,
    ROUND(AVG(CAST([Y-BOCS Score (Compulsions)] AS FLOAT)), 2) AS avg_compulsion_score,
    ROUND(AVG(CAST([Y-BOCS Score (Obsessions)] AS FLOAT) +
              CAST([Y-BOCS Score (Compulsions)] AS FLOAT)), 2) AS avg_total_ybocs
FROM [table_name]
GROUP BY [Gender]
ORDER BY avg_total_ybocs DESC;

-- 3.2 Distribution of obsession types
SELECT
    [Obsession Type],
    COUNT(*) AS patient_count,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS pct_of_total
FROM [table_name]
GROUP BY [Obsession Type]
ORDER BY patient_count DESC;

-- 3.3 Distribution of compulsion types
SELECT
    [Compulsion Type],
    COUNT(*) AS patient_count,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS pct_of_total
FROM [table_name]
GROUP BY [Compulsion Type]
ORDER BY patient_count DESC;

-- 3.4 Average Y-BOCS scores by obsession type
SELECT
    [Obsession Type],
    COUNT(*) AS patient_count,
    ROUND(AVG(CAST([Y-BOCS Score (Obsessions)] AS FLOAT)), 2)  AS avg_obsession_score,
    ROUND(AVG(CAST([Y-BOCS Score (Compulsions)] AS FLOAT)), 2) AS avg_compulsion_score
FROM [table_name]
GROUP BY [Obsession Type]
ORDER BY avg_obsession_score DESC;

-- 3.5 Y-BOCS severity classification
-- Reference: 0-7 Subclinical, 8-15 Mild, 16-23 Moderate, 24-31 Severe, 32-40 Extreme
SELECT
    CASE
        WHEN ([Y-BOCS Score (Obsessions)] + [Y-BOCS Score (Compulsions)]) BETWEEN 0  AND 7  THEN '0-7: Subclinical'
        WHEN ([Y-BOCS Score (Obsessions)] + [Y-BOCS Score (Compulsions)]) BETWEEN 8  AND 15 THEN '8-15: Mild'
        WHEN ([Y-BOCS Score (Obsessions)] + [Y-BOCS Score (Compulsions)]) BETWEEN 16 AND 23 THEN '16-23: Moderate'
        WHEN ([Y-BOCS Score (Obsessions)] + [Y-BOCS Score (Compulsions)]) BETWEEN 24 AND 31 THEN '24-31: Severe'
        WHEN ([Y-BOCS Score (Obsessions)] + [Y-BOCS Score (Compulsions)]) BETWEEN 32 AND 40 THEN '32-40: Extreme'
        ELSE 'Unknown'
    END AS severity_band,
    COUNT(*) AS patient_count,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS pct_of_total
FROM [table_name]
GROUP BY
    CASE
        WHEN ([Y-BOCS Score (Obsessions)] + [Y-BOCS Score (Compulsions)]) BETWEEN 0  AND 7  THEN '0-7: Subclinical'
        WHEN ([Y-BOCS Score (Obsessions)] + [Y-BOCS Score (Compulsions)]) BETWEEN 8  AND 15 THEN '8-15: Mild'
        WHEN ([Y-BOCS Score (Obsessions)] + [Y-BOCS Score (Compulsions)]) BETWEEN 16 AND 23 THEN '16-23: Moderate'
        WHEN ([Y-BOCS Score (Obsessions)] + [Y-BOCS Score (Compulsions)]) BETWEEN 24 AND 31 THEN '24-31: Severe'
        WHEN ([Y-BOCS Score (Obsessions)] + [Y-BOCS Score (Compulsions)]) BETWEEN 32 AND 40 THEN '32-40: Extreme'
        ELSE 'Unknown'
    END
ORDER BY severity_band;


-- =============================================================================
-- SECTION 4: MEDICATIONS & TREATMENT
-- =============================================================================

-- 4.1 Medication distribution
SELECT
    [Medications],
    COUNT(*) AS patient_count,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS pct_of_total
FROM [table_name]
GROUP BY [Medications]
ORDER BY patient_count DESC;

-- 4.2 Medication distribution by gender
SELECT
    [Gender],
    [Medications],
    COUNT(*) AS patient_count
FROM [table_name]
GROUP BY [Gender], [Medications]
ORDER BY [Gender], patient_count DESC;

-- 4.3 Average Y-BOCS scores by medication type
SELECT
    [Medications],
    COUNT(*) AS patient_count,
    ROUND(AVG(CAST([Y-BOCS Score (Obsessions)] AS FLOAT) +
              CAST([Y-BOCS Score (Compulsions)] AS FLOAT)), 2) AS avg_total_ybocs
FROM [table_name]
GROUP BY [Medications]
ORDER BY avg_total_ybocs DESC;


-- =============================================================================
-- SECTION 5: FAMILY HISTORY & CO-MORBIDITIES
-- =============================================================================

-- 5.1 Family history of OCD distribution
SELECT
    [Family History of OCD],
    COUNT(*) AS patient_count,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS pct_of_total
FROM [table_name]
GROUP BY [Family History of OCD]
ORDER BY patient_count DESC;

-- 5.2 Depression diagnosis distribution
SELECT
    [Depression Diagnosis],
    COUNT(*) AS patient_count,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS pct_of_total
FROM [table_name]
GROUP BY [Depression Diagnosis]
ORDER BY patient_count DESC;

-- 5.3 Anxiety diagnosis distribution
SELECT
    [Anxiety Diagnosis],
    COUNT(*) AS patient_count,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS pct_of_total
FROM [table_name]
GROUP BY [Anxiety Diagnosis]
ORDER BY patient_count DESC;

-- 5.4 Co-morbidity combinations (depression and anxiety)
SELECT
    [Depression Diagnosis],
    [Anxiety Diagnosis],
    COUNT(*) AS patient_count,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS pct_of_total
FROM [table_name]
GROUP BY [Depression Diagnosis], [Anxiety Diagnosis]
ORDER BY patient_count DESC;

-- 5.5 Average Y-BOCS scores by family history status
SELECT
    [Family History of OCD],
    COUNT(*) AS patient_count,
    ROUND(AVG(CAST([Y-BOCS Score (Obsessions)] AS FLOAT)), 2)  AS avg_obsession_score,
    ROUND(AVG(CAST([Y-BOCS Score (Compulsions)] AS FLOAT)), 2) AS avg_compulsion_score,
    ROUND(AVG(CAST([Y-BOCS Score (Obsessions)] AS FLOAT) +
              CAST([Y-BOCS Score (Compulsions)] AS FLOAT)), 2) AS avg_total_ybocs
FROM [table_name]
GROUP BY [Family History of OCD]
ORDER BY avg_total_ybocs DESC;


-- =============================================================================
-- SECTION 6: DIAGNOSIS PATTERNS
-- =============================================================================

-- 6.1 Symptom duration distribution
SELECT
    CASE
        WHEN [Duration of Symptoms (months)] BETWEEN 0  AND 11  THEN '0-11 months'
        WHEN [Duration of Symptoms (months)] BETWEEN 12 AND 23  THEN '12-23 months'
        WHEN [Duration of Symptoms (months)] BETWEEN 24 AND 59  THEN '24-59 months'
        WHEN [Duration of Symptoms (months)] BETWEEN 60 AND 119 THEN '60-119 months'
        WHEN [Duration of Symptoms (months)] >= 120             THEN '120+ months'
        ELSE 'Unknown'
    END AS duration_band,
    COUNT(*) AS patient_count
FROM [table_name]
GROUP BY
    CASE
        WHEN [Duration of Symptoms (months)] BETWEEN 0  AND 11  THEN '0-11 months'
        WHEN [Duration of Symptoms (months)] BETWEEN 12 AND 23  THEN '12-23 months'
        WHEN [Duration of Symptoms (months)] BETWEEN 24 AND 59  THEN '24-59 months'
        WHEN [Duration of Symptoms (months)] BETWEEN 60 AND 119 THEN '60-119 months'
        WHEN [Duration of Symptoms (months)] >= 120             THEN '120+ months'
        ELSE 'Unknown'
    END
ORDER BY duration_band;

-- 6.2 Previous diagnoses distribution
SELECT
    [Previous Diagnoses],
    COUNT(*) AS patient_count,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS pct_of_total
FROM [table_name]
GROUP BY [Previous Diagnoses]
ORDER BY patient_count DESC;

-- 6.3 Diagnosis date — count of diagnoses by year
SELECT
    YEAR([OCD Diagnosis Date]) AS diagnosis_year,
    COUNT(*) AS diagnoses_count
FROM [table_name]
WHERE [OCD Diagnosis Date] IS NOT NULL
GROUP BY YEAR([OCD Diagnosis Date])
ORDER BY diagnosis_year;

-- 6.4 Patient profile summary — demographics and clinical variables in a single view
SELECT
    [Patient ID],
    [Age],
    [Gender],
    [Ethnicity],
    [Marital Status],
    [Education Level],
    [OCD Diagnosis Date],
    [Duration of Symptoms (months)],
    [Previous Diagnoses],
    [Family History of OCD],
    [Obsession Type],
    [Compulsion Type],
    [Y-BOCS Score (Obsessions)],
    [Y-BOCS Score (Compulsions)],
    ([Y-BOCS Score (Obsessions)] + [Y-BOCS Score (Compulsions)]) AS total_ybocs_score,
    [Depression Diagnosis],
    [Anxiety Diagnosis],
    [Medications]
FROM [table_name]
ORDER BY [Patient ID];
