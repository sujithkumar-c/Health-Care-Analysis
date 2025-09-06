SELECT
    dp.doctor_id,
    dp.specialization,
    dp.department,
    dp.experience_years,
    dp.performance_rating,
    dept_patients.total_patients
FROM doctor_profiles dp
JOIN (
    SELECT department, COUNT(patient_id) AS total_patients
    FROM patient_admissions
    GROUP BY department
) dept_patients
    ON dp.department = dept_patients.department
ORDER BY
    dp.department,
    dp.performance_rating DESC,
    dept_patients.total_patients DESC;

SELECT
    CASE 
        WHEN age BETWEEN 0 AND 12 THEN 'Child (0-12)'
        WHEN age BETWEEN 13 AND 19 THEN 'Teen (13-19)'
        WHEN age BETWEEN 20 AND 39 THEN 'Adult (20-39)'
        WHEN age BETWEEN 40 AND 59 THEN 'Middle Age (40-59)'
        ELSE 'Senior (60+)' 
    END AS age_group,
    COUNT(*) AS total_people
FROM patient_admissions
GROUP BY age_group;

SELECT
    CASE 
        WHEN age BETWEEN 0 AND 12 THEN 'Child (0-12)'
        WHEN age BETWEEN 13 AND 19 THEN 'Teen (13-19)'
        WHEN age BETWEEN 20 AND 39 THEN 'Adult (20-39)'
        WHEN age BETWEEN 40 AND 59 THEN 'Middle Age (40-59)'
        ELSE 'Senior (60+)' 
    END AS age_group,
    COUNT(tr.treatment_id) AS total_cases,
    SUM(tr.success) AS success_cases,
    ROUND(SUM(tr.success) * 100.0 / COUNT(tr.treatment_id), 2) AS recovery_rate
FROM patient_admissions pa
JOIN treatment_records tr
    ON tr.patient_id = pa.patient_id
GROUP BY age_group;

