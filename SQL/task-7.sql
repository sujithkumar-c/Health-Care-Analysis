WITH yearly_totals AS (
    SELECT 
        YEAR(treatment_date) AS year,
        COUNT(*) AS total_treatments
    FROM treatment_records
    GROUP BY YEAR(treatment_date)
)
SELECT 
    yt.year,
    yt.total_treatments,
    prev.total_treatments AS prev_year_treatments,
    ROUND(((yt.total_treatments - prev.total_treatments) / prev.total_treatments) * 100, 2) 
        AS yoy_change_percent
FROM yearly_totals yt
LEFT JOIN yearly_totals prev 
    ON yt.year = prev.year + 1
ORDER BY yt.year;

SELECT 
    DATE_FORMAT(treatment_date, '%Y-%m') AS month,
    ROUND(SUM(cost), 2) AS total_cost
FROM treatment_records
GROUP BY DATE_FORMAT(treatment_date, '%Y-%m')
ORDER BY total_cost DESC
LIMIT 10;

