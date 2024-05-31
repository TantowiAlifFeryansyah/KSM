/* 
1) QUERY untuk menampilkan customerNumber siapa saja yang memesan
productLine  dimana total hitung atau COUNT productionline
tersebut lebih besar dari 23. 
*/

SELECT
    c.customerNumber,
    c.customerName,
    COUNT(*) AS totalOrders
FROM
    customers c    
INNER JOIN orders o ON o.customerNumber = c.customerNumber   
INNER JOIN orderdetails o2 ON o2.orderNumber = o.orderNumber 
INNER JOIN products p ON p.productCode = o2.productCode 
INNER JOIN productlines p2 ON p2.productLine = p.productLine 
WHERE
    p2.productLine = "Classic Cars"
GROUP BY
    c.customerNumber,
    c.customerName
HAVING
    COUNT(*) > 23;
