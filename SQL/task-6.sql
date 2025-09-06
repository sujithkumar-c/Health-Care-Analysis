SELECT * FROM `final-project`.treatment_records;
SELECT
    COALESCE(dp.department, 'All Department') AS department,
    AVG(tr.success) * 100 AS department_recovery_rate
FROM treatment_records tr
LEFT JOIN doctor_profiles dp
  ON dp.doctor_id = tr.doctor_id
GROUP BY dp.department;

SELECT
    tr.doctor_id,
    AVG(tr.success) * 100 AS doctor_recovery_rate
FROM treatment_records tr
GROUP BY tr.doctor_id;





