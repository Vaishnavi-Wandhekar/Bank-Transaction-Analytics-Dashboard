use data_analyst;

select count(*) from `debit and credit`;
#1-Total Credit Amount:

SELECT SUM(Amount) AS Total_Credit_Amount
FROM `debit and credit`
WHERE `Transaction Type` = 'Credit';
#1-Total Debit Amount:

SELECT SUM(Amount) AS Total_Debit_Amount
FROM `debit and credit`
WHERE `Transaction Type` = 'Debit';
#3-Credit to Debit Ratio:

SELECT
ROUND(
    SUM(CASE WHEN `Transaction Type` = 'Credit' THEN `Amount` ELSE 0 END) /
    NULLIF(SUM(CASE WHEN `Transaction Type` = 'Debit' THEN `Amount` ELSE 0 END), 0),
    2
) AS Credit_to_Debit_Ratio
FROM `debit and credit`;


#4-Net Transaction Amount
SELECT
(
    SELECT SUM(`Amount`)
    FROM `debit and credit`
    WHERE `Transaction Type` = 'Credit'
)
-
(
    SELECT SUM(`Amount`)
    FROM `debit and credit`
    WHERE `Transaction Type` = 'Debit'
) AS Net_Transaction_Amount;


#5Account_Activity_Ratio
SELECT
ROUND(
    COUNT(*) / NULLIF(SUM(`Balance`), 0),
    6
) AS Account_Activity_Ratio
FROM `debit and credit`;


## ##############to check the type of Transactrion date 

DESCRIBE `debit and credit`;
SELECT `Transaction Date`
FROM `debit and credit`
LIMIT 10;
####    Transaction date is in text format so need to convert in to date 

SELECT
    STR_TO_DATE(`Transaction Date`, '%d-%m-%Y') AS Transaction_Day,
    COUNT(*) AS Total_Transactions
FROM `debit and credit`
GROUP BY STR_TO_DATE(`Transaction Date`, '%d-%m-%Y')
ORDER BY Transaction_Day;

#transaction per day
##DATE(`Transaction Date`) AS Transaction_Day,
    ##FROM `debit and credit`
#GROUP BY DATE(`Transaction Date`)
#ORDER BY Transaction_Day;


#week wise 
SELECT
    YEAR(STR_TO_DATE(`Transaction Date`, '%d-%m-%Y')) AS Year,
    WEEK(STR_TO_DATE(`Transaction Date`, '%d-%m-%Y'), 1) AS Week_Number,
    COUNT(*) AS Total_Transactions
FROM `debit and credit`
GROUP BY
    YEAR(STR_TO_DATE(`Transaction Date`, '%d-%m-%Y')),
    WEEK(STR_TO_DATE(`Transaction Date`, '%d-%m-%Y'), 1)
ORDER BY Year, Week_Number;

 
#SELECT `Transaction Date`
#FROM `debit and credit`
#LIMIT 10;

##month

SELECT
    MONTHNAME(STR_TO_DATE(`Transaction Date`, '%d-%m-%Y')) AS Month,
    COUNT(*) AS Total_Transactions
FROM `debit and credit`
GROUP BY
    MONTH(STR_TO_DATE(`Transaction Date`, '%d-%m-%Y')),
    MONTHNAME(STR_TO_DATE(`Transaction Date`, '%d-%m-%Y'))
ORDER BY
    MONTH(STR_TO_DATE(`Transaction Date`, '%d-%m-%Y'));
    
    #7-Total Transaction Amount by Branch:
SELECT
`Branch`,
SUM(`Amount`) AS Total_Transaction_Amount
FROM `debit and credit`
GROUP BY `Branch`
ORDER BY Total_Transaction_Amount DESC;


#8
SELECT
    `Bank Name`,
    SUM(`Amount`) AS Total_Transaction_Amount
FROM `debit and credit`
GROUP BY `Bank Name`
ORDER BY Total_Transaction_Amount DESC;

#9-Transaction Method Distribution:

SELECT
    `Transaction Method`,
    COUNT(*) AS Total_Transactions,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM `debit and credit`),
        2
    ) AS Percentage
FROM `debit and credit`
GROUP BY `Transaction Method`
ORDER BY Total_Transactions DESC;


#10

WITH MonthlyBranchTransactions AS (
    SELECT
        `Branch`,
        YEAR(STR_TO_DATE(`Transaction Date`, '%d-%m-%Y')) AS Year,
        MONTH(STR_TO_DATE(`Transaction Date`, '%d-%m-%Y')) AS Month,
        SUM(`Amount`) AS Total_Amount
    FROM `debit and credit`
    GROUP BY
        `Branch`,
        YEAR(STR_TO_DATE(`Transaction Date`, '%d-%m-%Y')),
        MONTH(STR_TO_DATE(`Transaction Date`, '%d-%m-%Y'))
)

SELECT
    Branch,
    Year,
    Month,
    Total_Amount,
    ROUND(
        ((Total_Amount -
        LAG(Total_Amount) OVER(PARTITION BY Branch ORDER BY Year, Month))
        /
        LAG(Total_Amount) OVER(PARTITION BY Branch ORDER BY Year, Month))
        *100,2
    ) AS Growth_Percentage
FROM MonthlyBranchTransactions
limit 10;

#11
SELECT
    `ï»¿Customer ID`,
    `Customer Name`,
    `Transaction Date`,
    `Transaction Type`,
    `Amount`,
    CASE
        WHEN `Amount` > 4000 THEN 'High Risk'
        ELSE 'Normal'
    END AS Risk_Flag
FROM `debit and credit`;

###################11
#ALTER TABLE `debit and credit` ADD COLUMN Risk_Flag VARCHAR(20);

#UPDATE `debit and credit`
#SET Risk_Flag = CASE WHEN Amount > 4000 THEN 'High Risk'ELSE 'Normal'END;

#######12-Suspicious Transaction Frequency:

SELECT
    COUNT(*)/100 AS Suspicious_Transaction_Frequency
FROM `debit and credit`
WHERE Risk_Flag = 'High Risk';

SELECT
    DATE_FORMAT(STR_TO_DATE(`Transaction Date`, '%d-%m-%Y'), '%Y-%m') AS Month_Sort,
    DATE_FORMAT(STR_TO_DATE(`Transaction Date`, '%d-%m-%Y'), '%b %Y') AS Month,
    COUNT(*) AS Suspicious_Transaction_Count
FROM `debit and credit`
WHERE Risk_Flag = 'High Risk'
GROUP BY
    DATE_FORMAT(STR_TO_DATE(`Transaction Date`, '%d-%m-%Y'), '%Y-%m'),
    DATE_FORMAT(STR_TO_DATE(`Transaction Date`, '%d-%m-%Y'), '%b %Y')
ORDER BY Month_Sort limit 10;

