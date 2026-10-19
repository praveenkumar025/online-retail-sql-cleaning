# Online Retail Data Cleaning Project (SQL)

This project demonstrates an end-to-end data cleaning pipeline using **PostgreSQL** on a public transactional retail dataset.

## Repository Structure
- `data_cleaning.sql` : The SQL script containing all data cleaning and transformation queries.
- `cleaned_online_retail.csv` : The final processed and analysis-ready dataset.

---

## Data Quality Issues Addressed

1. **Incorrect Data Types:** 
   - Converted text-based dates into proper `TIMESTAMP` format using custom parsing (`TO_TIMESTAMP`).
   - Cast numerical columns (`Quantity`, `UnitPrice`, `CustomerID`) from text/staging format into correct integer, numeric, and float data types.
2. **Missing Values:** 
   - Handled missing `CustomerID` entries by filtering out incomplete transaction logs.
   - Replaced missing product descriptions with `"UNKNOWN"` using `COALESCE`.
3. **Inconsistent Values & Formatting:** 
   - Trimmed accidental leading/trailing whitespaces in `Description` and `Country`.
   - Converted all product descriptions to uppercase for consistency.
4. **Business Anomalies & Outliers:** 
   - Filtered out negative or zero quantities representing order cancellations to isolate valid positive sales.

---

## Tools Used
- **PostgreSQL / pgAdmin 4**: For database management, data staging, and SQL-based transformations.
- **SQL**: For data type casting, text manipulation, and conditional filtering.