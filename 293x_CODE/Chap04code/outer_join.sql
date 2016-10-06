--left outer join
SELECT * FROM Food_Table LEFT OUTER JOIN Group_Table ON  
              Food_Table.Food_ID = Group_Table.Group_ID 


/*
--right outer join
SELECT * FROM
  Food_Table RIGHT OUTER JOIN Group_Table ON
  Food_Table.Food_ID = Group_Table.Group_ID
*/


/*
--full outer join
SELECT *FROM
  Food_Table FULL OUTER JOIN Group_Table ON
  Food_Table.Food_ID = Group_Table.Group_ID
*/