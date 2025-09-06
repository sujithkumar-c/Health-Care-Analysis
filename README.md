# 🏥 Hospital Patient Flow & Medical Services Analytics

This project focuses on analyzing hospital patient flow, medical services, and doctor performance using **SQL** and **Power BI**.  
It covers data preprocessing, advanced SQL analytics (aggregations, joins, window functions, percentile calculations), and interactive Power BI dashboards for decision-making.

---

## 📌 Project Objectives
- Analyze **admissions, treatments, costs, and recovery rates** across departments.
- Identify **top-performing doctors** and treatment effectiveness.
- Track **readmission patterns** and retention of patients.
- Provide **visual insights** into patient flow, resource utilization, and cost trends.

---

## 🛠️ Approach

### A. Basic Aggregation
- Calculate the number of admissions per department per month.  
- Find the average treatment cost per department.

### B. Join Operations
- Join admissions with doctors to identify top-performing doctors by department.  
- Join treatments with patient data to evaluate recovery rate by age group.

### C. Window Functions
- Calculate 7-day moving average of daily admissions.  
- Rank doctors by successful treatments per month.

### D. Percentiles and Median
- Calculate 25th, 50th, and 75th percentile of treatment costs per treatment type.  
- Find the median length of stay per department.

### E. Grouping and Case Statements
- Group patients into **High-Risk, Moderate-Risk, Low-Risk** based on comorbidity count.  
- Find admission trends by **weekday vs. weekend**.

### F. Complex Joins and Subqueries
- Identify doctors whose patients had recovery rates above the departmental average.  
- Find patients who visited more than 3 departments in a year.

### G. Date Functions & YOY Analysis
- Calculate **year-over-year (YOY)** change in total treatments administered.  
- Find the month with the highest treatment cost.

### H. Retention & Follow-up Analysis
- Identify patients readmitted within 30 days of discharge.  
- Calculate average interval between admissions for chronic patients.

---

## 📊 Power BI Dashboards

The following dashboards were created for business insights:

- **Doctor-wise recovery rate** across departments (heatmap)  
- **Distribution of treatment types** (donut chart)  
- **Treatment cost variation** by department (boxplot)  
- **30-day readmission rate KPI** (card visual)  
- **Billing delay breakdown** by department, doctor, and treatment (decomposition tree)  
- **Resource utilization cost** by department/treatment type (treemap)  
- **Year-over-year treatment volume & growth trends** (line + clustered column chart)  
- **Average length of stay** per department (bar chart)  
- **Treatment success rate distribution** (pie chart)  
- **Patient admission trends** over time (line chart)  
- **Doctor rating vs. average treatment cost** (scatter plot)  

---

## 🚀 Tech Stack
- **SQL** (data processing & analysis)  
- **Power BI** (interactive dashboards & reporting)  
- **Excel/CSV** (sample data storage)  

---

## 📂 Repository Structure

---

## 📧 Contact
**Author:** Sujithkumar C  
✉️ sujithaf532@gmail.com 
