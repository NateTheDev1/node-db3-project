-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT ProductName, CategoryName FROM Product
JOIN Category
ON Product.CategoryId = Category.Id
-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT [Order].Id, Shipper.CompanyName, [Order].OrderDate FROM [Order]
JOIN Shipper
on [Order].ShipVia = Shipper.Id
WHERE [Order].OrderDate < "2012-08-09"
-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT Product.ProductName, OrderDetail.Quantity
FROM OrderDetail JOIN Product
ON Product.Id = OrderDetail.ProductId
WHERE OrderDetail.OrderId = 10251
ORDER BY Product.ProductName
-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT o.id as "Order ID", c.CompanyName as "Company Name", e.LastName as "Employee Last Name"
FROM [Order] as o
JOIN customer as c
on c.id = o.CustomerId
JOIN employee as e
on e.id = o.EmployeeId;
