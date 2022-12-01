CREATE SCHEMA commerce_db ;

-----------------
/*Q1) CREATE TABLES*/
-----------------
/*Created tables for supplier,customer,category,product,supplier_pricing,order1,rating 
to store the data for the with the schema definition given below:-*/

CREATE TABLE IF NOT EXISTS supplier(
SUPP_ID int,
SUPP_NAME varchar(50) NOT NULL,
SUPP_CITY varchar(50),
SUPP_PHONE varchar(10) NOT NULL,
CONSTRAINT SUPP_ID_PK PRIMARY KEY(SUPP_ID));

CREATE TABLE IF NOT EXISTS customer(
CUS_ID INT NOT NULL,
CUS_NAME VARCHAR(20) NOT NULL,
CUS_PHONE VARCHAR(10) NOT NULL,
CUS_CITY VARCHAR(30) NOT NULL,
CUS_GENDER CHAR,
CONSTRAINT CUS_ID_PK PRIMARY KEY (CUS_ID));

CREATE TABLE IF NOT EXISTS category (
CAT_ID INT NOT NULL,
CAT_NAME VARCHAR(20) NOT NULL,
CONSTRAINT CAT_ID_PK PRIMARY KEY (CAT_ID));

CREATE TABLE IF NOT EXISTS product (
PRO_ID INT NOT NULL,
PRO_NAME VARCHAR(20) NOT NULL DEFAULT "Dummy",
PRO_DESC VARCHAR(60),
CAT_ID INT NOT NULL,
CONSTRAINT PRO_ID_PK PRIMARY KEY (PRO_ID),
CONSTRAINT CAT_ID_FK FOREIGN KEY (CAT_ID) REFERENCES CATEGORY (CAT_ID));

CREATE TABLE IF NOT EXISTS supplier_pricing (
PRICING_ID INT NOT NULL,
PRO_ID INT NOT NULL,
SUPP_ID INT NOT NULL,
SUPP_PRICE INT DEFAULT 0,
CONSTRAINT PRC_ID_PK PRIMARY KEY (PRICING_ID),
CONSTRAINT PRO_ID_FK FOREIGN KEY (PRO_ID) REFERENCES PRODUCT (PRO_ID),
CONSTRAINT SUPP_ID_FK FOREIGN KEY (SUPP_ID) REFERENCES SUPPLIER(SUPP_ID));

CREATE TABLE IF NOT EXISTS order1 (
ORD_ID INT NOT NULL,
ORD_AMOUNT INT NOT NULL,
ORD_DATE DATE,
CUS_ID INT NOT NULL,
PRICING_ID INT NOT NULL,
CONSTRAINT ORD_ID_PK PRIMARY KEY (ORD_ID),
CONSTRAINT CUS_ID_FK FOREIGN KEY (CUS_ID) REFERENCES CUSTOMER(CUS_ID),
CONSTRAINT PRI_ID_FK FOREIGN KEY (PRICING_ID) REFERENCES SUPPLIER_PRICING(PRICING_ID));

CREATE TABLE IF NOT EXISTS rating (
RAT_ID INT NOT NULL,
ORD_ID INT NOT NULL,
RAT_RATSTARS INT NOT NULL,
CONSTRAINT RAT_ID_PK PRIMARY KEY (RAT_ID),
CONSTRAINT ORD_ID_FK FOREIGN KEY (ORD_ID) REFERENCES order1(ORD_ID));

---------------------
/*Q2) INSERT INTO TABLE */ 
---------------------

/*To insert the following data in the table created above */

INSERT INTO SUPPLIER VALUES(1,"Rajesh Retails","Delhi",'1234567890');
INSERT INTO SUPPLIER VALUES(2,"Appario Ltd.","Mumbai",'2589631470');
INSERT INTO SUPPLIER VALUES(3,"Knome products","Banglore",'9785462315');
INSERT INTO SUPPLIER VALUES(4,"Bansal Retails","Kochi",'8975463285');
INSERT INTO SUPPLIER VALUES(5,"Mittal Ltd.","Lucknow",'7898456532');
commit;

INSERT INTO CUSTOMER VALUES(1,"AAKASH",'9999999999',"DELHI",'M');
INSERT INTO CUSTOMER VALUES(2,"AMAN",'9785463215',"NOIDA",'M');
INSERT INTO CUSTOMER VALUES(3,"NEHA",'9999999999',"MUMBAI",'F');
INSERT INTO CUSTOMER VALUES(4,"MEGHA",'9994562399',"KOLKATA",'F');
INSERT INTO CUSTOMER VALUES(5,"PULKIT",'7895999999',"LUCKNOW",'M');
commit;

INSERT INTO CATEGORY VALUES( 1,"BOOKS");
INSERT INTO CATEGORY VALUES(2,"GAMES");
INSERT INTO CATEGORY VALUES(3,"GROCERIES");
INSERT INTO CATEGORY VALUES (4,"ELECTRONICS");
INSERT INTO CATEGORY VALUES(5,"CLOTHES");
commit;

INSERT INTO PRODUCT VALUES(1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2);
INSERT INTO PRODUCT VALUES(2,"TSHIRT","SIZE-L with Black, Blue and White variations",5);
INSERT INTO PRODUCT VALUES(3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4);
INSERT INTO PRODUCT VALUES(4,"OATS","Highly Nutritious from Nestle",3);
INSERT INTO PRODUCT VALUES(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
INSERT INTO PRODUCT VALUES(6,"MILK","1L Toned MIlk",3);
INSERT INTO PRODUCT VALUES(7,"Boat EarPhones","1.5Meter long Dolby Atmos",4);
INSERT INTO PRODUCT VALUES(8,"Jeans","Stretchable Denim Jeans with various sizes and color",5);
INSERT INTO PRODUCT VALUES(9,"Project IGI","compatible with windows 7 and above",2);
INSERT INTO PRODUCT VALUES(10,"Hoodie","Black GUCCI for 13 yrs and above",5);
INSERT INTO PRODUCT VALUES(11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
INSERT INTO PRODUCT VALUES(12,"Train Your Brain","By Shireen Stephen",1);
commit;


INSERT INTO SUPPLIER_PRICING VALUES(1,1,2,1500);
INSERT INTO SUPPLIER_PRICING VALUES(2,3,5,30000);
INSERT INTO SUPPLIER_PRICING VALUES(3,5,1,3000);
INSERT INTO SUPPLIER_PRICING VALUES(4,2,3,2500);
INSERT INTO SUPPLIER_PRICING VALUES(5,4,1,1000);
INSERT INTO SUPPLIER_PRICING VALUES(6,12,2,780);
INSERT INTO SUPPLIER_PRICING VALUES(7,12,4,789);
INSERT INTO SUPPLIER_PRICING VALUES(8,3,1,31000);
INSERT INTO SUPPLIER_PRICING VALUES(9,1,5,1450);
INSERT INTO SUPPLIER_PRICING VALUES(10,4,2,999);
INSERT INTO SUPPLIER_PRICING VALUES(11,7,3,549);
INSERT INTO SUPPLIER_PRICING VALUES(12,7,4,529);
INSERT INTO SUPPLIER_PRICING VALUES(13,6,2,105);
INSERT INTO SUPPLIER_PRICING VALUES(14,6,1,99);
INSERT INTO SUPPLIER_PRICING VALUES(15,2,5,2999);
INSERT INTO SUPPLIER_PRICING VALUES(16,5,2,2999);
commit;

INSERT INTO ORDER1 VALUES (101,1500,"2021-10-06",2,1);
INSERT INTO ORDER1 VALUES(102,1000,"2021-10-12",3,5);
INSERT INTO ORDER1 VALUES(103,30000,"2021-09-16",5,2);
INSERT INTO ORDER1 VALUES(104,1500,"2021-10-05",1,1);
INSERT INTO ORDER1 VALUES(105,3000,"2021-08-16",4,3);
INSERT INTO ORDER1 VALUES(106,1450,"2021-08-18",1,9);
INSERT INTO ORDER1 VALUES(107,789,"2021-09-01",3,7);
INSERT INTO ORDER1 VALUES(108,780,"2021-09-07",5,6);
INSERT INTO ORDER1 VALUES(109,3000,"2021-09-10",5,3);
INSERT INTO ORDER1 VALUES(110,2500,"2021-09-10",2,4);
INSERT INTO ORDER1 VALUES(111,1000,"2021-09-15",4,5);
INSERT INTO ORDER1 VALUES(112,789,"2021-09-16",4,7);
INSERT INTO ORDER1 VALUES(113,31000,"2021-09-16",1,8);
INSERT INTO ORDER1 VALUES(114,1000,"2021-09-16",3,5);
INSERT INTO ORDER1 VALUES(115,3000,"2021-09-16",5,3);
INSERT INTO ORDER1 VALUES(116,99,"2021-09-17",2,14);
commit;

use commerce_db;
-----------------------------------------------------------------------------------------------------------
/*Q3) Display the total number of customers based on gender who have placed orders of worth at least Rs.3000. */
-----------------------------------------------------------------------------------------------------------

select count(t2.cus_gender) as NoOfCustomers, t2.cus_gender from 
(select t1.cus_id, t1.cus_gender, t1.ord_amount, t1.cus_name from 
(select order1.*, customer.cus_gender, customer.cus_name from order1 inner join customer where order1.cus_id=customer.cus_id having order1.ord_amount>=3000) as t1 group by t1.cus_id) 
as t2 group by t2.cus_gender;

---------------------------------------------------------------------------------------------
/* Q4) Display all the orders along with product name ordered by a customer having Customer_Id=2 */
---------------------------------------------------------------------------------------------

select product.pro_name,order1.* from order1, supplier_pricing, product 
where order1.cus_id=2 and 
order1.pricing_id=supplier_pricing.pricing_id and supplier_pricing.pro_id=product.pro_id;

--------------------------------------------------------------------------
/*Q5) Display the Supplier details of who is supplying more than one product */
--------------------------------------------------------------------------

select supplier.* from supplier where supplier.supp_id in 
(select supp_id from supplier_pricing group by supp_id having 
count(supp_id)>1) 
group by supplier.supp_id;

----------------------------------------------------------------------------------------------------------------------------
/* Q6) Find the least expensive product from each category and print the table with category id, name, and price of the product */
----------------------------------------------------------------------------------------------------------------------------

select category.cat_id,category.cat_name, min(t3.min_price) as Min_Price from category inner join
(select product.cat_id, product.pro_name, t2.* from product inner join 
(select pro_id, min(supp_price) as Min_Price from supplier_pricing group by pro_id) 
as t2 where t2.pro_id = product.pro_id)
as t3 where t3.cat_id = category.cat_id group by t3.cat_id;

----------------------------------------------------------------------
/* Q7) Display the Id and Name of the Product ordered after “2021-10-05”. */
----------------------------------------------------------------------

select product.pro_id,product.pro_name from order1 inner join supplier_pricing on supplier_pricing.pricing_id=order1.pricing_id inner join product 
on product.pro_id=supplier_pricing.pro_id where order1.ord_date>"2021-10-05";

--------------------------------------------------------------------------------- 
/* Q8) Display customer name and gender whose names start or end with character 'A'. */
---------------------------------------------------------------------------------

select customer.cus_name,customer.cus_gender from customer where customer.cus_name like 'A%' or customer.cus_name like '%A';

----------------------------------------------------------------------------------------------------------------------------
/* Q9) Create a stored procedure to display supplier id, name, rating and Type_of_supplier.If rating >4 then “Genuine Supplier” 
if rating >2 “Average Supplier” else “Supplier should not be considered”. */
----------------------------------------------------------------------------------------------------------------------------
DELIMITER && 
CREATE PROCEDURE proc()
BEGIN
select report.supp_id,report.supp_name,report.Average,
CASE
WHEN report.Average=5 THEN 'Excellent Service'
 WHEN report.Average >4 THEN 'Good Service'
 WHEN report.Average >2 THEN 'Average Service'
 ELSE 'Poor Service'
END AS Type_of_Service from 
(select final.supp_id, supplier.supp_name, final.Average from
(select test2.supp_id, sum(test2.rat_ratstars)/count(test2.rat_ratstars) as Average from
(select supplier_pricing.supp_id, test.ORD_ID, test.RAT_RATSTARS from supplier_pricing inner join
(select order1.pricing_id, rating.ORD_ID, rating.RAT_RATSTARS from order1 inner join rating on rating.ord_id=order1.ord_id) as test
on test.pricing_id=supplier_pricing.pricing_id) 
as test2 group by supplier_pricing.supp_id)
as final inner join supplier where final.supp_id=supplier.supp_id) as report;
END && 
DELIMITER;

call proc();
