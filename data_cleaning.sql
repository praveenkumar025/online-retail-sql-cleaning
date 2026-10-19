CREATE TABLE online_retail_raw (
    InvoiceNo TEXT,
    StockCode TEXT,
    Description TEXT,
    Quantity TEXT,
    InvoiceDate TEXT,
    UnitPrice TEXT,
    CustomerID TEXT,
    Country TEXT
);
select * from online_retail_raw


CREATE TABLE cleaned_online_retail AS
SELECT 
    InvoiceNo,
    StockCode,
    COALESCE(UPPER(TRIM(Description)), 'UNKNOWN') AS Description,
    NULLIF(Quantity, '')::INT AS Quantity,
    -- Explicitly parse MM/DD/YY date format
    TO_TIMESTAMP(NULLIF(InvoiceDate, ''), 'MM/DD/YY HH24:MI') AS InvoiceDate,
    NULLIF(UnitPrice, '')::NUMERIC(10,2) AS UnitPrice,
    NULLIF(CustomerID, '')::FLOAT AS CustomerID,
    TRIM(Country) AS Country
FROM online_retail_raw
WHERE CustomerID IS NOT NULL 
  AND Quantity IS NOT NULL
  AND NULLIF(Quantity, '')::INT > 0 
  AND NULLIF(UnitPrice, '')::NUMERIC(10,2) >= 0;



