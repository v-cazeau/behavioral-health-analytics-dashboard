# DAX Measures

This file documents all DAX measures created in the Power BI data model for the Behavioral Health Analytics Dashboard.

DAX measures are calculated at query time and respond to report filters and slicers. They are stored in the Power BI model and referenced in visualizations.

---

## How to Add These Measures in Power BI

1. Open Power BI Desktop and load your data.
2. In the **Data** or **Report** view, select the table where you want to store the measure.
3. On the **Home** ribbon, select **New Measure**.
4. Paste the DAX formula and rename the measure as indicated.

---

## Measures

### Patient Counts

```dax
-- Total number of patients in the dataset (respects all active filters)
Total Patients =
COUNTROWS( 'OCD_Patients' )
```

```dax
-- Count of patients with a family history of OCD
Patients With Family History =
CALCULATE(
    COUNTROWS( 'OCD_Patients' ),
    'OCD_Patients'[Family History of OCD] = "Yes"
)
```

```dax
-- Count of patients without a family history of OCD
Patients Without Family History =
CALCULATE(
    COUNTROWS( 'OCD_Patients' ),
    'OCD_Patients'[Family History of OCD] = "No"
)
```

```dax
-- Count of patients with a depression diagnosis
Patients With Depression =
CALCULATE(
    COUNTROWS( 'OCD_Patients' ),
    'OCD_Patients'[Depression Diagnosis] = "Yes"
)
```

```dax
-- Count of patients with an anxiety diagnosis
Patients With Anxiety =
CALCULATE(
    COUNTROWS( 'OCD_Patients' ),
    'OCD_Patients'[Anxiety Diagnosis] = "Yes"
)
```

```dax
-- Count of patients with both depression and anxiety diagnoses
Patients With Both Comorbidities =
CALCULATE(
    COUNTROWS( 'OCD_Patients' ),
    'OCD_Patients'[Depression Diagnosis] = "Yes",
    'OCD_Patients'[Anxiety Diagnosis] = "Yes"
)
```

---

### Y-BOCS Score Measures

```dax
-- Average Y-BOCS obsession score (filtered context-aware)
Avg Obsession Score =
AVERAGE( 'OCD_Patients'[Y-BOCS Score (Obsessions)] )
```

```dax
-- Average Y-BOCS compulsion score (filtered context-aware)
Avg Compulsion Score =
AVERAGE( 'OCD_Patients'[Y-BOCS Score (Compulsions)] )
```

```dax
-- Average total Y-BOCS score (obsessions + compulsions)
Avg Total Y-BOCS Score =
AVERAGEX(
    'OCD_Patients',
    'OCD_Patients'[Y-BOCS Score (Obsessions)] + 'OCD_Patients'[Y-BOCS Score (Compulsions)]
)
```

```dax
-- Maximum total Y-BOCS score
Max Total Y-BOCS Score =
MAXX(
    'OCD_Patients',
    'OCD_Patients'[Y-BOCS Score (Obsessions)] + 'OCD_Patients'[Y-BOCS Score (Compulsions)]
)
```

```dax
-- Minimum total Y-BOCS score
Min Total Y-BOCS Score =
MINX(
    'OCD_Patients',
    'OCD_Patients'[Y-BOCS Score (Obsessions)] + 'OCD_Patients'[Y-BOCS Score (Compulsions)]
)
```

---

### Demographic Measures

```dax
-- Average patient age
Avg Patient Age =
AVERAGE( 'OCD_Patients'[Age] )
```

```dax
-- Count of female patients
Female Patient Count =
CALCULATE(
    COUNTROWS( 'OCD_Patients' ),
    'OCD_Patients'[Gender] = "Female"
)
```

```dax
-- Count of male patients
Male Patient Count =
CALCULATE(
    COUNTROWS( 'OCD_Patients' ),
    'OCD_Patients'[Gender] = "Male"
)
```

```dax
-- Percentage of female patients (as a decimal; format as % in Power BI)
% Female Patients =
DIVIDE(
    [Female Patient Count],
    [Total Patients],
    0
)
```

```dax
-- Percentage of male patients (as a decimal; format as % in Power BI)
% Male Patients =
DIVIDE(
    [Male Patient Count],
    [Total Patients],
    0
)
```

---

### Symptom Duration Measures

```dax
-- Average duration of symptoms in months
Avg Symptom Duration (Months) =
AVERAGE( 'OCD_Patients'[Duration of Symptoms (months)] )
```

```dax
-- Average duration of symptoms in years
Avg Symptom Duration (Years) =
DIVIDE(
    [Avg Symptom Duration (Months)],
    12,
    0
)
```

---

### Percentage Distribution Measures

```dax
-- Percentage of total patients for the current filter context
% of Total Patients =
DIVIDE(
    [Total Patients],
    CALCULATE( [Total Patients], ALL( 'OCD_Patients' ) ),
    0
)
```

```dax
-- Percentage of patients with a family history of OCD
% With Family History =
DIVIDE(
    [Patients With Family History],
    [Total Patients],
    0
)
```

```dax
-- Percentage of patients with a depression diagnosis
% With Depression =
DIVIDE(
    [Patients With Depression],
    [Total Patients],
    0
)
```

```dax
-- Percentage of patients with an anxiety diagnosis
% With Anxiety =
DIVIDE(
    [Patients With Anxiety],
    [Total Patients],
    0
)
```

---

## Notes

- Replace `'OCD_Patients'` with the actual table name in your Power BI data model.
- Format percentage measures as **Percentage** in Power BI's **Column tools** or **Measure tools** ribbon.
- The `DIVIDE` function is used instead of `/` to safely handle division by zero.
- All measures that reference `[Total Patients]` are dependent on that base measure existing first.
