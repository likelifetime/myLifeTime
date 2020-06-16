PRINT 'ANNA - ������� ��� �� ���������� �������'
GO

USE ANNA
GO

PRINT 'human - hum - ����������, ���������� �� �������� ������ �� ������������ �������� (���� �������� ��������, ������ ����� ����� ��������)'
GO

PRINT 'human.tProfession - �������� � ��������� ������ ��������� (����� ����� ���� ��������� � �����-���� ���������� ��������������)'
GO

DROP VIEW IF EXISTS human.vProfession
GO

DROP TABLE IF EXISTS human.tProfession
GO

CREATE TABLE human.tProfession
(
     id INTEGER IDENTITY(1,1)
	,name NVARCHAR(250) NOT NULL
)
GO

CREATE OR ALTER VIEW human.vProfession
WITH SCHEMABINDING
AS
SELECT
    prof.id
   ,prof.name
FROM human.tProfession AS prof
GO

INSERT INTO human.tProfession
(
   name
)
VALUES
(
    '��������'
)
GO

PRINT 'human.tProfession - �������� ��������'
GO

PRINT 'human.vCharacteristic - �������� � ����� ���������� �������� � �������������� �����������'
GO

DROP VIEW IF EXISTS human.vCharacteristic
GO

DROP TABLE IF EXISTS human.tCharacteristic
GO

CREATE TABLE human.tCharacteristic
(
     id      INTEGER IDENTITY(1,1)
	,name    VARCHAR(250) NOT NULL
    ,ruName  VARCHAR(250)     NULL
	,birthDt DATE             NULL
)
GO

CREATE OR ALTER VIEW human.vCharacteristic
WITH SCHEMABINDING
AS
SELECT
    dab.id
   ,dab.name
   ,dab.ruName
   ,dab.birthDt
FROM human.t�haracteristic AS dab
GO

PRINT 'human.vDay - �������� �������������� ����������� �� ����� ������� ����� ��������'
GO

DROP VIEW IF EXISTS human.vDay
GO

DROP TABLE IF EXISTS human.tDay
GO

CREATE TABLE human.tDay
(
     id        DATE    NOT NULL
	,centuryId INTEGER NOT NULL
)
GO

CREATE OR ALTER VIEW human.vDay
WITH SCHEMABINDING
AS
SELECT
    dab.id
   ,dab.centuryId
FROM human.tDay AS dab
GO

PRINT 'dictionary - dic - ����������, ���������� �� ��������� ���������� ������'
GO

PRINT '�������� dic.vZodiac - ���������� �� ��������'
GO

DROP VIEW IF EXISTS dic.vZodiac
GO

DROP TABLE IF EXISTS dic.tZodiac
GO

CREATE TABLE dic.tZodiac
(
     id   INTEGER IDENTITY(1,1)
	,name VARCHAR(250) NOT NULL
)
GO

CREATE OR ALTER VIEW dic.vZodiac
WITH SCHEMABINDING
AS
SELECT
    dab.id
   ,dab.name
FROM dic.tZodiac AS dab
GO

INSERT INTO dic.tZodiac
(
    name
)
VALUES
(
    /*���� 1 ���� - 21 ����� � 20 ������*/
    '����'
),
(
    /*����� 2 ���� - 21 ������ � 21 ���*/
    '�����'
),
(
    /*�������� 3 ���� - 22 ��� � 21 ����*/
    '��������'
),
(
    /*��� 4 ���� - 22 ���� � 22 ����*/
    '���'
),
(
    /*��� 5 ���� - 23 ���� � 21 �������*/
    '���'
),
(
    /*���� 6 ���� - 22 ������� � 23 ��������*/
    '����'
),
(
     /*���� 7 ���� - 24 �������� � 23 �������*/
    '����'
),
(
    /*�������� 8 ���� - 24 ������� � 22 ������*/
    '��������'
),
(
    /*������� 9 ���� - 23 ������ � 22 �������*/
    '�������'
),
(
    /*������� 10 ���� 23 ������� �� 20 ������*/
    '�������'
),
(
    /*������� 11 ���� - 21 ������ � 19 �������*/
    '�������'
),
(
    /*���� 12 ���� - 20 ������� � 20 �����*/
    '����'
)
GO

PRINT '�������� dic.vZodiac ��������'
GO

PRINT '�������� dic.vZodiacElement - ���������� �� ������� ��������'
GO

DROP VIEW IF EXISTS dic.vZodiacElement
GO

DROP TABLE IF EXISTS dic.tZodiacElement
GO

CREATE TABLE dic.tZodiacElement
(
     id   INTEGER IDENTITY(1,1)
	,name VARCHAR(250) NOT NULL
)
GO

CREATE OR ALTER VIEW dic.vZodiacElement
WITH SCHEMABINDING
AS
SELECT
    dab.id
   ,dab.name
FROM dic.tZodiacElement AS dab
GO

INSERT INTO dic.tZodiacElement
(
    name
)
VALUES
(
    /*����� (����, ���, �������)*/
    '�����'
),
(
    /*����� (�����, ����, �������)*/
    '�����'
),
(
    /*������ (��������, ����, �������)*/
    '������'
),
(
    /*���� (���, ��������, ����)*/
    '����'
)
GO

PRINT '�������� dic.vElement ��������'
GO

PRINT 'zodiac - zod - ����������, ���������� �� �� ��������� ������ ����� ��� �������� �������� � ������ ���� ����� ��������'
GO

PRINT 'zod.vHumanZodiac - �������� � ��������� ��������'
GO

CREATE OR ALTER VIEW zod.vHumanZodiac
AS
SELECT
    dab.humId
   ,CASE
        /*������� 10 ���� 23 ������� �� 20 ������*/
        WHEN dab.monthNum = 12 AND dab.dayMonthNum BETWEEN 23 AND 31
		THEN 10
		WHEN dab.monthNum = 1 AND dab.dayMonthNum BETWEEN 1 AND 20
		THEN 10
		/*������� 11 ���� - 21 ������ � 19 �������*/
		WHEN dab.monthNum = 1 AND dab.dayMonthNum BETWEEN 21 AND 31
		THEN 11
		WHEN dab.monthNum = 2 AND dab.dayMonthNum BETWEEN 1 AND 19
		THEN 11
		/*���� 12 ���� - 20 ������� � 20 �����*/
		WHEN dab.monthNum = 2 AND dab.dayMonthNum BETWEEN 20 AND 29
		THEN 12
		WHEN dab.monthNum = 3 AND dab.dayMonthNum BETWEEN 1 AND 20
		THEN 12
		/*���� 1 ���� - 21 ����� � 20 ������*/
		WHEN dab.monthNum = 3 AND dab.dayMonthNum BETWEEN 21 AND 31
		THEN 1
		WHEN dab.monthNum = 4 AND dayMonthNum BETWEEN 1 AND 20
		THEN 1
		/*����� 2 ���� - 21 ������ � 21 ���*/
		WHEN dab.monthNum = 4 AND dab.dayMonthNum BETWEEN 21 AND 30
		THEN 2
		WHEN dab.monthNum = 5 AND dab.dayMonthNum BETWEEN 1 AND 21
		THEN 2
		/*�������� 3 ���� - 22 ��� � 21 ����*/
		WHEN dab.monthNum = 5 AND dab.dayMonthNum BETWEEN 22 AND 31
		THEN 3
		WHEN dab.monthNum = 6 AND dab.dayMonthNum BETWEEN 1 AND 21
		THEN 3
		/*��� 4 ���� - 22 ���� � 22 ����*/
		WHEN dab.monthNum = 6 AND dab.dayMonthNum BETWEEN 22 AND 30
		THEN 4
		WHEN dab.monthNum = 7 AND dab.dayMonthNum BETWEEN 1 AND 22
		THEN 4
		/*��� 5 ���� - 23 ���� � 21 �������*/
		WHEN dab.monthNum = 7 AND dab.dayMonthNum BETWEEN 23 AND 31
		THEN 5
		WHEN dab.monthNum = 8 AND dab.dayMonthNum BETWEEN 1 AND 21
		THEN 5
		/*���� 6 ���� - 22 ������� � 23 ��������*/
		WHEN dab.monthNum = 8 AND dab.dayMonthNum BETWEEN 22 AND 31
		THEN 6
		WHEN dab.monthNum = 9 AND dab.dayMonthNum BETWEEN 1 AND 23
		THEN 6
		/*���� 7 ���� - 24 �������� � 23 �������*/
		WHEN dab.monthNum = 9 AND dab.dayMonthNum BETWEEN 24 AND 30
		THEN 7
		WHEN dab.monthNum = 10 AND dab.dayMonthNum BETWEEN 1 AND 23
		THEN 7
		/*�������� 8 ���� - 24 ������� � 22 ������*/
		WHEN dab.monthNum = 10 AND dab.dayMonthNum BETWEEN 24 AND 31
		THEN 8
		WHEN dab.monthNum = 11 AND dab.dayMonthNum BETWEEN 1 AND 22
		THEN 8
		/*������� 9 ���� - 23 ������ � 22 �������*/
		WHEN dab.monthNum = 11 AND dab.dayMonthNum BETWEEN 23 AND 30
		THEN 9
		WHEN dab.monthNum = 12 AND dab.dayMonthNum BETWEEN 1 AND 22
		THEN 9
    END AS zodId
FROM
(
SELECT
     dab.id AS humId
	,MONTH(dab.birthDt) AS monthNum
    ,DAY(dab.birthDt) AS dayMonthNum
FROM human.vCharacteristic AS dab
WHERE 1 = 1
    AND dab.birthDt IS NOT NULL
) AS dab
GO

PRINT 'zod.vHumanElement - �������� �� �������� ��������'
GO

CREATE OR ALTER VIEW zod.vHumanElement
AS
SELECT
    sng.humId
   ,CASE
      WHEN sng.zodId IN (1, 5, 9)
	  THEN 1 /*�������� (������� � �����)*/
	  WHEN sng.zodId IN (2, 6, 10)
	  THEN 2 /*������ (�������� � �����)*/
	  WHEN sng.zodId IN (3, 7, 11)
	  THEN 3 /*��������� (������� � �������)*/
	  WHEN sng.zodId IN (4, 8, 12)
	  THEN 4 /*������ (�������� � �������)*/
    END AS elementId
FROM zod.vHumanZodiac AS sng
GO

INSERT INTO human.tCharacteristic
(
    name
   ,birthDt
)
VALUES
(
    'Joanne Rowling'
   ,CAST('1965-07-31' AS DATE)
),
(
    'Andrzej Sapkowski'
   ,CAST('1948-06-21' AS DATE)
),
(
    'George Martin'
   ,CAST('1948-09-20' AS DATE)
),
(
    'Ernest Hemingway'
   ,CAST('1961-07-02' AS DATE)
),
(
    'Maksud Ibrahimbekov'
   ,CAST('1935-05-11' AS DATE)
),
(
    'Ivan Efremov'
   ,CAST('1908-04-23' AS DATE)
),
(
    'David Mitchell'
   ,CAST('1969-01-12' AS DATE)
),
(
    'Jane Austen'
   ,CAST('1775-12-16' AS DATE)
),
(
    'Matthew Groening'
   ,CAST('1954-02-15' AS DATE)
),
(
    'Mikhail Sholokhov'
   ,CAST('1905-05-24' AS DATE)
),
(
    'Maksim Gorky'
   ,CAST('1868-04-28' AS DATE)
),
(
    'Michael Bulgakov'
   ,CAST('1891-05-15' AS DATE)
),
(
    'Jack London'
   ,CAST('1876-02-12' AS DATE)
),
(
    'Ted Chiang'
   ,CAST('1967-10-20' AS DATE)
),
(
    'Fedor Dostoevsky'
   ,CAST('1821-11-11' AS DATE)
),
(
    'Lev Tolstoy'
   ,CAST('1828-09-09' AS DATE)
),
(
    'Alexander Pushkin'
   ,CAST('1799-06-06' AS DATE)
),
(
    'Anton Chekhov'
   ,CAST('1860-01-29' AS DATE)
),
(
    'Nikolay Gogol'
   ,CAST('1809-04-01' AS DATE)
),
(
    'Ivan Turgenev'
   ,CAST('1818-11-09' AS DATE)
),
(
    'Eugene Petrov'
   ,CAST('1902-12-13' AS DATE)
),
(
    'Ilya Ilf'
    ,CAST('1897-05-15' AS DATE)
),
(
    'Erich Maria Remarque'
    ,CAST('1898-06-22' AS DATE)
),
(
    'Alexandre Dumas (father)'
   ,CAST('1802-07-24' AS DATE)
),
(
    'Alexandre Dumas fils'
    ,CAST('1824-07-27' AS DATE)
),
(
    'Arthur Conan Doyle'
   ,CAST('1859-06-22' AS DATE)
),
(
    'Arkady Strugatsky'
   ,CAST('1925-08-28' AS DATE)
),
(
    'Boris Strugatsky'
   ,CAST('1933-04-15' AS DATE)
),
(
    'Victor Hugo'
   ,CAST('1802-02-26' AS DATE)
),
(
    'Jules Verne'
   ,CAST('1828-02-08' AS DATE)
),
(
     'Alexey Tolstoy'
   ,CAST('1817-09-05' AS DATE)
),
(
    'Alexey Tolstoy (USSR)'
   ,CAST('1883-01-10' AS DATE)
),
(
    'Alexander Griboedov'
   ,CAST('1795-01-15' AS DATE)
),
(
    'Mark Twain'
   ,CAST('1835-11-30' AS DATE)
),
(
    'Agatha Mary Christie'
   ,CAST('1890-09-15' AS DATE)
),
(
    'Ivan Goncharov'
   ,CAST('1812-06-18' AS DATE)
),
(
    'Daniel Defoe'
   ,CAST('1731-04-24' AS DATE)
),
(
    'Nikolay Leskov'
   ,CAST('1831-02-16' AS DATE)
),
(
    'Boris Vasiliev'
   ,CAST('1924-05-21' AS DATE)
),
(
    'Alexander Belyaev'
   ,CAST('1884-03-16' AS DATE)
),
(
    'Nikolay Nosov'
   ,CAST('1908-11-23' AS DATE)
),
(
    'Alexander Green'
   ,CAST('1880-09-23' AS DATE)
),
(
    'Stanislaw Lem'
   ,CAST('1921-09-12' AS DATE)
),
(
    'George Orwell'
   ,CAST('1903-06-25' AS DATE)
),
(
    'Alexander Volkov'
   ,CAST('1961-05-08' AS DATE)
),
(
    'Yuri Polyakov'
   ,CAST('1954-11-12' AS DATE)
),
(
    'Ivan Shmelev'
   ,CAST('1873-10-03' AS DATE)
),
(
    'Vasil Bykov'
   ,CAST('1924-06-19' AS DATE)
),
(
    'Ray Bradbury'
   ,CAST('1920-08-22' AS DATE)
),
(
    'Arkady Gaidar'
   ,CAST('1904-01-22' AS DATE)
),
(
    'Valentine Pikul'
   ,CAST('1928-07-13' AS DATE)
),
(
    'Veniamin Kaverin'
   ,CAST('1902-04-19' AS DATE)
),
(
    'Vladimir Obruchev'
   ,CAST('1863-10-10' AS DATE)
),
(
    'Alexander Kuprin'
   ,CAST('1870-09-07' AS DATE)
),
(
    'Paul Thomas Mann'
   ,CAST('1875-06-06' AS DATE)
),
(
    'Alexander Ostrovsky'
   ,CAST('1823-04-12' AS DATE)
),
(
    'Charlotte Bronte'
   ,CAST('1816-04-21' AS DATE)
),
(
    'Emily Jane Bronte'
   ,CAST('1818-07-30' AS DATE)
),
(
    'Anne Bronte'
   ,CAST('1820-01-17' AS DATE)
),
(
    'Johann Wolfgang von Goethe'
   ,CAST('1749-08-28' AS DATE)
),
(
    'Grigory Belykh'
   ,CAST('1906-08-19' AS DATE)
),
(
    'Ivan Panteleev'
   ,CAST('1924-06-08' AS DATE)
),
(
    'Boris Pasternak'
   ,CAST('1890-02-10' AS DATE)
),
(
    'Leonid Filatov'
   ,CAST('1946-12-24' AS DATE)
),
(
    'Gabriel Garcia Marquez'
    ,CAST('1927-03-06' AS DATE)
),
(
   'Konstantin Simonov'
   ,CAST('1915-11-28' AS DATE)
),
(
    'Hermann Hesse'
   ,CAST('1877-07-02' AS DATE)
),
(
    'Francis Scott Fitzgerald'
   ,CAST('1896-09-24' AS DATE)
),
(
    'Valentin Kataev'
    ,CAST('1897-01-28' AS DATE)
),
(
    'Anatoly Rybakov'
   ,CAST('1911-01-14' AS DATE)
),
(
    'Lewis Carroll'
   ,CAST('1832-01-27' AS DATE)
),
(
    'Haruki Murakami'
   ,CAST('1949-01-12' AS DATE)
),
(
    'Herbert George Wells'
   ,CAST('1866-09-21' AS DATE)
),
(
    'Theodore Herman Albert Dreiser'
   ,CAST('1871-08-27' AS DATE)
),
(
    'Alexander Vampilov'
   ,CAST('1937-08-19' AS DATE)
),
(
    'Paulo Coelho'
   ,CAST('1947-08-24' AS DATE)
),
(
    'Oscar Wilde'
   ,CAST('1854-10-16' AS DATE)
),
(
    'Vladimir Bogomolov'
   ,CAST('1924-12-04' AS DATE)
),
(
    'Vladimir Bogomolov Voytinsky'
,CAST('1924-07-03' AS DATE)
),
(
    'Robert Louis Balfour Stevenson'
,CAST('1850-11-13' AS DATE)
),
(
    'Antoine Marie Saint-Exupery'
,CAST('1900-06-29' AS DATE)
),
(
    'Kenneth Elton Kesey'
,CAST('1935-09-17' AS DATE)
),
(
    'Arkady Aleksandrovich Weiner'
,CAST('1931-01-13' AS DATE)
),
(
    'Georgy Aleksandrovich Vayner'
,CAST('1938-02-10' AS DATE)
),
(
    'Mikhail Saltykov-Shchedrin'
,CAST('1826-01-27' AS DATE)
),
(
    'Nikolay Nekrasov'
,CAST('1821-12-10' AS DATE)
),
(
  'Franz Kafka'
,CAST('1883-07-03' AS DATE)
),
(
    'Victor Dragunsky'
,CAST('1913-12-01' AS DATE)
),
(
    'Hans Christian Andersen'
,CAST('1805-04-02' AS DATE)
),
(
    'Julian Semenov'
,CAST('1931-10-08' AS DATE)
),
(
   'Vasily Shukshin'
,CAST('1929-07-25' AS DATE)
),
(
   'Ivan Bunin'
,CAST('1870-10-22' AS DATE)
),
(
   'Leo Kassil'
,CAST('1905-07-10' AS DATE)
),
(
   'Yaroslav Hasek'
,CAST('1883-04-30' AS DATE)
),
(
    'Charles Dickens'
,CAST('1812-02-07' AS DATE)
),
(
    'Konstantin Paustovsky'
,CAST('1892-05-31' AS DATE)
),
(
   'Valentin Rasputin'
,CAST('1937-03-15' AS DATE)
),
(
    'Stendhal'
,CAST('1783-01-23' AS DATE)
),
(
   'Jerome Salinger'
,CAST('1919-01-01' AS DATE)
),
(
    'Ivan Krylov'
,CAST('1769-02-13' AS DATE)
),
(
   'Margaret Mitchell'
,CAST('1900-11-08' AS DATE)
),
(
    'Eugene Schwartz'
,CAST('1896-10-21' AS DATE)
),
(
    'Kir Bulychev'
,CAST('1934-10-18' AS DATE)
),
(
    'Jonathan Swift'
,CAST('1667-11-30' AS DATE)
),
(
   'Gabriel Troepolsky'
,CAST('1905-11-29' AS DATE)
),
(
   'Andrzej Sapkowski'
,CAST('1948-06-21' AS DATE)
),
(
    'Miguel de Cervantes'
,CAST('1547-09-29' AS DATE)
),
(
   'Evgeny Zamyatin'
,CAST('1884-02-01' AS DATE)
),
(
    'Sir Joseph Rudyard Kipling '
,CAST('1865-12-30' AS DATE)
),
(
    'Aldous Huxley'
,CAST('1894-07-26' AS DATE)
),
(
   'Anton Makarenko'
,CAST('1888-03-13' AS DATE)
),
(
    'Astrid Lindgren'
,CAST('1907-11-14' AS DATE)
),
(
    'Vladimir Korolenko'
,CAST('1853-07-27' AS DATE)
),
(
   'Chingiz Aitmatov'
,CAST('1928-12-12' AS DATE)
),
(
    'Victoria Tokareva'
,CAST('1937-11-20' AS DATE)
),
(
   'O. Henry'
,CAST('1862-09-11' AS DATE)
),
(
    'Irwin Shaw'
,CAST('1913-02-27' AS DATE)
),
(
    'John Tolkien'
,CAST('1892-01-03' AS DATE)
),
(
   'Boris Polevoy'
,CAST('1908-03-17' AS DATE)
),
(
    'Alexander Twardowski'
,CAST('1910-06-21' AS DATE)
),
(
    'Boris Akunin'
,CAST('1956-05-20' AS DATE)
),
(
    'Selma Lagerlof'
,CAST('1858-11-20' AS DATE)
),
(
    'Vladimir Nabokov'
,CAST('1899-04-22' AS DATE)
),
(
   'Korney Chukovskiy'
,CAST('1882-03-31' AS DATE)
),
(
   'Petr Yershov'
,CAST('1815-03-06' AS DATE)
),
(
    'Sergey Aksakov'
,CAST('1791-10-01' AS DATE)
),
(
    'Viktor Astafyev'
,CAST('1924-05-01' AS DATE)
),
(
    'Vladimir Dal'
,CAST('1801-11-22' AS DATE)
),
(
   'Yuriy Dombrovskiy'
,CAST('1909-05-12' AS DATE)
)
GO

PRINT 'zod.vDayBirth - ����� 1 - �������� ��������'
GO

INSERT INTO human.tCharacteristic
(
    ruName
   ,name
   ,birthDt
)
VALUES
(
    '����� ��������'
   ,'Denis Fonvizin'
   ,CAST('1745-04-14' AS DATE)
),
(
    '�������� ������'
   ,'Anatoly Ivanov'
   ,CAST('1928-05-05' AS DATE)
),
(
    '���� ��������'
   ,'Yuri Bondarev'
   ,CAST('1924-03-15' AS DATE)
),
(
    '����� �����������'
   ,'Sophia Radzievskaya'
   ,CAST(' 1892-06-12' AS DATE)
),
(
    '������ �������'
   ,'Varlam Shalamov'
   ,CAST('1907-06-18' AS DATE)
),
(
    '�������� �����������'
   ,'Vladimir Gilyarovsky'
   ,CAST('1855-12-08' AS DATE)
),
(
    '������ �. ������'
   ,'Jerome K. Jerome'
   ,CAST('1859-05-02' AS DATE)
),
(
    '������� ��������'
   ,'Dmitry Furmanov'
   ,CAST('1891-11-07' AS DATE)
),
(
    '���������� �����'
   ,'Konstantin Sedykh'
   ,CAST('1908-01-21' AS DATE)
),
(
    '���� �����'
   ,'John Fowles'
   ,CAST('1926-03-31' AS DATE)
),
(
    '������ ��������'
   ,'Fazil Iskander'
   ,CAST('1929-03-06' AS DATE)
),
(
    '��� ����'
   ,'Per Valais'
   ,CAST('1926-08-05' AS DATE)
),
(
    '��� �������'
   ,'May Chevalley'
   ,CAST('1935-09-25' AS DATE)
),
(
    '��������� ��������'
   ,'Alexander Stepanov'
   ,CAST('1892-02-02' AS DATE)
),
(
    '������� ������������'
   ,'Nikolay Chernyshevsky'
   ,CAST('1828-07-24' AS DATE)
),
(
    '���� ��������� ����'
   ,'Alan Alexander Milne'
   ,CAST('1882-01-18' AS DATE)
),
(
    '���� ���'
   ,'Kobo Abe'
   ,CAST('1924-03-07' AS DATE)
),
(
    '����� ���� ���'
   ,'Thomas Mine Reed'
   ,CAST('1818-04-04' AS DATE)
),
(
    '������ ������� �����'
   ,'James Fenimore Cooper'
   ,CAST('1789-09-15' AS DATE)
),
(
    '������� �����'
   ,'Marcel Proust'
   ,CAST('1871-07-10' AS DATE)
),
(
    '����� ������'
   ,'Emily Bronte'
   ,CAST('1818-07-30' AS DATE)
),
(
    '������ ���'
   ,'Richard Bach'
   ,CAST('1936-06-23' AS DATE)
),
(
    '������ ��������'
   ,'Marina Tsvetaeva'
   ,CAST('1892-10-08' AS DATE)
),
(
    '����� ��������'
   ,'Colin McCullough'
   ,CAST('1937-06-01' AS DATE)
),
(
    '������ �������'
   ,'Leonid Andreev'
   ,CAST('1871-08-21' AS DATE)
),
(
    '�������� ����'
   ,'Somerset Maugham'
   ,CAST('1874-01-25' AS DATE)
),
(
    '������ �������'
   ,'Victor Pelevin'
   ,CAST('1962-11-22' AS DATE)
),
(
    '���� �������'
   ,'Georges Simenon'
   ,CAST('1903-02-13' AS DATE)
),
(
    '������� �������'
   ,'Albert Likhanov'
   ,CAST('1935-09-13' AS DATE)
),
(
    '���� ��������'
   ,'John Steinbeck'
   ,CAST('1902-02-27' AS DATE)
),
(
    '������ ���'
   ,'Daniel Keyes'
   ,CAST('1927-08-09' AS DATE)
),
(
    '����� ��������'
   ,'Maria Semenova'
   ,CAST('1958-11-01' AS DATE)
),
(
    '������� ���'
   ,'Nikolay Kun'
   ,CAST('1877-05-21' AS DATE)
),
(
    '����� ������ ������'
   ,'Ethel Lilian Voynich'
   ,CAST('1864-05-11' AS DATE)
),
(
    '���� �����'
   ,'Omar Khayyam'
   ,CAST('1048-05-18' AS DATE)
),
(
    '����� ��'
   ,'Edgar Allan Poe'
   ,CAST('1809-01-19' AS DATE)
),
(
    '������ �����'
   ,'Stefan Zweig'
   ,CAST('1881-11-28' AS DATE)
),
(
    '��������� ��������'
   ,'Vladislav Krapivin'
   ,CAST('1938-10-14' AS DATE)
),
(
    '�������� ������'
   ,'Vladimir Suteev'
   ,CAST('1903-07-05' AS DATE)
),
(
    '������� ���'
   ,'Bernard Show'
   ,CAST('1856-07-26' AS DATE)
),
(
    '������ ��������'
   ,'Leonid Solovyov'
   ,CAST('1957-01-02' AS DATE)
),
(
    '������ �����'
   ,'Douglas Adams'
   ,CAST('1952-03-11' AS DATE)
),
(
    '������� ���������'
   ,'Evgeny Grishkovets'
   ,CAST('1967-02-17' AS DATE)
),
(
    '������ ����� ����'
   ,'James Headley Chase'
   ,CAST('1906-12-24' AS DATE)
),
(
    '�������� ����������'
   ,'Vladimir Mayakovsky'
   ,CAST('1893-07-19' AS DATE)
),
(
    '���� ���������'
   ,'John Galsworthy'
   ,CAST('1867-08-14' AS DATE)
),
(
    '������ �������'
   ,'Mikhail Zoshchenko'
   ,CAST('1894-08-09' AS DATE)
),
(
    '�������� ������'
   ,'Vyacheslav Shishkov'
   ,CAST('1873-10-03' AS DATE)
),
(
    '������� ���������'
   ,'Evgeny Evtushenko'
   ,CAST('1932-07-18' AS DATE)
),
(
    '������� ��'
   ,'Vasily Yan'
   ,CAST('1875-01-04' AS DATE)
),
(
    '������ ��'
   ,'Harper lee'
   ,CAST('1926-04-28' AS DATE)
),
(
    '������ �����-�������'
   ,'Ernest Seton-Thompson'
   ,CAST('1860-08-14' AS DATE)
),
(
    '������ ����'
   ,'Albert Camus'
   ,CAST('1913-11-07' AS DATE)
),
(
    '������ ��������'
   ,'Andrey Platonov'
   ,CAST('1899-08-28' AS DATE)
),
(
    '��������� ������'
   ,'Alexander Fadeev'
   ,CAST('1901-12-24' AS DATE)
),
(
    '������ ����'
   ,'Stephen king'
   ,CAST('1947-09-21' AS DATE)
),
(
    '������ �������'
   ,'Sergey Smirnov'
   ,CAST('1915-09-26' AS DATE)
),
(
    '������ ��������'
   ,'Victor Nekrasov'
   ,CAST('1911-06-17' AS DATE)
),
(
    '�� �� ��������'
   ,'Guy de Maupassant'
   ,CAST('1850-08-05' AS DATE)
),
(
    '������ �������-�������'
   ,'Sergey Sergeev-Tsensky'
   ,CAST('1875-09-30' AS DATE)
),
(
    '������ ��������'
   ,'Sergey Alekseev'
   ,CAST('1871-03-09' AS DATE)
),
(
    '����� �����'
   ,'Arthur Haley'
   ,CAST('1920-04-05' AS DATE)
),
(
    '�������� ��������'
   ,'Vladimir Vysotsky'
   ,CAST('1938-01-25' AS DATE)
),
(
    '��������� ����������'
   ,'Alexander Solzhenitsyn'
   ,CAST('1918-12-11' AS DATE)
),
(
    '������� �������-������'
   ,'Alexey Novikov-Priboy'
   ,CAST('1877-03-24' AS DATE)
),
(
    '������� ���'
   ,'Umberto Eco'
   ,CAST('1932-01-05' AS DATE)
),
(
    '��������� ���������'
   ,'Alexander Chakovsky'
   ,CAST('1913-08-26' AS DATE)
),
(
    '����� ������'
   ,'Iris murdoch'
   ,CAST('1919-07-15' AS DATE)
),
(
    '������ �������'
   ,'William Golding'
   ,CAST('1911-09-19' AS DATE)
),
(
    '������ ���������'
   ,'Eduard Uspensky'
   ,CAST('1937-12-22' AS DATE)
),
(
    '����� ���������'
   ,'Maurice Meterlink'
   ,CAST('1862-08-29' AS DATE)
),
(
    '������ ������'
   ,'Gustave Flaubert'
   ,CAST('1821-12-12' AS DATE)
),
(
    '������ �������'
   ,'James Aldridge'
   ,CAST('1918-07-10' AS DATE)
),
(
    '���� ����'
   ,'John Ball'
   ,CAST('1911-07-08' AS DATE)
),
(
    '������ ��������'
   ,'William Thackeray'
   ,CAST('1811-07-18' AS DATE)
),
(
    '����� �� �������'
   ,'Honore de Balzac'
   ,CAST('1799-05-20' AS DATE)
),
(
    '�������� ��������'
   ,'Vladimir Voinovich'
   ,CAST('1932-09-26' AS DATE)
),
(
    '�������� �����'
   ,'Grigory Gorin'
   ,CAST('1940-03-12' AS DATE)
),
(
    '��������� ������'
   ,'Valentina Oseeva'
   ,CAST('1902-04-28' AS DATE)
),
(
    '������� ������'
   ,'Vitali Bianchi'
   ,CAST('1894-02-11' AS DATE)
),
(
    '�������� �������'
   ,'Benedict Spinoza'
   ,CAST('1632-11-24' AS DATE)
),
(
    '���� �����'
   ,'Herve Bazin'
   ,CAST('1911-04-17' AS DATE)
),
(
    '������ ������� ����������'
   ,'Pestov Nikolay Evgrafovich'
   ,CAST('1892-08-17' AS DATE)
),
(
    '�������� ����������'
   ,'Vladimir Zheleznikov'
   ,CAST('1925-10-26' AS DATE)
),
(
    '����� ����������'
   ,'Vadim Kozhevnikov'
   ,CAST('1909-04-22' AS DATE)
),
(
    '������� �����'
   ,'Walter Scott'
   ,CAST('1771-08-15' AS DATE)
),
(
    '���� ������'
   ,'Sasha Black'
   ,CAST('1880-10-13' AS DATE)
),
(
    '����� ������'
   ,'Edmond Rostan'
   ,CAST('1868-04-01' AS DATE)
),
(
    '����� �������'
   ,'Wilkie Collins'
   ,CAST('1824-01-08' AS DATE)
),
(
    '������ ��������������'
   ,'Robert Christmas'
   ,CAST('1932-06-20' AS DATE)
),
(
    '����� ����'
   ,'Emil Zola'
   ,CAST('1840-04-02' AS DATE)
),
(
    '������� ��������'
   ,'Vasily Grossman'
   ,CAST('1905-12-12' AS DATE)
),
(
    '�������� ������'
   ,'Vladimir Belyaev'
   ,CAST('1909-04-03' AS DATE)
),
(
    '������� �������'
   ,'George Danelia'
   ,CAST('1930-08-25' AS DATE)
),
(
    '����� �����'
   ,'Charles Perrault'
   ,CAST('1628-01-12' AS DATE)
),
(
    '������� ������'
   ,'Bogomil Rainov'
   ,CAST('1919-06-19' AS DATE)
),
(
    '���� �������'
   ,'Ivan Stadnyuk'
   ,CAST('1920-03-08' AS DATE)
),
(
    '����� �����'
   ,'Pavel Bazhov'
   ,CAST('1879-01-27' AS DATE)
),
(
    '���� ��������'
   ,'Kurt Vonnegut'
   ,CAST('1922-11-11' AS DATE)
),
(
    '���������� ��������'
   ,'Alexandra Marinina'
   ,CAST('1957-06-16' AS DATE)
),
(
    '������ ��������'
   ,'Andrey Nekrasov'
   ,CAST('1907-06-22' AS DATE)
),
(
    '������ �����'
   ,'James joyce'
   ,CAST('1882-02-02' AS DATE)
),
(
    '���� ������������'
   ,'Ivan Kotlyarevsky'
   ,CAST('1769-09-09' AS DATE)
),
(
    '������� �� �����'
   ,'Chauderlo de laclos'
   ,CAST('1741-10-18' AS DATE)
),
(
    '������ ������'
   ,'Gianni Rodari'
   ,CAST('1920-10-23' AS DATE)
),
(
    '����� �����'
   ,'Mario puzo'
   ,CAST('1920-10-15' AS DATE)
),
(
    '������ �������'
   ,'Roger Zhelyazny'
   ,CAST('1937-05-13' AS DATE)
),
(
    '������� ��������'
   ,'Rafael Sabatini'
   ,CAST('1875-04-29' AS DATE)
),
(
    '������� ����������'
   ,'Nikolai Ostrovsky'
   ,CAST('1904-09-29' AS DATE)
),
(
    '����� ��������'
   ,'Danil Koretsky'
   ,CAST('1948-08-04' AS DATE)
),
(
    '���� ��������'
   ,'Anna Akhmatova'
   ,CAST('1889-06-23' AS DATE)
),
(
    '������ ���������'
   ,'Mikhail Uspensky'
   ,CAST('1950-11-29' AS DATE)
),
(
    '��������� ����'
   ,'Wilhelm Hauf'
   ,CAST('1802-11-29' AS DATE)
),
(
    '����� �������'
   ,'Moussa Jalil'
   ,CAST('1906-02-15' AS DATE)
),
(
    '���� ����� '
   ,'Jacob Grimm'
   ,CAST('1785-01-04' AS DATE)
),
(
    '��������� �����'
   ,'Wilhelm Karl Grimm'
   ,CAST('1786-02-24' AS DATE)
),
(
    '�������� ��������'
   ,'Giovanni Boccaccio'
   ,CAST('1313-06-16' AS DATE)
),
(
    '������� ������'
   ,'Nikolay Gumilyov'
   ,CAST('1886-04-15' AS DATE)
),
(
    '����� �����'
   ,'Clive Lewis'
   ,CAST('1898-11-29' AS DATE)
),
(
    '������� ������'
   ,'Nicholas Sparks'
   ,CAST('1965-12-31' AS DATE)
),
(
    '������ �� ����'
   ,'Ursula Le Guin'
   ,CAST('1929-10-21' AS DATE)
),
(
    '��������� �����'
   ,'Francoise Sagan'
   ,CAST('1935-06-21' AS DATE)
),
(
    '������ �����'
   ,'Lazarus Lagin'
   ,CAST('1903-12-04' AS DATE)
),
(
    '������� �����'
   ,'Friedrich Nietzsche'
   ,CAST('1844-10-15' AS DATE)
),
(
    '������ �������'
   ,'Mikhail Prishvin'
   ,CAST('1873-02-04' AS DATE)
),
(
    '���� ������'
   ,'John Irving'
   ,CAST('1942-03-02' AS DATE)
),
(
    '������� ������'
   ,'Aleksey Ivanov'
   ,CAST('1969-11-23' AS DATE)
),
(
    '�������� ��������'
   ,'Vladimir Arseniev'
   ,CAST('1872-09-10' AS DATE)
),
(
    '��������� ��������'
   ,'Alexander Arseniev'
   ,CAST('1854-06-04' AS DATE)
),
(
    '���� ��������'
   ,'Ioan Arseniev'
   ,CAST('1862-03-19' AS DATE)
),
(
    '���������� ��������'
   ,'Konstantin Arseniev'
   ,CAST('1837-02-05' AS DATE)
),
(
    '���� ������'
   ,'Tove Jansson'
   ,CAST('1914-08-09' AS DATE)
),
(
    '������� �����-����'
   ,'Harriet Beecher Stowe'
   ,CAST('1811-06-14' AS DATE)
),
(
    '��������� ��������'
   ,'Alexander Bashlachev'
   ,CAST('1960-05-27' AS DATE)
),
(
    '������ ������'
   ,'Samuel Marshak'
   ,CAST('1887-11-03' AS DATE)
),
(
    '����� ���� ��������'
   ,'Reshad Nuri Guentekin'
   ,CAST('1889-11-25' AS DATE)
),
(
    '����� ����������'
   ,'Arthur Schopenhauer'
   ,CAST('1788-02-22' AS DATE)
),
(
    '����� ������'
   ,'Thomas harris'
   ,CAST('1940-04-11' AS DATE)
),
(
    '���� ������'
   ,'John Wyndham'
   ,CAST('1903-07-10' AS DATE)
),
(
    '������ ������'
   ,'Robert Musille'
   ,CAST('1880-11-06' AS DATE)
),
(
    '����� �����'
   ,'Maurice Druon'
   ,CAST('1918-04-23' AS DATE)
),
(
    '������ �������'
   ,'William Faulkner'
   ,CAST('1897-09-25' AS DATE)
),
(
    '������ ������'
   ,'Elinor Porter'
   ,CAST('1868-12-19' AS DATE)
),
(
    '�������� ������'
   ,'Fernando pessoa'
   ,CAST('1888-06-13' AS DATE)
),
(
    '������ ���������'
   ,'Robert Stilmark'
   ,CAST('1909-04-03' AS DATE)
),
(
    '�� �����'
   ,'Ian Larry'
   ,CAST('1900-02-15' AS DATE)
),
(
    '���� ������'
   ,'Walt Whitman'
   ,CAST('1819-05-31' AS DATE)
),
(
    '������ �������'
   ,'Kozma Rods'
   ,CAST('1803-04-11' AS DATE)
),
(
    '����� ��������'
   ,'Terry Goodkind'
   ,CAST('1948-05-01' AS DATE)
),
(
    '������� ��������'
   ,'Nikolay Karamzin'
   ,CAST('1766-12-12' AS DATE)
),
(
    '������� ����������'
   ,'Nikolay Zabolotsky'
   ,CAST('1903-05-07' AS DATE)
),
(
    '����� �������'
   ,'Milan Kundera'
   ,CAST('1929-04-01' AS DATE)
),
(
    '������ ����'
   ,'Roald dahl'
   ,CAST('1916-09-13' AS DATE)
),
(
    '����� ������'
   ,'Arthur Golden'
   ,CAST('1956-12-06' AS DATE)
),
(
    '������ �������'
   ,'Eduard Limonov'
   ,CAST('1943-02-22' AS DATE)
),
(
    '������ ���������'
   ,'William Pokhlebkin'
   ,CAST('1923-08-20' AS DATE)
),
(
    '������ ��������'
   ,'Mariam Petrosyan'
   ,CAST('1969-08-10' AS DATE)
),
(
    'Ը��� ������'
   ,'Fedor Tyutchev'
   ,CAST('1803-12-05' AS DATE)
),
(
    '������� ������'
   ,'Gottfried Keller'
   ,CAST('1819-07-19' AS DATE)
),
(
    '������ ������'
   ,'Daniil Granin'
   ,CAST('1919-01-01' AS DATE)
),
(
    '������ ����'
   ,'Hector Little'
   ,CAST('1830-05-20' AS DATE)
),
(
    '����� ����'
   ,'Tibor Deri'
   ,CAST('1894-10-18' AS DATE)
),
(
    '������� ������������'
   ,'Dmitry Merezhkovsky'
   ,CAST('1865-08-14' AS DATE)
),
(
    '�������� ��������'
   ,'Vladimir Dudintsev'
   ,CAST('1918-07-29' AS DATE)
),
(
    '��� ����'
   ,'Jean Paul'
   ,CAST('1763-03-21' AS DATE)
),
(
    '�������� ����������'
   ,'Raffaello Giovagnoli'
   ,CAST('1838-03-13' AS DATE)
),
(
    '����� �������'
   ,'David Lawrence'
   ,CAST('1885-09-11' AS DATE)
),
(
    '�������� ����'
   ,'Immanuel Kant'
   ,CAST('1724-04-22' AS DATE)
),
(
    '���� ����'
   ,'Georges Sand'
   ,CAST('1804-07-01' AS DATE)
),
(
    '���� ������'
   ,'John Updike'
   ,CAST('1932-03-18' AS DATE)
),
(
    '������ ��������'
   ,'Henryk Senkevich'
   ,CAST('1846-05-05' AS DATE)
),
(
    '����� ������'
   ,'Andre Norton'
   ,CAST('1912-02-17' AS DATE)
),
(
    '������� ����� �������'
   ,'Gregory David Roberts'
   ,CAST('1952-06-21' AS DATE)
),
(
    '������� ��� ���������'
   ,'Gilbert Keith Chesterton'
   ,CAST('1874-05-29' AS DATE)
),
(
    '��� ���'
   ,'Bob show'
   ,CAST('1931-12-31' AS DATE)
),
(
    '����� �����'
   ,'Agniya Barto'
   ,CAST('1901-02-17' AS DATE)
),
(
    '��� �������'
   ,'Lev Gumilev'
   ,CAST('1912-10-01' AS DATE)
),
(
    '������ ��������'
   ,'Sergey Dovlatov'
   ,CAST('1941-09-03' AS DATE)
),
(
    '�������� ������'
   ,'Valentin Ivanov'
   ,CAST('1967-08-01' AS DATE)
),
(
    '����� ������'
   ,'Romain Rolland'
   ,CAST('1866-01-29' AS DATE)
),
(
    '��������� ������'
   ,'Archibald Cronin'
   ,CAST('1896-07-19' AS DATE)
),
(
    '����� ����������'
   ,'Boris Strugatsky'
   ,CAST('1933-04-15' AS DATE)
),
(
    '����� ����������'
   ,'Chabua Amirajibi'
   ,CAST('1921-11-18' AS DATE)
),
(
    '������� ����������'
   ,'Arseny Tarkovsky'
   ,CAST('1907-06-25' AS DATE)
),
(
    '����� ���� ����-�������'
   ,'Joseph Henry Roney Sr'
   ,CAST('1856-02-17' AS DATE)
),
(
    '������ �����'
   ,'Robert Sheckley'
   ,CAST('1928-07-16' AS DATE)
),
(
    '���� �����'
   ,'Karl Marx'
   ,CAST('1818-05-05' AS DATE)
),
(
    '������ ��������'
   ,'Sergey Mikhalkov'
   ,CAST('1913-03-13' AS DATE)
),
(
    '������� ��������'
   ,'Evgenia Ginzburg'
   ,CAST('1904-12-20' AS DATE)
),
(
    '���� ������'
   ,'Yuri German'
   ,CAST('1910-04-04' AS DATE)
),
(
    '���� ��������'
   ,'Anna Gavalda'
   ,CAST('1970-12-09' AS DATE)
),
(
    '���� ������'
   ,'Vera Panova'
   ,CAST('1905-03-20' AS DATE)
),
(
    'Ը��� �������'
   ,'Fedor Abramov'
   ,CAST('1920-02-29' AS DATE)
),
(
    '���� �������'
   ,'Stig Larsson'
   ,CAST('1954-08-15' AS DATE)
),
(
    '������� ������'
   ,'Arkady Fidler'
   ,CAST('1894-11-28' AS DATE)
),
(
    '������ ����'
   ,'James Crews'
   ,CAST('1926-05-13' AS DATE)
),
(
    '������ ���� ����������'
   ,'Kuvaev Oleg Mikhailovich'
   ,CAST('1934-08-12' AS DATE)
),
(
    '������� ����������'
   ,'Niccolo Machiavelli'
   ,CAST('1469-05-03' AS DATE)
),
(
    '������ ��������'
   ,'Robert Heinlein'
   ,CAST('1907-07-07' AS DATE)
),
(
    '������ ������'
   ,'Joanne harris'
   ,CAST('1964-07-03' AS DATE)
),
(
    '����� ������'
   ,'Pavel Sanaev'
   ,CAST('1969-08-16' AS DATE)
),
(
    '������ ��������'
   ,'Mikhail Zadornov'
   ,CAST('1948-07-21' AS DATE)
),
(
    '����� ��������'
   ,'Reuben Fraerman'
   ,CAST('1891-09-22' AS DATE)
),
(
    '������ �����'
   ,'Irving Stone'
   ,CAST('1903-07-14' AS DATE)
),
(
    '����� �� �����'
   ,'Daphne du Maurier'
   ,CAST('1907-05-13' AS DATE)
),
(
    '������ ����������'
   ,'Joanna Khmelevskaya'
   ,CAST('1932-04-02' AS DATE)
),
(
    '����� �����'
   ,'Arthur Clark'
   ,CAST('1917-12-16' AS DATE)
),
(
    '������ �������'
   ,'Patrick Suskind'
   ,CAST('1949-03-26' AS DATE)
),
(
    '������� �����'
   ,'Cecilia Ahern'
   ,CAST('1981-09-30' AS DATE)
),
(
    '������ ���������'
   ,'Mikhail Lomonosov'
   ,CAST('1711-11-19' AS DATE)
),
(
    '������ �������'
   ,'Herman Melville'
   ,CAST('1819-08-01' AS DATE)
),
(
    '������� ����'
   ,'Alfred Brem'
   ,CAST('1829-02-02' AS DATE)
),
(
    '������ �����'
   ,'Heinrich Boll'
   ,CAST('1917-12-21' AS DATE)
),
(
    '������ �������'
   ,'Andrey Gulyashki'
   ,CAST('1914-05-07' AS DATE)
),
(
    '������� ������������'
   ,'Vasily Sukhomlinsky'
   ,CAST('1918-09-28' AS DATE)
),
(
    '�������� �������'
   ,'Venedikt Erofeev'
   ,CAST('1938-10-24' AS DATE)
),
(
    '���� ����������'
   ,'Isai Kalashnikov'
   ,CAST('1931-08-09' AS DATE)
),
(
    '��������� ��������'
   ,'Alexander Kazantsev'
   ,CAST('1906-09-02' AS DATE)
),
(
    '������ ������'
   ,'Bernard Werber'
   ,CAST('1961-09-18' AS DATE)
),
(
    '����� ���������'
   ,'Maria Metlitskaya'
   ,CAST('1959-07-19' AS DATE)
),
(
    '������ ������'
   ,'Eduard Asadov'
   ,CAST('1923-09-07' AS DATE)
),
(
    '����� �����'
   ,'Georges Amadou'
   ,CAST('1912-08-10' AS DATE)
),
(
    '��� �����'
   ,'Anne Golon'
   ,CAST('1921-12-17' AS DATE)
),
(
    '���� �����'
   ,'Serge Golon'
   ,CAST('1903-08-23' AS DATE)
),
(
    '���� �������'
   ,'Otar Chiladze'
   ,CAST('1933-03-20' AS DATE)
),
(
    '�������� ��������'
   ,'Anatoly Kuznetsov'
   ,CAST('1929-08-18' AS DATE)
),
(
    '���������� ���������'
   ,'Abdurahman Absalyamov'
   ,CAST('1911-12-28' AS DATE)
),	
(
    '���� ������'
   ,'Knut Hamsun'
   ,CAST('1859-08-04' AS DATE)
),
(
    '����� ������ ������ ������'
   ,'Ernst Theodore Amadeus Hoffmann'
   ,CAST('1776-01-24' AS DATE)
),
(
    '����� �������'
   ,'Pavel Vezhinov'
   ,CAST('1914-11-09' AS DATE)
),
(
    '�������� �����'
   ,'Bertolt Brecht'
   ,CAST('1898-02-10' AS DATE)
),
(
    '������ �������'
   ,'James Clavell'
   ,CAST('1921-10-10' AS DATE)
),
(
    '��� ��������'
   ,'Louis Boussenard'
   ,CAST('1847-10-04' AS DATE)
),
(
    '�������'
   ,'Voltaire'
   ,CAST('1694-11-21' AS DATE)
),
(
    '����� ������'
   ,'Sydney Sheldon'
   ,CAST('1917-02-11' AS DATE)
),
(
    '�������� �������'
   ,'Veronika Tushnova'
   ,CAST('1911-03-27' AS DATE)
),
(
    '�������� �����'
   ,'Bernhard Schlink'
   ,CAST('1944-07-06' AS DATE)
),
(
    '����� ��������'
   ,'Terry Pratchett'
   ,CAST('1948-04-28' AS DATE)
),
(
    '������� ������ �������'
   ,'Albert Sanchez Pignol'
   ,CAST('1965-07-11' AS DATE)
),
(
    '���� ������'
   ,'Bram Stoker'
   ,CAST('1847-11-08' AS DATE)
),
(
    '�������� ������'
   ,'Clifford simak'
   ,CAST('1904-08-03' AS DATE)
),
(
    '������� �����'
   ,'Lobsang Rampa'
   ,CAST('1910-04-08' AS DATE)
),
(
    '���� �����������'
   ,'Lyon Feuchtwanger'
   ,CAST('1884-07-07' AS DATE)
),
(
    '��� ������'
   ,'Anne Bronte'
   ,CAST('1820-02-17' AS DATE)
),
(
    '���� �� ����'
   ,'Lope de Vega'
   ,CAST('1562-11-25' AS DATE)
),
(
    '�������� ����������'
   ,'Anatoly Pristavkin'
   ,CAST('1931-10-17' AS DATE)
),
(
    '�������� ���'
   ,'Athanasius Fet'
   ,CAST('1820-12-05' AS DATE)
),
(
    '������'
   ,'Hegel'
   ,CAST('1770-08-27' AS DATE)
),
(
    '������ �������'
   ,'Robert Jordan'
   ,CAST('1948-10-17' AS DATE)
),
(
    '������ �����'
   ,'Sandra brown'
   ,CAST('1948-03-12' AS DATE)
),
(
    '����� �����'
   ,'Thomas hardy'
   ,CAST('1840-06-02' AS DATE)
),
(
    '������� ���������'
   ,'Evgeny Veltistov'
   ,CAST('1934-07-21' AS DATE)
),
(
    '����� ���������'
   ,'Pavel Melnikov'
   ,CAST('1819-11-06' AS DATE)
),
(
    '������� ����� �������'
   ,'Francis Eliza Burnett'
   ,CAST('1849-11-24' AS DATE)
),
(
    '�������� ���������'
   ,'Svetlana Martynchik'
   ,CAST('1965-06-09' AS DATE)
),
(
    '����� �����'
   ,'Igor Styopin'
   ,CAST('1967-01-21' AS DATE)
),
(
    '����� ��������'
   ,'Harry harrison'
   ,CAST('1925-03-12' AS DATE)
),
(
    '��������� �������'
   ,'Sebastian Japrizo'
   ,CAST('1931-07-04' AS DATE)
),
(
    '������ �������'
   ,'James harriot'
   ,CAST('1916-10-03' AS DATE)
),
(
    '����� �����'
   ,'Andre Morois'
   ,CAST('1885-07-26' AS DATE)
),
(
    '������� ���������'
   ,'Dmitry Lipskerov'
   ,CAST('1964-02-19' AS DATE)
),
(
    '����� ������'
   ,'Henry Miller'
   ,CAST('1891-12-26' AS DATE)
),
(
    '������'
   ,'Moliere'
   ,CAST('1622-01-15' AS DATE)
),
(
    '����� ����������'
   ,'Emil Braginsky'
   ,CAST('1921-11-19' AS DATE)
),
(
    '������ �������'
   ,'Eldar Ryazanov'
   ,CAST('1927-11-18' AS DATE)
),
(
    '����� ��������'
   ,'Bulat Okudzhava'
   ,CAST('1924-05-09' AS DATE)
),
(
    '������ ������'
   ,'Sergey Kozlov'
   ,CAST('1939-08-22' AS DATE)
),
(
    '���� �������'
   ,'Petr Chaadaev'
   ,CAST('1794-06-07' AS DATE)
),
(
    '����� �������'
   ,'Frank Herbert'
   ,CAST('1920-10-08' AS DATE)
),
(
    '��������� ���� (���)'
   ,'Alexander Dumas (son)'
   ,CAST('1824-07-27' AS DATE)
),
(
    '�������� ��������'
   ,'Frederick Begbeder'
   ,CAST('1965-09-21' AS DATE)
),
(
    '������� �������'
   ,'Friedrich Engels'
   ,CAST('1820-11-28' AS DATE)
),
(
    '������ �� �������'
   ,'Michel de Montaigne'
   ,CAST('1533-02-28' AS DATE)
),
(
    '����� ������'
   ,'Charles Baudelaire'
   ,CAST('1821-04-09' AS DATE)
),
(
    '���������� �����������'
   ,'Konstantin Tsiolkovsky'
   ,CAST('1857-09-17' AS DATE)
),
(
    '������ �������'
   ,'Suzanne Collins'
   ,CAST('1962-08-10' AS DATE)
),
(
    '������� ��������'
   ,'Artemy Troitsky'
   ,CAST('1955-06-16' AS DATE)
),
(
    '����� ��������� (�������-���������)'
   ,'Irina Golovkina (Rimskaya-Korsakova)'
   ,CAST('1904-06-06' AS DATE)
),
(
    '���� �����'
   ,'Yuri Olesha'
   ,CAST('1899-03-03' AS DATE)
),
(
    '������� �����-�������'
   ,'Dmitry Mamin-Sibiryak'
   ,CAST('1852-11-06' AS DATE)
),
(
    '��������� �����������'
   ,'Alexander Kozachinsky'
   ,CAST('1903-09-04' AS DATE)
),
(
    '���� ����'
   ,'Graham Green'
   ,CAST('1904-10-02' AS DATE)
),
(
    '������ ����� ����'
   ,'Charles Percy Snow'
   ,CAST('1905-10-15' AS DATE)
),
(
    '������ ��������'
   ,'Anthony Burgess'
   ,CAST('1917-02-25' AS DATE)
),
(
    '������� �����'
   ,'Jeffrey Chaucer'
   ,null
),
(
    '����'
   ,'Aesop'
   ,null
),
(
    '����� ������'
   ,'Philip Pulman'
   ,CAST('1946-10-19' AS DATE)
),
(
    '������ ���������'
   ,'Carlos Castaneda'
   ,CAST('1925-12-25' AS DATE)
),
(
    '������ �����'
   ,'William Irish'
   ,CAST('1903-12-04' AS DATE)
),
(
    '������ ����� ����'
   ,'Lymene Frank Baum'
   ,CAST('1856-05-15' AS DATE)
),
(
    '������ �������'
   ,'Stepan Pisakhov'
   ,CAST('1879-10-25' AS DATE)
),
(
    '������� ���������'
   ,'Daniel Glattauer'
   ,CAST('1960-05-19' AS DATE)
),
(
    '������� �������'
   ,'Vitaly Gubarev'
   ,CAST('1912-08-30' AS DATE)
),
(
    '����� ��������'
   ,'Joseph Brodsky'
   ,CAST('1940-05-24' AS DATE)
),
(
    '������ �������'
   ,'Michelle Welbeck'
   ,CAST('1956-02-26' AS DATE)
),
(
    '����� ������ �������'
   ,'Henry Ryder Haggard'
   ,CAST('1856-06-22' AS DATE)
),
(
    '��������� �������'
   ,'Alexander Suvorov'
   ,CAST('1730-11-24' AS DATE)
),
(
    '��������� ��� ���'
   ,'Stanislav Jerzy Lets'
   ,CAST('1909-03-06' AS DATE)
),
(
    '������ ������'
   ,'Andrey Usachev'
   ,CAST('1958-07-05' AS DATE)
),
(
    '�������� ����������'
   ,'Svetlana Aleksievich'
   ,CAST('1948-05-31' AS DATE)
),
(
    '����� ���������'
   ,'Maria Nurovskaya'
   ,CAST('1944-03-03' AS DATE)
),
(
    '��������'
   ,'Virgil'
   ,null
),
(
    '���� �������'
   ,'John Milton'
   ,CAST('1608-12-19' AS DATE)
),
(
    '����� ��������'
   ,'Igor Huberman'
   ,CAST('1936-07-07' AS DATE)
),
(
    '������'
   ,'Sophocles'
   ,null
),
(
    '�������� ���������'
   ,'Vladimir Odoevsky'
   ,CAST('1804-08-11' AS DATE)
),
(
    '���� ����������'
   ,'Janusz Wisniewski'
   ,CAST('1954-08-18' AS DATE)
),
(
    '��������� ���������'
   ,'Alexander Zhitinsky'
   ,CAST('1941-01-19' AS DATE)
),
(
    '������ ������'
   ,'Michael Weller'
   ,CAST('1948-05-20' AS DATE)
),
(
    '������� ���������'
   ,'Arkady Averchenko'
   ,CAST('1880-03-27' AS DATE)
),
(
    '������ ������ ������'
   ,'George Gordon Byron'
   ,CAST('1788-01-22' AS DATE)
),
(
    '������� ������������'
   ,'Anthony Pogorelsky'
   ,null
),
(
    '�������� ������'
   ,'Petronius Referee'
   ,null
),
(
    '����� ����������'
   ,'Bella Akhmadulina'
   ,CAST('1937-04-10' AS DATE)
),
(
    '������ �����'
   ,'Paruyr Sevak'
   ,CAST('1924-01-24' AS DATE)
),
(
    '���� ���������'
   ,'Nina Berberova'
   ,CAST('1901-08-08' AS DATE)
),
(
    '����� ���������'
   ,'Soren Kierkegaard'
   ,CAST('1813-05-05' AS DATE)
),
(
    '��� �������'
   ,'Chuck Palahniuk'
   ,CAST('1962-02-21' AS DATE)
),
(
    '������ �����'
   ,'Andrey Bely'
   ,CAST('1880-10-26' AS DATE)
),
(
    '���� �����������'
   ,'Osip Mandelstam'
   ,CAST('1891-01-14' AS DATE)
),
(
    '������ �����'
   ,'Marina Vladi'
   ,CAST('1938-05-10' AS DATE)
),
(
    '������ �����'
   ,'Daniel Harms'
   ,CAST('1905-12-30' AS DATE)
),
(
    '�������� �������'
   ,'Elizabeth Gaskell'
   ,CAST('1810-09-29' AS DATE)
),
(
    '���� �����'
   ,'Peter Weil'
   ,CAST('1949-09-29' AS DATE)
),
(
    '��������� �����'
   ,'Alexander Genis'
   ,CAST('1953-02-11' AS DATE)
),
(
    '�������� ������'
   ,'Veronica Valley'
   ,CAST('1956-01-02' AS DATE)
),
(
    '������ �������'
   ,'Richard Mateson'
   ,CAST('1926-02-20' AS DATE)
),
(
    '������� ��������'
   ,'Yasunari Kawabata'
   ,CAST('1899-06-11' AS DATE)
),
(
    '�������� ���������'
   ,'Vladimir Tendryakov'
   ,CAST('1923-12-05' AS DATE)
),
(
    '�������� ������'
   ,'Monteiro Lobato'
   ,CAST('1882-04-18' AS DATE)
),
(
    '������� �������'
   ,'Vasily Aksenov'
   ,CAST('1932-08-20' AS DATE)
),
(
    '����� �� ������'
   ,'Charles de Coster'
   ,null
),
(
    '������ ���������'
   ,'Galina Shcherbakova'
   ,CAST('1932-05-10' AS DATE)
),
(
    '�������� �������'
   ,'Katarina Masetti'
   ,CAST('1944-04-29' AS DATE)
),
(
    '������� �����'
   ,'Andreas Eschbach'
   ,CAST('1959-09-15' AS DATE)
),
(
    '���� ������'
   ,'Jack Kerouac'
   ,CAST('1922-03-12' AS DATE)
),
(
    '�������'
   ,'Plutarch'
   ,null
),
(
    '��������� ����'
   ,'Virginia Woolf'
   ,CAST('1882-01-25' AS DATE)
),
(
    '������� ����������'
   ,'Dmitry Grigorovich'
   ,CAST('1822-03-31' AS DATE)
),
(
    '�������� �������'
   ,'Vladimir Sorokin'
   ,CAST('1955-08-07' AS DATE)
),
(
    '����� �������'
   ,'Fedor Sologub'
   ,CAST('1863-03-01' AS DATE)
),
(
    '����� ����������'
   ,'North Gansovsky'
   ,CAST('1918-12-15' AS DATE)
),
(
    '����� ����������'
   ,'Diana Setterfield'
   ,CAST('1964-08-22' AS DATE)
),
(
    '����� ������� �������'
   ,'Pale Granville Woodhouse'
   ,CAST('1881-10-15' AS DATE)
),
(
    '������� ���������'
   ,'Vasily Zhukovsky'
   ,CAST('1783-02-09' AS DATE)
),
(
    '����������� ���������'
   ,'Lanling mocker'
   ,null
),
(
    '����� ���'
   ,'Thomas More'
   ,CAST('1478-02-07' AS DATE)
),
(
    '������ ����'
   ,'Kenneth Graham'
   ,CAST('1859-03-08' AS DATE)
),
(
    '������� �����'
   ,'Natalya Shcherba'
   ,CAST('1981-11-16' AS DATE)
),
(
    '��������� ������'
   ,'Alexander Bushkov'
   ,CAST('1956-04-05' AS DATE)
),
(
    '������� �������'
   ,'Lyudmila Ulitskaya'
   ,CAST('1943-02-21' AS DATE)
),
(
    '���� �������'
   ,'Dino Buzzati'
   ,CAST('1906-10-16' AS DATE)
),
(
    '������ ��������'
   ,'Cormac McCarthy'
   ,CAST('1933-07-20' AS DATE)
),
(
    '��������� ��������'
   ,'Concordia Antarova'
   ,CAST('1886-04-25' AS DATE)
),
(
    '����� ����� ����'
   ,'Orson Scott Card'
   ,CAST('1951-08-24' AS DATE)
),
(
    '���� �����'
   ,'Denis Didro'
   ,CAST('1713-10-05' AS DATE)
),
(
    '���� ����������'
   ,'Yuri Nesterenko'
   ,CAST('1972-10-09' AS DATE)
),
(
    '�����'
   ,'Aeschylus'
   ,null
),
(
    '������ ����� ������'
   ,'Rainer Maria Rilke'
   ,CAST('1875-12-04' AS DATE)
),
(
    '������� �����'
   ,'Milorad Pavic'
   ,CAST('1929-10-15' AS DATE)
),
(
    '����������� �����'
   ,'Rabindranath Tagore'
   ,CAST('1861-05-07' AS DATE)
),
(
    '����� ���� ������'
   ,'Jorge Luis Borges'
   ,CAST('1899-08-24' AS DATE)
),
(
    '����� �������'
   ,'Peter Jacobsen'
   ,CAST('1847-04-07' AS DATE)
),
(
    '����� ������'
   ,'Boris Shergin'
   ,null
),
(
    '������ �������'
   ,'Victor Tochinov'
   ,null
),
(
    '���� ��������'
   ,'Yuri Trifonov'
   ,CAST('1925-08-28' AS DATE)
),
(
    '������� ��������'
   ,'Giacomo Casanova'
   ,CAST('1725-04-02' AS DATE)
),
(
    '���� ��'
   ,'Eugene Xu'
   ,CAST('1804-01-26' AS DATE)
),
(
    '������ ����'
   ,'Heinrich Mann'
   ,CAST('1871-03-27' AS DATE)
),
(
    '������� �����'
   ,'Dmitry Bykov'
   ,CAST('1967-12-20' AS DATE)
),
(
    '������ �����'
   ,'Jojo Moyes'
   ,CAST('1969-08-04' AS DATE)
),
(
    '���� �������'
   ,'Julia Drunina'
   ,CAST('1924-05-10' AS DATE)
),
(
    '��� ������ �������'
   ,'Earl Stanley Gardner'
   ,CAST('1889-07-17' AS DATE)
),
(
    '������ �������'
   ,'Leonid Kaganov'
   ,CAST('1972-05-21' AS DATE)
),
(
    '�������� �������'
   ,'Marietta Shaginyan'
   ,CAST('1888-04-02' AS DATE)
),
(
    '���� �����'
   ,'Mary Shelley'
   ,CAST('1797-08-30' AS DATE)
),
(
    '������ �������'
   ,'Daniil Andreev'
   ,null
),
(
    '��� ������'
   ,'Neil Gaiman'
   ,CAST('1960-11-10' AS DATE)
),
(
    '������ ������'
   ,'Truman Capote'
   ,CAST('1924-09-30' AS DATE)
),
(
    '��� ��� �����'
   ,'Jean Jacques Rousseau'
   ,CAST('1712-06-28' AS DATE)
),
(
    '���� �����'
   ,'Erich Fromm'
   ,CAST('1900-03-23' AS DATE)
),
(
    '������ �������'
   ,'Gustav Meyrink'
   ,CAST('1868-01-19' AS DATE)
),
(
    '���� ������'
   ,'Janusz Korczak'
   ,CAST('1878-07-22' AS DATE)
),
(
    '������ �����'
   ,'Marcus Z'
   ,CAST('1975-06-23' AS DATE)
),
(
    '����� ������'
   ,'Vadim Shefner'
   ,CAST('1915-01-12' AS DATE)
),
(
    '������ �������'
   ,'Tamara Kryukova'
   ,CAST('1953-10-14' AS DATE)
),
(
    '��� ����'
   ,'Ann rice'
   ,CAST('1941-10-04' AS DATE)
),
(
    '����� �������'
   ,'Helen Fielding'
   ,CAST('1958-02-19' AS DATE)
),
(
    '������ ��������'
   ,'Edmund Husserl'
   ,CAST(' 1859-04-08' AS DATE)
),
(
    '�������� �� �����'
   ,'Leonardo da Vinci'
   ,CAST('1452-04-15' AS DATE)
),
(
    '����� �������'
   ,'Timur Kibirov'
   ,CAST('1955-02-15' AS DATE)
),
(
    '������� �����'
   ,'Francis Bacon'
   ,CAST('1561-01-22' AS DATE)
),
(
    '����� ��'
   ,'Evelyn Waugh'
   ,CAST('1903-10-28' AS DATE)
),
(
    '������� ������'
   ,'Dmitry Gorchev'
   ,CAST('1963-09-27' AS DATE)
),
(
    '�������� �������'
   ,'Anatoly Aleksin'
   ,CAST('1924-08-03' AS DATE)
),
(
    '���� �����'
   ,'Oleg Divov'
   ,CAST('1968-10-03' AS DATE)
),
(
    '��� �������'
   ,'Ian McEwan'
   ,CAST('1948-06-21' AS DATE)
),
(
    '������ �������'
   ,'Andrey Belyanin'
   ,CAST('1967-01-24' AS DATE)
),
(
    '����� ����� ������'
   ,'Lucius Anney Seneca'
   ,null
),
(
    '���� ������'
   ,'Rene Descartes'
   ,CAST('1596-03-31' AS DATE)
),
(
    '������ ��������'
   ,'Herman Suderman'
   ,CAST('1857-09-30' AS DATE)
),
(
    '������ ������'
   ,'Charles Darwin'
   ,CAST('1809-02-12' AS DATE)
),
(
    '������ �����'
   ,'Henryk Ibsen'
   ,CAST('1828-03-20' AS DATE)
),
(
    '������ �����'
   ,'Lawrence Stern'
   ,CAST('1713-11-24' AS DATE)
),
(
    '����� �������'
   ,'Edgar Burroughs'
   ,CAST('1875-09-01' AS DATE)
),
(
    '������� �����'
   ,'Dmitry Artis'
   ,CAST('1973-07-14' AS DATE)
),
(
    '���� ����'
   ,'Sarah gio'
   ,CAST('1978-02-18' AS DATE)
),
(
    '��� �������'
   ,'Dick francis'
   ,CAST('1920-10-31' AS DATE)
),
(
    '����� ������ �����'
   ,'Mario Vargas Llosa'
   ,CAST('1936-03-28' AS DATE)
),
(
    '������ ������� �������'
   ,'Hunter Stockton Thompson'
   ,CAST('1937-07-18' AS DATE)
),
(
    '������� �����'
   ,'Nikolay Dubov'
   ,CAST('1910-11-04' AS DATE)
),
(
    '������� ����'
   ,'Michael Ende'
   ,CAST('1929-11-12' AS DATE)
),
(
    '����� �����'
   ,'Karel Capek'
   ,CAST('1890-01-09' AS DATE)
),
(
    '���� ����'
   ,'Mark Levy'
   ,CAST('1961-10-16' AS DATE)
),
(
    '����� �����'
   ,'Thomas Hobbes'
   ,CAST('1588-04-05' AS DATE)
),
(
    '�������� �������'
   ,'Bernhard Grzimek'
   ,CAST('1909-04-24' AS DATE)
),
(
    '������� �������'
   ,'Michael Grzimek'
   ,CAST('1934-04-12' AS DATE)
),
(
    '������ ������'
   ,'Samuel Beckett'
   ,CAST('1906-04-13' AS DATE)
),
(
    '������ ����������'
   ,'Sergey Lukyanenko'
   ,CAST('1968-04-11' AS DATE)
),
(
    '������ �������� �����'
   ,'Publius Cornelius Tacitus'
   ,null
),
(
    '��� ����'
   ,'Rick Yancy'
   ,CAST('1962-11-04' AS DATE)
)

PRINT 'zod.vDayBirth - ����� 2 - �������� ��������'
GO

PRINT '��������� zod.vCharacteristic ����� 20 - �������� 18 ����'
GO

INSERT INTO human.tCharacteristic
(
     ruName
    ,name
    ,birthDt
)
VALUES
(
 '���� ������'
,'Gaspard Abeille'
,null
),
('���������� ������� ���������'
,'Avalishvili George Ioannovich'
,null
),
('������������ ��������� ��������'
,'Axtelmeier'
,null
),
('���� �����'
,'Paul Aler'
,CAST('1656-11-09' AS DATE)
),
('�������� ������� ��������'
,'Altufiev Vasily Ivanovich'
,null
),
('���� и�'
,'Asai Ryoi'
,null
),
('����� ����� �����'
,'Jozef Igac Bajza'
,CAST('1755-03-05' AS DATE)
),
('������� ������'
,'Balanos Kozmas'
,null
),
('����� ������'
,'Antoine Banier'
,CAST('1673-11-02' AS DATE)
),
('������� ��������'
,'Giuseppe Marco Antonio Baretti'
,CAST('1719-04-24' AS DATE)
),
('����� ������'
,'Joshua Barnes'
,CAST('1654-01-10' AS DATE)
),
('������ ���-������� ��'
,'Jean-Francois de Bastide'
,CAST('1724-07-15' AS DATE)
),
('������� �����'
,'Ralph Bathurst'
,null
),
('������� ������� ��'
,'Nicolas de Beguelin'
,CAST('1714-06-25' AS DATE)
),
('�������-������� �������� ����� ���'
,'Karl Christian Ernst von Bentzel-Sternau'
,CAST('1767-04-09' AS DATE)
),
('������� ����'
,'Arnaud Berquin'
,CAST('1749-09-25' AS DATE)
),
('��������� ������'
,'Bessenyei Gyorgy'
,null
),
('�������� ������'
,'Bogdanov Andrey'
,null
),
('���������� ϸ�� Ը�������'
,'Bogdanovich Peter Fedorovich'
,null
),
('���� ������ ��������'
,'Boyer Heinrich Christian'
,CAST('1744-07-19' AS DATE)
),
('������� �����'
,'Brambach Johan'
,CAST('1744-07-19' AS DATE)
),
('����� ������ �������'
,'Charles Brockden Brown'
,CAST('1771-01-17' AS DATE)
),
('���� ����� (��������)'
,'Henry Brooke'
,null
),
('������ ��� ��'
,'Louis de Boissy'
,CAST('1694-11-26' AS DATE)
),
('�����-������ ���'
,'Ioan Budai-Deleanu'
,CAST('1760-01-06' AS DATE)
),
('���� ������'
,'Teodor Waga'
,null
),
('�������� ���-������ ���� ��'
,'Jean-Baptiste-Henri de Valincour'
,CAST('1653-03-01' AS DATE)
),
('����� �������� ������'
,'Weiss Christian Felix'
,CAST('1726-01-28' AS DATE)
),
('����������� ����'
,'Ivan Velikanovic'
,CAST('1723-08-07' AS DATE)
),
('���������-��������� ���� ��������'
,'Velyasheva-Volintseva Anna Ivanovna'
,null
),
('������ �������'
,'Georg Philipp Ludwig Leonard Wachter'
,CAST('1762-11-25' AS DATE)
),
('���������� ������ �����'
,'Johann Peter Willebrand'
,CAST('1719-09-10' AS DATE)
),
('������ ������� ������ ��������'
,'Vinand Staring Anthony Christian'
,CAST('1767-01-24' AS DATE)
),
('���� ������ �������'
,'Johann Rudolf Wyss'
,CAST('1782-03-04' AS DATE)
),
('���� ������ �����'
,'Johann David Wyss'
,CAST('1743-05-28' AS DATE)
),
('�������� ���� ���� �� ���� ��'
,'Claude-Henri de Fusee de Voisenon'
,CAST('1708-07-08' AS DATE)
),
('�������� ����'
,'Jozef Rufin Wybicki'
,CAST('1747-09-29' AS DATE)
),
('������������ ���� ���������'
,'Galenkovsky Yakov Andreevich'
,CAST('1777-10-17' AS DATE)
),
('����� ����� �����'
,'Josef Alois Gleich'
,CAST('1772-09-14' AS DATE)
),
('������ ������ (����)'
,'Richard Glover'
,null
),
('������� ������� ��������'
,'Golitsyn Alexey Ivanovich'
,CAST('1765-05-22' AS DATE)
),
('������ ������� ���������'
,'Friedrich Wilhelm Gotter'
,CAST('1746-09-03' AS DATE)
),
('�������� ������'
,'Filip Grabovac'
,null
),
('������������� ������'
,'Danibegashvili Raphael'
,null
),
('������� ���-������'
,'Descampes Jean-Baptiste'
,CAST('1714-08-28' AS DATE)
),
('�������� ������'
,'Pietro Giordani'
,CAST('1774-01-01' AS DATE)
),
('��������� ����'
,'Jippensya Ikku'
,null
),
('������ �����'
,'Charles Dibdin'
,CAST('1745-03-15' AS DATE)
),
('����������� ������� ��������'
,'Dmitrevsky Dmitry Ivanovich'
,null
),
('��������-������� Ը��� ��������'
,'Dmitriev-Mamonov Fedor Ivanovich'
,CAST('1727-02-12' AS DATE)
),
('���������� ��������� ��������'
,'Franciszek Ksawery Dmochowski'
,CAST('1762-12-02' AS DATE)
),
('���� �� �� ���� ��� ������'
,'Jean-Baptiste Dureau de La Malle'
,CAST('1742-11-27' AS DATE)
),
('��������� �������� ����������'
,'Engalychev Parfeny Nikolaevich'
,CAST('1769-02-10' AS DATE)
),
('��������� Ը���'
,'Zhurovsky Fedor'
,null
),
('�������� �������� ����������'
,'Zarutsky Afanasy Alekseevich'
,null
),
('����������� �������� ����������'
,'Zolotnitsky Vladimir Trofimovich'
,null
),
('�������� ����'
,'Jose Cadalso y Vazquez de Andrade'
,CAST('1741-10-08' AS DATE)
),
('����������� ��������'
,'Giuseppe Capecelatro'
,CAST('1744-09-25' AS DATE)
),
('����� ��������-��������'
,'Giovanni Rinaldo Carli (Carli-Rubbi)'
,CAST('1720-04-11' AS DATE)
),
('�������� ������ ��������'
,'Karmanov Diomid Ivanovich'
,null
),
('������� �������� ��������'
,'Kvadrio Frantsisk Ksaveriy'
,CAST('1695-12-01' AS DATE)
),
('��������� �������� ���������'
,'Kindleben Christian Wilhelm'
,CAST('1748-10-04' AS DATE)
),
('�������-�-������� ����'
,'Jose Clavijo y Fajardo'
,CAST('1726-05-19' AS DATE)
),
('���������� Ը��� ����������'
,'Kozlovsky Fedor Alekseevich'
,null
),
('����������� ������ ���������'
,'Kondratovich Kiryak Andreevich'
,null
),
('�������� ������� �� �����'
,'Coutinho Rodrigue de Souza'
,CAST('1755-08-04' AS DATE)
),
('����� �����-������ (�������)'
,'Koshen Charles-Nicolas (Younger)'
,CAST('1715-02-22' AS DATE)
),
('��������� ����� ������'
,'Kraevsky Michal Dimitar'
,CAST('1746-09-08' AS DATE)
),
('������� �� ������ ������ ��'
,'Gatien de Courtilz de Sandras'
,null
),
('������ ����'
,'Jan Cassel'
,null
),
('������� �����'
,'Lastrich Phillip'
,null
),
('������ �������� ������'
,'Christian Ludwig Liscow'
,CAST('1701-04-29' AS DATE)
),
('��������� ����� ����������'
,'Lobisevich Panas Kirillovich'
,null
),
('����� �������'
,'Lovro Shitovich'
,null
),
('������ �����-�������'
,'Charles Francois Lhomond'
,null
),
('���������� ������ (��������)'
,'Mihail Maksimovic'
,null
),
('������� ������� �� ���������'
,'Manuel Maria del Pilar Eduardo de Gorostiza y Cepeda'
,CAST('1789-10-13' AS DATE)
),
('��������� ������'
,'Marcin Matuszewicz'
,CAST('1714-11-11' AS DATE)
),
('����� ������ �����������'
,'Meyer Andrei Kazimirovich'
,null
),
('�������� ������� ����'
,'Juan Melendez Valdes'
,CAST('1754-03-11' AS DATE)
),
('����������� ����'
,'Lina Morgenstern'
,CAST('1830-11-25' AS DATE)
),
('����� ��� ����� ��'
,'Jean Testu de Mauroy'
,null
),
('������ ���������-����� ��'
,'Alexandre-Guillaume Mouslier de Moissy'
,null
),
('������ ���� ��������'
,'Naumov Ivan Mokeevich'
,null
),
('�������� ������'
,'Neseck Casper'
,CAST('1682-12-31' AS DATE)
),
('������ ������������'
,'Paisius Hilendarsky'
,null
),
('��� ����� ������'
,'Henry James Pye'
,CAST('1744-02-10' AS DATE)
),
('�������� �����������'
,'Patrician Aristovsky'
,null
),
('���� �����'
,'Thomas Pain'
,CAST('1737-01-29' AS DATE)
),
('ϸ������ ����-������'
,'Pollnitz Karl-Ludwig'
,CAST('1692-02-25' AS DATE)
),
('����� ����'
,'John Bennett Perry'
,CAST('1941-01-04' AS DATE)
),
('������ ����� �������'
,'Pilati Carlo Antonio'
,CAST('1733-12-28' AS DATE)
),
('��������� ������'
,'Piramovich Grzegorz'
,CAST('1735-11-25' AS DATE)
),
('�������� ��'
,'Pototskiy Yan'
,CAST('1761-03-08' AS DATE)
),
('��������-������� ������ ��������'
,'Prokudin-Gorsky Mikhail Ivanovich'
,null
),
('���������� ������� ����������'
,'Protopopov Vasily Mikhailovich'
,null
),
('������� ������ �����������'
,'Prutsky Matvey Evsigneevich'
,null
),
('����� ���� ����'
,'Rabek Knud Lune'
,CAST('1760-12-18' AS DATE)
),
('������ �������'
,'Francois Ragen'
,null
),
('������ ���� ����������'
,'Repev Ivan Nikolaevich'
,null
),
('��������� ���� �������������'
,'Rzhevusky Adam Stanislavovich'
,CAST('1760-08-21' AS DATE)
),
('�������� ���� �����������'
,'Rodzianko Semyon Emelyanovich'
,null
),
('������ ������ �������'
,'Rohlitz Johann Friedrich'
,CAST('1769-02-12' AS DATE)
),
('������� ���� ����� �������'
,'Roussel Pierre Joseph Alexis'
,null
),
('�������� �� ������'
,'Raymondo de Sangro'
,CAST('1710-01-30' AS DATE)
),
('������� �����'
,'Satan Isaac'
,null
),
('����� ��������'
,'Swift Jonathan'
,CAST('1667-11-30' AS DATE)
),
('������ (�����)'
,'Sergius (Yurshev)'
,null
),
('������� �����'
,'Shikitei Samba'
,null
),
('�������� ����������'
,'Sofroniy Vrachansky'
,CAST('1739-03-11' AS DATE)
),
('��������� ��������� ��������'
,'Sumarokov Alexander Petrovich'
,CAST('1717-11-25' AS DATE)
),
('������ ������ ����������'
,'Sushkov Mikhail Vasilievich'
,CAST('1792-06-26' AS DATE)
),
('��������� �������'
,'Tanbovtsev Vasily'
,null
),
('������ �����'
,'Tyndall Matthew'
,null
),
('����� ���������-��'
,'Tomsa Frantisek Jan'
,CAST('1753-10-04' AS DATE)
),
('������ ����������� ����� ��'
,'Diego de Torres Villarroel'
,CAST('1694-06-18' AS DATE)
),
('� �������'
,'Wu Jingzi'
,null
),
('������� ������ ����������'
,'William Williams Pantycelyn'
,CAST('1717-02-11' AS DATE)
),
('������� ����� �����'
,'Helen Maria Williams'
,CAST('1759-06-17' AS DATE)
),
('������������ ����'
,'Mary Wollstonecraft'
,CAST('1759-04-27' AS DATE)
),
('��������� ������'
,'William Warburton'
,CAST('1698-12-24' AS DATE)
),
('���� �������'
,'Ueda Akinari'
,CAST('1734-07-25' AS DATE)
),
('����� �������'
,'Kristof Frid Faber'
,null
),
('�������� Ը��� ������������'
,'Felkner Fedor Khristianovich'
,null
),
('������ ����������'
,'Feofan Trofimovich'
,null
),
('������� ���������'
,'Francois Lafermier'
,CAST('1737-02-11' AS DATE)
),
('��������� �� ��������'
,'Francoise de Graffigny'
,CAST('1695-02-11' AS DATE)
),
('���������� �����'
,'David Friedlander'
,CAST('1750-12-06' AS DATE)
),
('���� ����� (�������)'
,'Anton Fuchs'
,null
),
('������ ����� (��������)'
,'Thomas Fuller'
,CAST('1654-06-24' AS DATE)
),
('������� ����� �������'
,'Heyberg Peter Andreas'
,CAST('1758-11-16' AS DATE)
),
('������ ������'
,'Hiraga Gennai'
,null
),
('��������� ��������'
,'Benedykt Joachim Chmielowski'
,CAST('1700-03-20' AS DATE)
),
('��� �������'
,'Cao Zhan'
,null
),
('�������� �������'
,'Tsikindyal Dmitry'
,null
),
('�������� ������� ��������'
,'Tsitsianov Dmitriy Pavlovich'
,null
),
('�������� ���� ��������'
,'Tsitsianov Egor Pavlovich'
,null
),
('������� ������'
,'Charlton Walter'
,CAST('1619-02-02' AS DATE)
),
('���� �����'
,'George Cheyne'
,null
),
('�������� ������� ����������'
,'Chenykaev Alexey Mikhailovich'
,null
),
('����� ϸ�� Ը�������'
,'Chizhov Peter Fedorovich'
,null
),
('����� ������� ��'
,'Gregoire Robert Challe'
,CAST('1659-08-17' AS DATE)
),
('����� ������ ������ �� ������'
,'Charles Michel Marquis de Villette'
,CAST('1736-12-04' AS DATE)
),
('�������� ���-������ ��'
,'Jean-Baptiste de Chevremont'
,null
),
('����� ��� ��'
,'Louis de Chenier'
,CAST('1722-06-08' AS DATE)
),
('����������� �������� ��������'
,'Brigitta Kristina Scherzenfeldt'
,null
),
('������ �����'
,'Thomas Sherlock'
,null
),
('������� ������ ������'
,'Schlegel Johann Adolf'
,CAST('1721-09-17' AS DATE)
),
('���������� ������ ������ ������ ������ �������� ���'
,'Ulrich Hermann Heinrich Gustav Freiherr von Schlippenbach'
,CAST('1774-05-18' AS DATE)
),
('����� �������'
,'Speer Daniel'
,null
),
('����� ������ ������ ���'
,'Stark Johann August fon'
,null
),
('����� ������� ������ ���������'
,'Joachim Christoph Friedrich Schulz'
,CAST('1762-01-01' AS DATE)
),
('����� ������� ����������'
,'Shutov Gavriil Sofronovich'
,null
),
('���������� ������� ��������'
,'Shchedritsky Alexey Ivanovich'
,null
),
('������� �������� ����������'
,'Shchekatov Afanasy Mikhailovich'
,null
),
('������ ��������'
,'Johannes Ewald'
,CAST('1743-11-18' AS DATE)
),
('����� ����'
,'John Aikin'
,CAST('1747-01-05' AS DATE)
),
('����������� ���� ������'
,'Karl August Engelhardt'
,CAST('1768-02-04' AS DATE)
),
('��� ����� ��� �������'
,'Charles-Jean-Francois Henault '
,CAST('1685-02-08' AS DATE)
),
('����� ���� ������'
,'Ersan Marc Antoine'
,CAST('1649-01-31' AS DATE)
),
('�������� ������ ������'
,'Johann Joachim Eschenburg'
,CAST('1743-12-07' AS DATE)
),
('����� ������ �������'
,'Johann Friedrich Junger'
,CAST('1756-02-15' AS DATE)
),
('���� ����'
,'Yusuf Nabi'
,null
),
('��������� ������� ���������'
,'Yagelsky Kassian Iosifovich'
,null
),
('�������� ������'
,'Yambreshich Andrey'
,CAST('1706-09-20' AS DATE)
),
('����� ������ ����� ���'
,'Heinrich Johann von Jannau'
,CAST('1753-03-09' AS DATE)
)
GO

PRINT '�������� human.v�haracteristic ����� 20 - �������� 18 ���� �������� '
GO

PRINT '��������� �������� human.v�haracteristic ����� 19 - �������� 17 ����'
GO

INSERT INTO human.tCharacteristic
(
    ruName
   ,name
   ,birthDt
)
VALUES
(
    '���� ������'
   ,'Bernard Shaw'
   ,CAST('1856-07-26' AS DATE)
),
(
    '������ ������'
   ,'Agapius Landos'
   ,null
)




������ ������
Agapius Landos
null

������������ ��������� ��������
Axtelmeier
null

���� �����
Paul Aler
9 ������ 1656

����� �������������� �������� ��
Fernando de Navas de Peraleda y Alva Cortes Ixtlilxochitl
null

�������� ���������
Francesco Angeloni
null

������� (����������)
Anthony (Podolsky)
null

����� ����
Ivan Ancic Dumljanin
11 ������� 1624

����� ������
Robert Armin
null

���� и�
Asai Ryoi
null

������ ����� ��
Pedro Agerre Azpilkueta
null

����� ������
Antoine Banier
2 ������ 1673

������ ����
John Bunyan
null

����� �� ������ �������� �������
Gabrielle-Suzanne Barbot de Villeneuve
null

����� ������
Joshua Barnes
10 ������ 1654

������� ������� �������
Antonio Barbosa Bacelar
null

������� �����
Ralph Bathurst
null

�������� �����
Marta Berendes
21 ������ 1639

�������� �� �������
Francois Beroalde de Verville
15 ������ 1556

���������� ������
Marcin Blazowski
null

������� �����
Pjeter Bogdani
null

������ ��������
Giovanni Botero
null

����� ����� (��������)
Thomas Browne
19 ������� 1605

������ �������
Nicholas Breton
null

���� ����-��������
Fulke-Greville Brooke
3 ������� 1554

����� ������
Nicolas Boileau
1 ������ 1636

������ ���� ��
Pierre de Boissat
null

���������� ����
Marek Bydzovsky z Florentyna
null

����� ���
Francis Bacon
null

�������� ���-������ ���� ��
Jean-Baptiste-Henri de Valincour
1 ����� 1653

������ ������� ��������
Bernardo Vieira Ravasco
null

�������� ������
Vincenzo Carafa
5 ��� 1585

��������� ������
Andrzej Wiszowaty
26 ������ 1608

������ ���� ��� ���
Joost van den Vondel
17 ������ 1587

�������� ����
Juraj Habdelic
27 ������ 1609

��������� ����
Iacob Gawatthowic
17 ����� 1598

��� �� ������� ���-���
Jean-Louis Guez de Balzac
31 ��� 1597

������� �����
Erazm Gliczner Skrzetuski Glicner
null

���� ������
Antoine Godeau
24 �������� 1605

���������� ����� ����� ��
Marin Le Roy de Gomberville
null

��� ��� ������� ���� �� �����
Jean-Francois Paul de Gondi
20 �������� 1613

��������� �����
Lukasz Gornicki
null

�����-����� ������
Philippe Goibaud-Dubois
3 ���� 1626

����� ���� 4-� ����� ����
Dudley North 4th Baron North
null

�������� �������
Daniello Bartoli
12 ������� 1608

��������� ������ ��������
Johanna Eleonora De la Gardie
26 ���� 1661

������������ ������
Wojciech Debocecki
null

������������� ������
Waclaw Dyamentowski
null

�������� �����
Matija Divkovi
21 ������� 1563

������ �����
Jiri Dikastus Mirkovsky
null

����� �����
Andre Duchesne
null

����������� Ը��� ����������
Evlashovsky Fyodor Mikhailovich
7 ������� 1546

��������� �������
Kazimierz Rogala Zawadzki
null

����� �������
John Milyutin
null

����� �������
Ihara Saikaku
null

���������� ������
Felix Kadlinsky
18 ������� 1613

������� ������ ������
Capaccio Giulio Cesare
null

�������� ������� ���� �� �� ����
Carrillo Alfons Lazo de la Vega
null

������� ������
Giulio Caccini ��� Giulio Romano
8 ������� 1551

���������� ��������
Sertorio Quattromani
null

������ ��������� ��
Francisco de Quevedo
17 �������� 1580

������ �����
Janos Kemeny
14 ������� 1607

������ ����������
Cleric of Ostrog
null

������ �����
Guillaume Colletet
12 ����� 1598

������ ��������
Valentin Conrart
null

��������� ���������
Kochovsky Vespasian
null

���������� ��
Jan Andrzej Krasinski
null

����� ������ ������
Giulio Cesare Croce
null

������� ������
Quirinus Kuhlmann
25 ������� 1651

������� �� ������ ������ ��
Gatien de Courtilz de Sandras
null

����� ���� �� ��
Juan de la Cueva de Garoza
23 ������� 1543

�������� ���������
Gabriello Chiabrera
18 ���� 1552

�� ���������� �����
Gautier de Costes de La Calprenede
null

�� ������ ��� ��
Jean de La Chapelle
24 ������� 1651

�������� ��� ��
Jean de La Bruyere
16 ������� 1645

������� ���� ������ ��
Marie-Madeleine Pioche de La Vergne
18 ����� 1634

�� �� (���������)
Li Yu (playwright)
null

������ ���
Justus Lipsius
18 ������� 1547

���� ��������� ��������
Francisco Rodrigues Lobo
null

����� �� ��������� �����
Diego Lopez de Cogolludo
null

�������� �������
Ludovico Zacconi
11 ���� 1555

������ ������
Anthony Munday
null

��������� ��������
Lucrezia Marinella
null

������ ������������
Marino giambattista
14 ������� 1569

����� �������� ��
Matos Gregoriu de
23 ������� 1636

������� ��������� ��������
Mezenets Alexander Ivanovich
null

���� ��������� ������ ��
Melus Francisco Manuel de
23 ������ 1608

������� ����
John Milton
19 ������� 1608

������� ������
Miyamoto Musashi
null

�������� �� ������ ���� ��
Nicolas Pierre Henri de Montfaucon
null

����� ��� ����� ��
Jean Testu de Mauroy
null

������� �������
Hieronim Morsztyn
null

������ ����
Janos Nadasi
13 ������ 1613

�������� ������ �������
Filip Kazimierz Obuchowicz
null

����� �������� �����
Giovanni Paolo Oliva
4 ������� 1600

����� � ����
Marie-Catherine d Aulnoy
14 ������ 1651

������ ��������
Geronimo Pallas
null

���������� �������� ������
Hortensio Felix Paravicino y Arteaga
12 ������� 1580

�������� ������
Joachim Pastorius
20 �������� 1611

�������� ���� ����������� ���� �� ����� ����
Juan de Santa Cruz Pachacuti Yamqui Salcamayhua
null

�������� ����
Paul Pellisson
30 ������� 1624

����� �� ��� �����
Gines Perez de Hita
null

������ �������
Francois Raguenet
null

����� �������
Antonio Rocco
null

���� ���������
Alexander Ross
1 ������ 1591

���������� ����
Mary White
null

����� �������� ��������� ��
Francisco de Rojas Zorrilla
4 ������� 1607

�������� �����
Diego de Saavedra y Faxardo
6 ��� 1584

���� ��� ��
Louis de Sacy
null

����� ��������
Jonathan Swift
30 ������ 1667

����� ��� ����� ��
Jean Regnault de Segrais
22 ������� 1624

��������� ����
Sedovsky Yakov
null

������� �� ������� �����
Cerdany de Tallada Thomas
null

����� �����
Fray Pedro Simon
null

������ ϸ��
Piotr Skarga
2 ������� 1536

������� ���� ��
Georges de Scudery
22 ������� 1601

������� ������ ��
Madeleine de Scudery
15 ������ 1607

���� ���� (�������)
John Smith
null

������ �����
Charles Sorel sieur de Souvigny
null

�������� �������
Tommaso Stigliani
null

��� ����
Xu Xiake
5 ������ 1587

������� ����������
Alessandro Tassoni
28 �������� 1565

����������� ������
Twardowski Samuel
null

������ ������� (��������)
Jeremy Taylor
15 ������� 1613

������ ���� (����)
John Taylor
24 ������� 1578

������ �����
Matthew Tindal
null

����� ��������
Tirso Gonzalez
18 ������ 1624

������ ������� ������
Ursula Micaela Morata
21 ������� 1628

������ 
Owen Feltham
null

�������� �������
Teodozy Borowik
null

��������� ��������� �����
Lucas Fernandez de Piedrahita
null

��������� ������ �� ����� ��
Bernard le Bovier de Fontenelle
11 ������� 1657

������ ����� (��������)
Thomas Fuller
24 ���� 1654

��� ������
Feng Menglong
null

�������� ������
Antoine Furetiere
28 ������� 1619

������� ������
Richard Hakluyt
null

�������� ������� ���������
Khaletsky Nicholas Christopher
null

�������� ����� ���
Hemskerk Johan Van
null

������� ������
Walter Charleton
2 ������� 1619

����� ������� ��
Gregoire Robert Challe
17 ������� 1659

������ ���
Jean Chapelain
4 ������� 1595

�������� ���-������ ��
Jean-Baptiste de Chevremont
null

������� �����
Thomas Shadwell
null

����� �������
Daniel Speer
null

�������� �����
Georg Stengel
null

����� ���� ������
Marc-Antoine Hersan
31 ������ 1649

���� ����
Yusuf Nabi
null

PRINT '�������� zod.vDayBirth ����� 19 - �������� 17 ���� �������� '
GO


PRINT '��������� �������� human.tDay'
GO

INSERT INTO human.tDay
(
     id
    ,centuryId
)
SELECT DISTINCT
     chr.birthDt
    ,CASE
         WHEN chr.birthDt BETWEEN '1900-01-01' AND '2020-01-01' THEN 20 /*20-�� ��� � ������ 21-���*/
         WHEN chr.birthDt BETWEEN '1800-01-01' AND '1899-12-31' THEN 19 /*19-�� ���*/
         WHEN chr.birthDt BETWEEN '1700-01-01' AND '1799-12-31' THEN 18 /*18-�� ���*/
         WHEN chr.birthDt BETWEEN '1600-01-01' AND '1699-12-31' THEN 17 /*17-�� ���*/
         WHEN chr.birthDt BETWEEN '1500-01-01' AND '1599-12-31' THEN 16 /*16-�� ���*/
         WHEN chr.birthDt BETWEEN '1400-01-01' AND '1499-12-31' THEN 15 /*15-�� ���*/
         WHEN chr.birthDt BETWEEN '1300-01-01' AND '1399-12-31' THEN 14 /*14-�� ���*/
         WHEN chr.birthDt BETWEEN '1200-01-01' AND '1299-12-31' THEN 13 /*13-�� ���*/
         WHEN chr.birthDt BETWEEN '1100-01-01' AND '1199-12-31' THEN 12 /*12-�� ���*/
         WHEN chr.birthDt BETWEEN '1000-01-01' AND '1099-12-31' THEN 11 /*11-�� ���*/
         WHEN chr.birthDt BETWEEN '0900-01-01' AND '0999-12-31' THEN 10 /*10-�� ���*/
         WHEN chr.birthDt BETWEEN '0800-01-01' AND '0899-12-31' THEN 9  /*9-�� ���*/
         WHEN chr.birthDt BETWEEN '0700-01-01' AND '0799-12-31' THEN 8  /*8-�� ���*/
         WHEN chr.birthDt BETWEEN '0600-01-01' AND '0699-12-31' THEN 7  /*7-�� ���*/
         WHEN chr.birthDt BETWEEN '0500-01-01' AND '0599-12-31' THEN 6  /*6-�� ���*/
         WHEN chr.birthDt BETWEEN '0400-01-01' AND '0499-12-31' THEN 5  /*5-�� ���*/
         WHEN chr.birthDt BETWEEN '0300-01-01' AND '0399-12-31' THEN 4  /*4-�� ���*/
         WHEN chr.birthDt BETWEEN '0200-01-01' AND '0299-12-31' THEN 3  /*3-�� ���*/
         WHEN chr.birthDt BETWEEN '0100-01-01' AND '0199-12-31' THEN 2  /*2-�� ���*/
         WHEN chr.birthDt BETWEEN '0001-01-01' AND '0099-12-31' THEN 1/*1-�� ���*/
    END AS centuryId
FROM human.v�haracteristic AS chr
WHERE 1 = 1
    AND chr.birthDt IS NOT NULL

PRINT '�������� human.vDay ��������'
GO

PRINT '������ - ����� ���������� �� ���������'
GO

SELECT
     elm.name
    ,sng.humanCnt
FROM (
    SELECT
         sng.elementId
        ,COUNT(1) AS humanCnt
    FROM zod.vHumanElement AS sng
    GROUP BY
        sng.elementId
) AS sng
INNER JOIN dic.vZodiacElement AS elm
    ON 1 = 1
    AND elm.id = sng.elementId
ORDER BY sng.humanCnt
GO

PRINT '������ - ���������� �� ��������� - ����������� �� ����'
GO

SELECT
     CAST(sng.centuryId AS NVARCHAR(3)) + ' ���' AS centuryName
    ,elm.name
    ,sng.humanCnt
FROM (
    SELECT
         hday.centuryId
        ,sng.elementId
        ,COUNT(1) AS humanCnt
    FROM human.v�haracteristic AS chc
    INNER JOIN zod.vHumanElement AS sng
        ON 1 = 1
        AND sng.humId = chc.id
    INNER JOIN human.vDay AS hday
        ON 1 = 1
        AND hday.id = chc.birthDt
    GROUP BY
         hday.centuryId
        ,sng.elementId
) AS sng
INNER JOIN dic.vZodiacElement AS elm
    ON 1 = 1
    AND elm.id = sng.elementId
ORDER BY 1, sng.humanCnt
GO

PRINT '������ - ����� ���������� �� ��������'
GO

SELECT
     zic.name
	,sgn.zodCnt
FROM
(
    SELECT
         sgn.zodId
        ,COUNT(1) AS zodCnt
    FROM zod.vHumanZodiac AS sgn
	GROUP BY
	    sgn.zodId
) AS sgn
INNER JOIN dic.vZodiac AS zic
    ON 1 = 1
    AND zic.id = sgn.zodId
ORDER BY sgn.zodCnt;

PRINT '������ - ���������� �� �������� �� �����'
GO

SELECT
     centuryId
    ,zic.name
	,sgn.zodCnt
FROM
(
    SELECT
         hday.centuryId
        ,sgn.zodId
        ,COUNT(1) AS zodCnt
    FROM human.v�haracteristic AS chc
    INNER JOIN zod.vHumanZodiac AS sgn
    ON 1 = 1
        AND sgn.humId = chc.id
    INNER JOIN human.vDay AS hday
    ON 1 = 1
        AND hday.id = chc.birthDt
	GROUP BY
        hday.centuryId
	   ,sgn.zodId
) AS sgn
INNER JOIN dic.vZodiac AS zic
    ON 1 = 1
    AND zic.id = sgn.zodId
ORDER BY centuryId, sgn.zodCnt;

--SELECT * FROM human.v�haracteristic
--WHERE birthDt IS NOT NULL
