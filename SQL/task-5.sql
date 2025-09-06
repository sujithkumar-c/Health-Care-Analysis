SELECT 
    a.patient_id,
    COUNT(DISTINCT a.diagnosis) AS unique_diagnosis_count,
    COUNT(DISTINCT t.treatment_type) AS unique_treatment_count,
    (COUNT(DISTINCT a.diagnosis) + COUNT(DISTINCT t.treatment_type)) AS comorbidity_score,
    CASE 
        WHEN (COUNT(DISTINCT a.diagnosis) + COUNT(DISTINCT t.treatment_type)) = 1 
            THEN 'Low Risk'
        WHEN (COUNT(DISTINCT a.diagnosis) + COUNT(DISTINCT t.treatment_type)) > 1 
             AND (COUNT(DISTINCT a.diagnosis) + COUNT(DISTINCT t.treatment_type)) <= 3 
            THEN 'Medium Risk'
        WHEN (COUNT(DISTINCT a.diagnosis) + COUNT(DISTINCT t.treatment_type)) > 3 
            THEN 'High Risk'
    END AS risk_category
FROM patient_admissions a
LEFT JOIN treatment_records t 
    ON a.patient_id = t.patient_id
GROUP BY a.patient_id
ORDER BY comorbidity_score DESC;

SELECT 
    CASE 
        WHEN DAYOFWEEK(admission_date) IN (1,7) THEN 'Weekend'
        ELSE 'Weekday'
    END AS admission_day_type,
    COUNT(*) AS total_admissions
FROM patient_admissions
GROUP BY admission_day_type;
