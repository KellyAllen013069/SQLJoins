USE bestbuy;
/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT p.Name, c.Name FROM products AS p
JOIN categories AS c
ON p.CategoryID = c.CategoryID
WHERE c.Name = 'Computers';
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT p.Name, p.Price, r.Rating FROM products as p
JOIN reviews as r
ON p.ProductID = r.ProductID
WHERE r.rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.FirstName, e.LastName, SUM(s.Quantity) as QuantitySold
FROM employees as e
JOIN sales as s
ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID
ORDER BY QuantitySold DESC;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT c.Name as CategoryName, d.Name as DepartmentName FROM categories AS c
JOIN departments as d
ON c.DepartmentID = d.DepartmentID
WHERE c.Name IN ('Appliances', 'Games');

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 SELECT p.Name,
		SUM(s.Quantity) as TotalQuantity,
		SUM(s.Quantity * s.PricePerUnit) as TotalPrice
 FROM products as p
 JOIN sales as s
 ON p.ProductID = s.ProductID
 WHERE p.Name = 'Eagles: Hotel California'
 GROUP BY p.Name;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.Name as Product, r.Reviewer, r.Rating, r.Comment
FROM products as p
JOIN reviews as r
ON p.ProductID = r.ProductID
WHERE p.Name = 'Visio TV'
ORDER BY r.rating
LIMIT 1;


-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employees first and last name
-  the name of each product
-  and how many of that product they sold 
*/
SELECT e.EmployeeID, e.LastName, e.FirstName, p.Name AS ProductName, SUM(s.Quantity) AS QuantitySold
FROM employees AS e
JOIN sales AS s
ON e.EmployeeID = s.EmployeeID
JOIN products AS p
ON s.ProductID = p.ProductID
GROUP BY e.EmployeeID, p.Name
ORDER BY e.LastName, e.FirstName;
