SELECT  pa.department,COUNT(*) AS  'Total Admissions',
	    DATE_FORMAT(pa.admission_date, '%Y-%m') AS Admission_Month,
        ROUND(AVG(tr.cost),2) AS 'Avg Treatment Cost'
FROM patient_admissions pa
JOIN treatment_records tr
ON tr.patient_id = pa.patient_id
GROUP BY pa.department,Admission_Month
ORDER BY 
    Admission_Month, pa.department;

SELECT department,ROUND(AVG(cost),2) AS 'Avg Treatment Cost' FROM patient_admissions pa
JOIN treatment_records ts
ON ts.patient_id = pa.patient_id
GROUP BY department;

select * from patient_admissions;