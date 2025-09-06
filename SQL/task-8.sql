SELECT * FROM treatment_records;

SELECT 
    patient_id, 
    COUNT(*) AS visit_count
FROM treatment_records
GROUP BY patient_id
HAVING COUNT(*) > 1;


SELECT 
    patient_id,
    ROUND(AVG(DATEDIFF(next_visit, treatment_date)),0) AS avg_interval_days
FROM (
    SELECT 
        tr.patient_id,
        tr.treatment_date,
        pa.diagnosis,
        LEAD(tr.treatment_date) OVER (PARTITION BY tr.patient_id ORDER BY tr.treatment_date) AS next_visit
    FROM treatment_records tr
    JOIN patient_admissions pa 
        ON pa.patient_id = tr.patient_id
    WHERE pa.diagnosis IN ('COVID-19', 'Hypertension', 'Diabetes', 'Asthma', 'Cancer')
) t
WHERE next_visit IS NOT NULL
GROUP BY patient_id;

SELECT 
    t1.patient_id,
    t1.treatment_date AS first_visit,
    t2.treatment_date AS readmission_date,
    DATEDIFF(t2.treatment_date, t1.treatment_date) AS days_between,
    CASE 
        WHEN DATEDIFF(t2.treatment_date, t1.treatment_date) <= 30 THEN 1
        ELSE 0
    END AS ReadmissionFlag
FROM treatment_records t1
JOIN treatment_records t2
  ON t1.patient_id = t2.patient_id
 AND t2.treatment_date > t1.treatment_date
ORDER BY t1.patient_id, t1.treatment_date;





