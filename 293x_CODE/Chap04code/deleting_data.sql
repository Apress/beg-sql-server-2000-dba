USE Northwind

SELECT Food_ID, Food_Name FROM Food_Table

DELETE Food_Table WHERE Food_Name='Steak'

SELECT Food_ID, Food_Name FROM Food_Table

INSERT Food_Table(Food_ID, Food_Name) VALUES(2, 'Steak')