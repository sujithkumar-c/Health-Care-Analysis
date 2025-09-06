SELECT * FROM treatment_records;

WITH ranked AS (
    SELECT 
        treatment_type,
        cost,
        CUME_DIST() OVER (PARTITION BY treatment_type ORDER BY cost) AS percentile_rank
    FROM treatment_records
)
SELECT treatment_type, 
       MIN(CASE WHEN percentile_rank >= 0.25 THEN cost END) AS '25th percentile',
       MIN(CASE WHEN percentile_rank >= 0.50 THEN cost END) AS '50th percentile',
       MIN(CASE WHEN percentile_rank >= 0.75 THEN cost END) AS '75th percentile'
FROM ranked
GROUP BY treatment_type;


SELECT 
    patient_id,
    department,
    DATEDIFF(discharge_date, admission_date) AS `Stayed Days`
FROM patient_admissions;

WITH ranked AS (
    SELECT 
        department,
        DATEDIFF(discharge_date, admission_date) AS stayed_days,
        CUME_DIST() OVER (PARTITION BY department ORDER BY DATEDIFF(discharge_date, admission_date)) AS percentile_rank
    FROM patient_admissions
)
SELECT 
    department,
    MIN(CASE WHEN percentile_rank >= 0.5 THEN stayed_days END) AS median_stay
FROM ranked
GROUP BY department;











