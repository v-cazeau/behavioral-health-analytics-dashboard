# Calculated Columns

This file documents all DAX calculated columns added to the Power BI data model for the Behavioral Health Analytics Dashboard.

Calculated columns are computed row-by-row when the data is loaded and stored in the model as new fields. They are useful for row-level categorization, binning, and labeling that can then be used in slicers, filters, and visualizations.

---

## How to Add These Calculated Columns in Power BI

1. Open Power BI Desktop and load your data.
2. In the **Data** view, select the table where you want to add the column.
3. On the **Table tools** ribbon, select **New Column**.
4. Paste the DAX formula and rename the column as indicated.

---

## Calculated Columns

### Age Group

```dax
-- Categorizes patients into age bands for demographic slicing
Age Group =
SWITCH(
    TRUE(),
    'OCD_Patients'[Age] < 18,             "Under 18",
    'OCD_Patients'[Age] BETWEEN 18 AND 29, "18-29",
    'OCD_Patients'[Age] BETWEEN 30 AND 39, "30-39",
    'OCD_Patients'[Age] BETWEEN 40 AND 49, "40-49",
    'OCD_Patients'[Age] BETWEEN 50 AND 59, "50-59",
    'OCD_Patients'[Age] >= 60,             "60+",
    "Unknown"
)
```

---

### Total Y-BOCS Score

```dax
-- Combines obsession and compulsion Y-BOCS scores into a single total score per patient
Total Y-BOCS Score =
'OCD_Patients'[Y-BOCS Score (Obsessions)] + 'OCD_Patients'[Y-BOCS Score (Compulsions)]
```

---

### Y-BOCS Severity Band

```dax
-- Classifies each patient's total Y-BOCS score into a clinical severity category
-- Reference: 0-7 Subclinical, 8-15 Mild, 16-23 Moderate, 24-31 Severe, 32-40 Extreme
Y-BOCS Severity Band =
SWITCH(
    TRUE(),
    'OCD_Patients'[Total Y-BOCS Score] BETWEEN 0  AND 7,  "Subclinical",
    'OCD_Patients'[Total Y-BOCS Score] BETWEEN 8  AND 15, "Mild",
    'OCD_Patients'[Total Y-BOCS Score] BETWEEN 16 AND 23, "Moderate",
    'OCD_Patients'[Total Y-BOCS Score] BETWEEN 24 AND 31, "Severe",
    'OCD_Patients'[Total Y-BOCS Score] BETWEEN 32 AND 40, "Extreme",
    "Unknown"
)
```

> **Note:** This column depends on `[Total Y-BOCS Score]` — create that column first.

---

### Symptom Duration Band

```dax
-- Groups symptom duration into bands for distribution analysis
Symptom Duration Band =
SWITCH(
    TRUE(),
    'OCD_Patients'[Duration of Symptoms (months)] < 12,                  "< 1 Year",
    'OCD_Patients'[Duration of Symptoms (months)] BETWEEN 12 AND 23,     "1-2 Years",
    'OCD_Patients'[Duration of Symptoms (months)] BETWEEN 24 AND 59,     "2-5 Years",
    'OCD_Patients'[Duration of Symptoms (months)] BETWEEN 60 AND 119,    "5-10 Years",
    'OCD_Patients'[Duration of Symptoms (months)] >= 120,                "10+ Years",
    "Unknown"
)
```

---

### Diagnosis Year

```dax
-- Extracts the year from the OCD diagnosis date for time-based grouping
Diagnosis Year =
YEAR( 'OCD_Patients'[OCD Diagnosis Date] )
```

---

### Has Co-morbidity

```dax
-- Flags patients who have at least one co-morbid diagnosis (depression or anxiety)
Has Comorbidity =
IF(
    'OCD_Patients'[Depression Diagnosis] = "Yes"
        || 'OCD_Patients'[Anxiety Diagnosis] = "Yes",
    "Yes",
    "No"
)
```

---

### Co-morbidity Profile

```dax
-- Labels each patient's co-morbidity combination for cross-filter use
Comorbidity Profile =
SWITCH(
    TRUE(),
    ( 'OCD_Patients'[Depression Diagnosis] = "Yes" && 'OCD_Patients'[Anxiety Diagnosis] = "Yes" ), "Depression & Anxiety",
    ( 'OCD_Patients'[Depression Diagnosis] = "Yes" && 'OCD_Patients'[Anxiety Diagnosis] = "No"  ), "Depression Only",
    ( 'OCD_Patients'[Depression Diagnosis] = "No"  && 'OCD_Patients'[Anxiety Diagnosis] = "Yes" ), "Anxiety Only",
    ( 'OCD_Patients'[Depression Diagnosis] = "No"  && 'OCD_Patients'[Anxiety Diagnosis] = "No"  ), "None",
    "Unknown"
)
```

---

## Notes

- Replace `'OCD_Patients'` with the actual table name in your Power BI data model.
- Calculated columns that reference other calculated columns (e.g., `[Y-BOCS Severity Band]` referencing `[Total Y-BOCS Score]`) must be created in dependency order.
- Sort order for categorical columns (e.g., `Age Group`, `Y-BOCS Severity Band`) can be configured using **Sort by Column** in the **Column tools** ribbon to ensure logical ordering in visuals.
- Use these columns as slicer fields, legend values, or axis categories in Power BI visualizations.
