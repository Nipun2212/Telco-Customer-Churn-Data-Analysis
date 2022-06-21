
/*
SQL Questions
Create an sql database using the customer churn dataset provided to you, for this you need to:
1.Analyze the data to check if the table is normalized i.e follows all the normal forms, mention all the problems you find and 
how would you solve it.

Answer:
- The given dataset with all 33 columns are not in normalized form.
- While creating sql datbase based the follwing problems are-
	1. Data redundancy [Duplication of Record]
    2. Diffcult to perform various -insertion anomaly, update anomaly & deletion anomaly
    

2.If the data is normalized, you can simply create one table with all the 33 columns, but if it is not, you need to see how many
tables are to be created.
Answer:
- we have to create minimum 5 tables or more
	1. Customer
    2. Service
    3. Location/Zip
    4. Churn
    5. Billing
    
	
3.Feel free to add ID columns as primary keys if you are creating multiple tables.
Answer-
		Table Name	      Primary Key
    1. Customer_Address	- Cust_zipcode
    2. Customer			- CustomerID 
    3. Services			- ServiceID
    4. Payment			- PaymentID
    5. Churn			- ChurnID
    
4. If you created multiple tables, mention the foreign keys for each table and the candidate keys.
Answer- 
	  Table Name	      Primary Key		Foreign Key
    1. Customer_Address	- Cust_zipcode		None
    2. Customer			- CustomerID 		Cust_zipcode	
    3. Services			- ServiceID			CustomerID	
    4. Payment			- PaymentID			CustomerID,ServiceID
    5. Churn			- ChurnID
*/
Create database customer_churn;		# Creating database with name "customer_churn"

use customer_churn;					# Selecting Database to work

# 
# Create Table-1 Cutomer Address with name Customer_address
	CREATE TABLE Customer_address (
		Cust_zipcode 	varchar(6) Primary Key,         
		Country_name 	varchar(50), 
		State 			varchar(50), 
		City 			varchar(50));	

# Create Table-2 Customer Details with name Customer
	CREATE TABLE Customer (
		CustomerID 		varchar(11) Primary Key,
		Gender 			varchar(5), 
		Cust_zipcode	varchar(6),
		Senior_Citizen 	varchar(3), 
		Partner			varchar(3),
		Dependents		varchar(3),
		Tenure_Months	numeric(2),
		FOREIGN KEY (Cust_zipcode) REFERENCES Customer_address(Cust_zipcode));
	
# Create Table-3 Customer Services with name Services
	CREATE TABLE Services( 
		ServiceID 			varchar(11) Primary Key,		
		Phone_Service		varchar(50), 
		Multiple_Lines		varchar(50), 
		Internet_Service	varchar(50), 
		Online_Security		varchar(50), 
		Online_Backup		varchar(50), 
		Device_Protection	varchar(50), 
		Tech_Support		varchar(50), 
		Streaming_TV		varchar(50), 
		Streaming_Movies	varchar(50), 
		Contract			varchar(50), 
		CustomerID 			varchar(11),
        Monthly_Charges 	numeric(5), 
		FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID));


# Create Table-4 Customer Payment with name Payment
	CREATE TABLE Payment(
		PaymentID 		varchar(11) Primary Key,
		ServiceID		varchar(11),
		Payment_mode 	varchar(50), 
		Paperless_bill 	varchar(3) , 
        CustomerID 			varchar(11),
		FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID),
        FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID));
        
        
# Create Table-5 Churn activity with name churn
	CREATE TABLE Churn(
		curn_id 		varchar(11) 	Primary Key,
		churn_label 	varchar(3),
		churn_value 	integer, 
		churn_score 	integer,
		churn_reason 	varchar(100), 
		CustomerID 			varchar(11),
        FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID));



/*5. Create an ER diagram to refer to when analyzing the database.


6. Finally, I would like you to add a write up either with each chunk of code or towards the end, 
about the database created and the steps you had to follow to create it. */

Insert  into customer_address (Country_name,State, City,Cust_zipcode)
        values( 'United States','California','Los Angeles',90003);
Insert  into customer_address (Country_name,State, City,Cust_zipcode)
        values( 'United States','California','Los Angeles','90005');
Insert  into customer_address (Country_name,State, City,Cust_zipcode)
        values( 'United States','California','Los Angeles','90006');
Insert  into customer_address (Country_name,State, City,Cust_zipcode)
        values( 'United States','California','Los Angeles','90010');
Insert  into customer_address (Country_name,State, City,Cust_zipcode)
        values( 'United States','California','Los Angeles','90004');
Insert  into customer_address (Country_name,State, City,Cust_zipcode)
        values( 'United States','California','Los Angeles','90007');
Insert  into customer_address (Country_name,State, City,Cust_zipcode)
        values( 'United States','California','Los Angeles','90001');
Insert  into customer_address (Country_name,State, City,Cust_zipcode)
        values( 'United States','California','Los Angeles','90004');
Insert  into customer_address (Country_name,State, City,Cust_zipcode)
        values( 'United States','California','Los Angeles','90005');


    