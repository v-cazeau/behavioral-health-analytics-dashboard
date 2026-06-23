-- 1. Count & Pct of F vs M that have OCD & -- Average Obsession Score by Gender
SELECT * FROM ocd_patient_dataset;

SELECT gender, count('Patient ID') as patient_count, 
round(avg(`Y-BOCS Score (Obsessions)`), 2) as avg_obs_count
FROM ocd_patient_dataset
GROUP BY 1
ORDER BY 2;

--
with data as (
SELECT gender, count(gender) as patient_count, round(avg(`Y-BOCS Score (Obsessions)`), 2 ) as "Average Obsession Score"
FROM ocd_patient_dataset
GROUP BY 1
ORDER BY 2)

select

sum(case when gender = 'Female' then patient_count else 0 end) as count_female,
sum(case when gender = 'Male' then patient_count else 0 end) as count_male,

round(sum(case when gender = 'Female' then patient_count else 0 end)/(sum(case when gender = 'Female' then patient_count else 0 end)+ sum(case when gender = 'Male' then patient_count else 0 end)) * 100, 2) as pct_female,
round(sum(case when gender = 'Male' then patient_count else 0 end)/(sum(case when gender = 'Female' then patient_count else 0 end)+ sum(case when gender = 'Male' then patient_count else 0 end)) * 100, 2) as pct_male
from data;

-- CTE (Common Table Expression) used to store intermediate results


-- 2. Count of Patients by Ethnicity and their respective Average Obsession Score
SELECT distinct ethnicity as "Ethicity", count( distinct `Patient ID`) as "Patient Count", round(avg(`Y-BOCS Score (Obsessions)`), 2) as "Average Obsession Score"
FROM ocd_patient_dataset
GROUP BY ethnicity
ORDER BY 2;

-- 3. Number of people diagnosed with OCD MoM

-- ALTER TABLE ocd_patient_dataset
-- MODIFY `OCD Diagnosis Date` DATE;
SELECT date_format(`OCD Diagnosis Date`, '%Y-%m-01 00:00:00') as month,
-- `OCD Diagnosis Date`
count(`Patient ID`) patient_count
FROM ocd_patient_dataset
GROUP BY 1
ORDER BY 1;



-- 4. What is the most common Obsession Type (Count) & it's respective Average Obsession Score
SELECT `Obsession Type`, count(`Patient ID`) as "Obsession Type (Count)", 
	round(avg(`Y-BOCS Score (Obsessions)`),2) as "Average Obsession Score"
FROM ocd_patient_dataset
GROUP BY 1
ORDER BY 2;

-- 5. What is the most common Compulsion type (Count) & it's respective Average Obsession Score
SELECT `Compulsion Type`, count(`Patient ID`) as "Compulsion Type" , 
	round(avg(`Y-BOCS Score (Compulsions)`), 2) as "Average Obsession Score"
FROM ocd_patient_dataset
GROUP BY 1
ORDER BY 2;

