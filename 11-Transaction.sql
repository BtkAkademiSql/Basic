/*
BEGIN TRAN
	IF @@ERROR>0
	BEGIN
		ROLLBACK TRAN
		RETURN
	END
COMMIT TRAN

-Transaction ile kilitlenen tablolar WITH(NOLOCK) ile o anki halini listeleyebiliriz
*/
CREATE TABLE City
(
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[C1] [varchar](10) NULL,
	CONSTRAINT PK_RootTable PRIMARY KEY CLUSTERED (Id ASC) 
)
CREATE TABLE Town
(
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[C1] [varchar](10) NULL,
	[RootRef] [int] NULL,
	CONSTRAINT [PK_ChildTable] PRIMARY KEY CLUSTERED (Id ASC),
	CONSTRAINT [FK_ChildTable_RootTable] FOREIGN KEY (RootRef) REFERENCES City(Id)
)

DECLARE @CityRef int
INSERT INTO City VALUES('İstanbul')
SET @CityRef=SCOPE_IDENTITY()
INSERT INTO Town VALUES('Kağıthane',@CityRef)
INSERT INTO Town VALUES('uzun ilçe kayıt edemez',@CityRef)

BEGIN TRAN
	DECLARE @CityRef2 int
	INSERT INTO City VALUES('Ankara')
	SET @CityRef2=SCOPE_IDENTITY()
	INSERT INTO Town VALUES('Beypazarı',@CityRef2)
	INSERT INTO Town VALUES('uzun ilçe kayıt edemeyecek',@CityRef2)
	IF	@@ERROR>0
		BEGIN
			ROLLBACK TRAN
			--RETURN
		END
COMMIT TRAN

SELECT * FROM City
SELECT * FROM Town

DROP TABLE Town
DROP TABLE City