USE TestDB1

ALTER TABLE Table2
ADD CONSTRAINT fk_table2_table1_idcol FOREIGN KEY (Table1_IDCol)
               REFERENCES Table1(IDCol)
GO
