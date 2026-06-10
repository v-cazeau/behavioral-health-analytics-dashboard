# Dashboard Folder

This folder is the designated location for Power BI dashboard files and screenshots.

## Power BI File

Upload the Power BI project file to this folder:

```
dashboard/
└── ocd-patient-analytics.pbix     ← Upload your Power BI file here
```

> **Note:** `.pbix` files can be large. If the file exceeds GitHub's 100 MB file size limit, consider using [Git Large File Storage (LFS)](https://git-lfs.github.com/) or host the file on OneDrive/SharePoint and link to it below.

**Power BI File Location:** *(add link or path here)*

---

## Dashboard Screenshots

Add screenshot images of each dashboard page to this folder and update the table below.

```
dashboard/
├── screenshots/
│   ├── 01-patient-demographics.png
│   ├── 02-symptom-severity.png
│   ├── 03-medications-treatment.png
│   ├── 04-family-history-comorbidities.png
│   └── 05-diagnosis-patterns.png
```

### Dashboard Pages

| Page | Screenshot | Description |
|---|---|---|
| Patient Demographics | *(add screenshot)* | Age, gender, marital status, education, ethnicity |
| Symptom Severity | *(add screenshot)* | Y-BOCS scores, obsession types, compulsion types |
| Medications & Treatment | *(add screenshot)* | Medication categories and prescribing patterns |
| Family History & Co-morbidities | *(add screenshot)* | Family history of OCD, depression and anxiety diagnoses |
| Diagnosis Patterns | *(add screenshot)* | Duration since diagnosis, subgroup comparisons |

---

## How to Open the Dashboard

1. Install [Power BI Desktop](https://powerbi.microsoft.com/desktop/) (free download from Microsoft).
2. Download the `.pbix` file from this folder (or the link provided above).
3. Open Power BI Desktop and select **File > Open report > Browse this device**.
4. Navigate to and select the `.pbix` file.
5. When prompted, update the data source connection to point to your local database or file.
6. Refresh the data model to load the latest data.

---

## Publishing to Power BI Service

To publish the dashboard to the Power BI Service (web):

1. Open the `.pbix` file in Power BI Desktop.
2. Select **Home > Publish** and choose your Power BI workspace.
3. Once published, share the dashboard link below.

**Published Dashboard Link:** *(add link here)*
