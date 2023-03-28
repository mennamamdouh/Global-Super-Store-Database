# Global-Super-Store-Database-and-Analytics

## <u> About the Project </u> ##

This project is about creating a database for Global Super Store to store their data and do some data analysis to achieve business goals.

<hr>

## <u> About the Data </u> ##

Global Super Store mainly stores data about the orders which have been made by customers. There's information about the order itself such as the customer who made the order, the product requested by the customer and its quantity, the cost which the customer have to pay, and information about shipping. Also, there's information about the customer himself, his name and a detailed address of him. Besides the order and customer information, there's information about the product, its name, category, sub-category, and price.

All those information is stored in __ONLY ONE__ dataset. This makes the data difficult to monitor, analyze, and extract insights! Therefore we need a structured database to store all those information in a simple and easy-to-monitor format.

<hr>

## <u> Data Modeling </u> ##

To well-design the database, we start with the Entity Relationship Diagram. This methodology requires dividing the information in the dataset into entities, and defining the relationship between them.

<u>The dataset contains the following entities</u>:

1. Orders
2. Customers
3. Products
4. Sales
5. Addresses
6. Shipping

Let's start the three-level modeling.

1. <u>Conceptual Data Model</u>:
   
   The 3 basic components of Conceptual Data Model are:
   - __Entity:__ A real world thing
   - __Attribute:__ Characteristics or properties of an entity
   - __Relationship:__ Dependency or association between two entities

   <br>
   <ul>
   <p align="center">
   <img src="images\Conceptual-Data-Model.png">
   </p>
   </ul>

2. <u>Logical Data Model</u>:
   
   Logical Data Model contains more information about the attributes of each entity such as the data type, as well as the relationship between each 2 entities.
   <br>
   <ul>
   <p align="center">
   <img src="images\Logical-Data-Model.png">
   </p>
   </ul>

3. <u>Physical Data Model</u>:
   
   Physical Data Model describes a database-specific implementation of the database model. It contains information about the database columns, keys, constraints, and other RDBMS (Relational Database Management System) features.
   <br>
   <ul>
   <p align="center">
   <img src="images\Physical-Data-Model.png">
   </p>
   </ul>

<hr>

## Database Model Implementation on MySQL Workbench ##

1. ER-Diagram of the Data Model
   
    The implementation of the ER-Diagram (Entity Relationship Diagram) of the database on MySQL Workbench.
    <br>
    <ul>
    <p align="center">
    <img src="images\ER-Diagram.png">
    </p>
    </ul>

2. Database implementation using __Forward Engineer__ method
   
   Using this method, we can extract a SQL script that creates the database with its tables, columns and constraints, and run this script to have the database ready in MySQL Server.

   This is a part from the code:
   <ul>
   <p align="center">
   <img src="images\part_of_SQL_script.png">
   </p>
   </ul>

   After executing the SQL script, the database will be ready-to-use in the server.
   <ul>
   <p align="image">
   <img src="images\database.png">
   </p>
   </ul>

<hr>