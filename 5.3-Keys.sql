/*
ALTER TABLE TableName ADD CONSTRAINT KeyName PRIMARY KEY CLUSTERED (ColumnNames) =>Primary key 

ALTER TABLE ChildTableName ADD CONSTRAINT KeyName FOREIGN KEY (ColumnName) REFERENCES RootTableName (RootColumnName) =>Foreign key
*/

CREATE TABLE [dbo].[RootTable]
(
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[C1] [varchar](50) NULL,
	CONSTRAINT PK_RootTable PRIMARY KEY CLUSTERED (Id ASC) 
)

CREATE TABLE [dbo].[ChildTable]
(
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[C1] [varchar](50) NULL,
	[RootRef] [int] NULL,
	CONSTRAINT [PK_ChildTable] PRIMARY KEY CLUSTERED (Id ASC),
	CONSTRAINT [FK_ChildTable_RootTable] FOREIGN KEY (RootRef) REFERENCES RootTable(Id)
)
