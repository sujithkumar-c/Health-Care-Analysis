SELECT * FROM `final-project`.patient_admissions;

SELECT 
	DAY(admission_date) AS admission_day,
    MONTH(admission_date) AS admission_month,
    YEAR(admission_date) AS admission_year,
    COUNT(*) AS total_admissions
FROM patient_admissions 
GROUP BY DAY(admission_date),
		 MONTH(admission_date),
		 YEAR(admission_date)
ORDER BY admission_year ASC, admission_month ASC, admission_day ASC;

WITH daily_counts AS (
    SELECT 
        DATE(admission_date) AS admission_date,
        COUNT(*) AS total_admissions
    FROM patient_admissions 
    GROUP BY DATE(admission_date)
)
SELECT
    admission_date,
    total_admissions,
    ROUND(
        AVG(total_admissions) OVER (
            ORDER BY admission_date
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ), 2
    ) AS moving_avg_7_day
FROM daily_counts
ORDER BY admission_date;

SELECT 
    MONTH(admission_date) AS admission_month,
    YEAR(admission_date) AS admission_year,
    COUNT(*) AS total_admissions
FROM patient_admissions 
GROUP BY MONTH(admission_date),
		 YEAR(admission_date)
ORDER BY admission_year ASC, admission_month ASC;

SELECT 
    YEAR(pa.admission_date) AS admission_year,
    MONTH(pa.admission_date) AS admission_month,
    COUNT(*) AS successfull_admissions
FROM patient_admissions pa
JOIN treatment_records tr 
    ON pa.patient_id = tr.patient_id
WHERE tr.success = 1
GROUP BY YEAR(pa.admission_date), MONTH(pa.admission_date)
ORDER BY admission_year ASC, admission_month ASC;

