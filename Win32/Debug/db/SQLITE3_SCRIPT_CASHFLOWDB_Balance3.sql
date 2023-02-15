SELECT
SUM(CASE 
  WHEN ((STRFTIME('%m', DATATRANSACAO) == '12') AND (STRFTIME('%Y', DATATRANSACAO) ==  '2022'))   
       then CAST(IFNULL(valor, 0.00) AS NUMERIC(15, 02)) end) as JAN,

SUM(CASE 
  WHEN ((STRFTIME('%m', DATATRANSACAO) == '12') AND (STRFTIME('%Y', DATATRANSACAO) ==  '2022')) ||   
       ((STRFTIME('%m', DATATRANSACAO) == '01') AND (STRFTIME('%Y', DATATRANSACAO) ==  '2023')) then CAST(IFNULL(valor, 0.00) AS NUMERIC(15, 02)) end) as fev,
SUM(CASE
  WHEN ((STRFTIME('%m', DATATRANSACAO) == '12') AND (STRFTIME('%Y', DATATRANSACAO) ==  '2022')) ||   
       ((STRFTIME('%m', DATATRANSACAO) == '01') AND (STRFTIME('%Y', DATATRANSACAO) ==  '2023')) ||
	   ((STRFTIME('%m', DATATRANSACAO) == '02') AND (STRFTIME('%Y', DATATRANSACAO) ==  '2023'))   then CAST(IFNULL(valor, 0.00) AS NUMERIC(15, 02)) end) as MAR,
	   
SUM(CASE
  WHEN ((STRFTIME('%m', DATATRANSACAO) == '12') AND (STRFTIME('%Y', DATATRANSACAO) ==  '2022')) ||   
       ((STRFTIME('%m', DATATRANSACAO) == '01') AND (STRFTIME('%Y', DATATRANSACAO) ==  '2023')) ||
	   ((STRFTIME('%m', DATATRANSACAO) == '02') AND (STRFTIME('%Y', DATATRANSACAO) ==  '2023')) ||  
	   ((STRFTIME('%m', DATATRANSACAO) == '03') AND (STRFTIME('%Y', DATATRANSACAO) ==  '2023'))	   then CAST(IFNULL(valor, 0.00) AS NUMERIC(15, 02)) end) as ABR
From TBTRANSACAO T

 	WHERE  1 = 1  
    AND T.FORECAST = 0 
	AND T.ID_USER = 3
 	AND T.DATATRANSACAO >= '2022-12-01' 
 	AND T.DATATRANSACAO <= '2024-01-31' 