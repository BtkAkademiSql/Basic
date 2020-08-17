sp_configure 'Ole Automation Procedures',1
reconfigure with override
GO

DECLARE @URL VARCHAR(1000)='https://tcmb.gov.tr/kurlar/today.xml'
DECLARE @OBJ INT,@RESULT INT

EXEC @RESULT=SP_OACREATE 'MSXML2.XMLHttp', @OBJ OUT
EXEC @RESULT=SP_OAMETHOD @OBJ, 'OPEN', NULL, 'GET', @URL, FALSE

EXEC @RESULT=SP_OAMETHOD @OBJ, SEND, NULL, ''

CREATE TABLE #XML(STRXML VARCHAR(MAX))
INSERT INTO #XML EXEC @RESULT=SP_OAGETPROPERTY @OBJ, 'responseXml.xml'

DECLARE @XML AS XML
SELECT @XML=STRXML FROM #XML
SELECT @XML 
DROP TABLE #XML

DECLARE @HDOC INT
EXEC SP_XML_PREPAREDOCUMENT @HDOC OUTPUT,@XML

SELECT * FROM OPENXML(@HDOC,'Tarih_Date/Currency')
WITH
(
 Unit varchar(1000) 'Unit'
,Isim varchar(1000) 'Isim'
,CurrencyName varchar(1000) 'CurrencyName'
,ForexBuying float 'ForexBuying'
,ForexSelling float 'ForexSelling'
,BanknoteBuying float 'BanknoteBuying'
,BanknoteSelling float 'BanknoteSelling'
,CrossRateUSD float 'CrossRateUSD'
,CrossRateOther float 'CrossRateOther'
)