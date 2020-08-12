/*
INSERT INTO TableName(Columns) VALUES(Values)

UPDATE TableName SET Columns=Calues [WHERE Conditions]

DELETE FROM TableName [WHERE Conditions]
*/
CREATE TABLE ##T1
(
	C1 int identity(1,1),
	C2 varchar(5),
	C3 int
)

INSERT INTO ##T1 VALUES('A',1)
INSERT INTO ##T1(C2) VALUES('B')
INSERT INTO ##T1 VALUES ('C',3),('D',4)
INSERT INTO ##T1 SELECT 'E',5 

UPDATE ##T1 SET C3=2 WHERE C2='B'

DELETE FROM ##T1

DROP TABLE ##T1