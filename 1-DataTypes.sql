--Tam sayılar
declare @bit bit=1						-- 0 ile 1 (bool)
declare @tinyint tinyint					-- 0 ile 255(byte)
declare @smallint smallint					-- -32.768 ile 32.767(short) 
declare @int int						-- -2.147.483.648 ile 2.147.483.647(int)
declare @bigint bigint						-- -9.223.372.036.854.775.808 ile 9.223.372.036.854.775.807(long)

--Kesirli sayılar
declare @decimal decimal(18,8)					-- -10^38 ile 10^38(decimal) 
declare @numeric numeric(18,8)					-- decimal ile birebir aynı(decimal) 
declare @money money						-- -922.337.203.685.477,5808 ile 922.337.203.685.477,5807(decimal) 
declare @smallmoney money					-- -214.748,3648 to 214.748,3647(decimal) 
declare @float float						-- -1.79E+308 ile -2.23E-308(double)
declare @real real						-- -3.40E+38 ile -1.18E-38,0(float)

--Metinsel 
declare @char char(8000)					--kullanılmayan karakterler için " "(boşluk) karakterini ekler(string)
declare @nchar nchar(4000)					--char ile aynıdır ve unicode destekli her karakter için 1 byte yerine 2 byte tutar(string)
declare @varchar varchar(max)					--2gb kadar veri tutabilir(string)
declare @nvarchar varchar(max)					--2gb kadar veri tutabilir, unicode destekli her karakter için 1 byte yerine 2 byte tutar(string)
								--text,ntext kaldırılmış veri tipi geriye uyumluluk sağlamak için hala kullanılır(string)
--Tarih-saat
declare @date date						--0001-01-01 ile 9999-12-31(Datetime)
declare @smalldate date						--1900-01-01 ile 2079-06-06(Datetime)
declare @datetime datetime					--1753-01-01 00:00:00.000 ile 9999-12-31 23:59:59.997(Datetime)
declare @datetime2 datetime2					--0001-01-01 00:00:00.0000000 ile 9999-12-31 23:59:59.9999999(Datetime)
declare @datetimeoffset datetimeoffset				--0001-01-01 00:00:00.0000000 ile 9999-12-31 23:59:59.9999999 Time zone offset aralığı -14.00/+14.00(DateTimeOffset)
declare @time time						--00:00:00.0000000 ile 23:59:59.9999999(TimeSpan)

--Diğer veri tipleri
declare @binary binary(8000)					--8kb kadar veri tutabilir(FileStream)
declare @varbinary varbinary(max)				--2 gb kadar byte veri tutulabilir(FileStream)
declare @xml xml='<alan1></alan1>'				--xml içinde where ile arama yapılabilir
declare @table table(alan1 varchar(10))				
declare @uniqueidentifier uniqueidentifier=NEWID()		--guid veri tipi için kullanılır(GUID)
declare @sql_variant sql_variant				--(object)
								--image kaldırılmış veri tipi geriye uyumluluk sağlamak için hala kullanılır
