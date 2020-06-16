PRINT 'ANNA - система для не серьезного анализа'
GO

USE ANNA
GO

PRINT 'human - hum - подсистема, отвечающая за основные данные по человеческим персонам (дата рождения человека, разные сферы жизни человека)'
GO

PRINT 'human.tProfession - источник с основными типами профессий (также могут быть призвания и какая-либо обобщающая характеристика)'
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
    'Писатель'
)
GO

PRINT 'human.tProfession - источник наполнен'
GO

PRINT 'human.vCharacteristic - источник с днями рождениями человека и дополнительной информацией'
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
FROM human.tСharacteristic AS dab
GO

PRINT 'human.vDay - источник дополнительной информацией по датам событий жизни человека'
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

PRINT 'dictionary - dic - подсистема, отвечающая за различные справочные данные'
GO

PRINT 'Источник dic.vZodiac - справочник по Зодиакам'
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
    /*Овен 1 знак - 21 марта — 20 апреля*/
    'Овен'
),
(
    /*Телец 2 знак - 21 апреля — 21 мая*/
    'Телец'
),
(
    /*Близнецы 3 знак - 22 мая — 21 июня*/
    'Близнецы'
),
(
    /*Рак 4 знак - 22 июня — 22 июля*/
    'Рак'
),
(
    /*Лев 5 знак - 23 июля — 21 августа*/
    'Лев'
),
(
    /*Дева 6 знак - 22 августа — 23 сентября*/
    'Дева'
),
(
     /*Весы 7 знак - 24 сентября — 23 октября*/
    'Весы'
),
(
    /*Скорпион 8 знак - 24 октября — 22 ноября*/
    'Скорпион'
),
(
    /*Стрелец 9 знак - 23 ноября — 22 декабря*/
    'Стрелец'
),
(
    /*Козерог 10 знак 23 декабря по 20 января*/
    'Козерог'
),
(
    /*Водолей 11 знак - 21 января — 19 февраля*/
    'Водолей'
),
(
    /*Рыбы 12 знак - 20 февраля — 20 марта*/
    'Рыбы'
)
GO

PRINT 'Источник dic.vZodiac наполнен'
GO

PRINT 'Источник dic.vZodiacElement - справочник по стихиям зодиаков'
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
    /*Огонь (Овен, Лев, Стрелец)*/
    'Огонь'
),
(
    /*Земля (Телец, Дева, Козерог)*/
    'Земля'
),
(
    /*Воздух (Близнецы, Весы, Водолей)*/
    'Воздух'
),
(
    /*Вода (Рак, Скорпион, Рыбы)*/
    'Вода'
)
GO

PRINT 'Источник dic.vElement наполнен'
GO

PRINT 'zodiac - zod - подсистема, отвечающая за не серьезный анализ связи дня рождения человека и разных сфер жизни человека'
GO

PRINT 'zod.vHumanZodiac - источник с зодиаками человека'
GO

CREATE OR ALTER VIEW zod.vHumanZodiac
AS
SELECT
    dab.humId
   ,CASE
        /*Козерог 10 знак 23 декабря по 20 января*/
        WHEN dab.monthNum = 12 AND dab.dayMonthNum BETWEEN 23 AND 31
		THEN 10
		WHEN dab.monthNum = 1 AND dab.dayMonthNum BETWEEN 1 AND 20
		THEN 10
		/*Водолей 11 знак - 21 января — 19 февраля*/
		WHEN dab.monthNum = 1 AND dab.dayMonthNum BETWEEN 21 AND 31
		THEN 11
		WHEN dab.monthNum = 2 AND dab.dayMonthNum BETWEEN 1 AND 19
		THEN 11
		/*Рыбы 12 знак - 20 февраля — 20 марта*/
		WHEN dab.monthNum = 2 AND dab.dayMonthNum BETWEEN 20 AND 29
		THEN 12
		WHEN dab.monthNum = 3 AND dab.dayMonthNum BETWEEN 1 AND 20
		THEN 12
		/*Овен 1 знак - 21 марта — 20 апреля*/
		WHEN dab.monthNum = 3 AND dab.dayMonthNum BETWEEN 21 AND 31
		THEN 1
		WHEN dab.monthNum = 4 AND dayMonthNum BETWEEN 1 AND 20
		THEN 1
		/*Телец 2 знак - 21 апреля — 21 мая*/
		WHEN dab.monthNum = 4 AND dab.dayMonthNum BETWEEN 21 AND 30
		THEN 2
		WHEN dab.monthNum = 5 AND dab.dayMonthNum BETWEEN 1 AND 21
		THEN 2
		/*Близнецы 3 знак - 22 мая — 21 июня*/
		WHEN dab.monthNum = 5 AND dab.dayMonthNum BETWEEN 22 AND 31
		THEN 3
		WHEN dab.monthNum = 6 AND dab.dayMonthNum BETWEEN 1 AND 21
		THEN 3
		/*Рак 4 знак - 22 июня — 22 июля*/
		WHEN dab.monthNum = 6 AND dab.dayMonthNum BETWEEN 22 AND 30
		THEN 4
		WHEN dab.monthNum = 7 AND dab.dayMonthNum BETWEEN 1 AND 22
		THEN 4
		/*Лев 5 знак - 23 июля — 21 августа*/
		WHEN dab.monthNum = 7 AND dab.dayMonthNum BETWEEN 23 AND 31
		THEN 5
		WHEN dab.monthNum = 8 AND dab.dayMonthNum BETWEEN 1 AND 21
		THEN 5
		/*Дева 6 знак - 22 августа — 23 сентября*/
		WHEN dab.monthNum = 8 AND dab.dayMonthNum BETWEEN 22 AND 31
		THEN 6
		WHEN dab.monthNum = 9 AND dab.dayMonthNum BETWEEN 1 AND 23
		THEN 6
		/*Весы 7 знак - 24 сентября — 23 октября*/
		WHEN dab.monthNum = 9 AND dab.dayMonthNum BETWEEN 24 AND 30
		THEN 7
		WHEN dab.monthNum = 10 AND dab.dayMonthNum BETWEEN 1 AND 23
		THEN 7
		/*Скорпион 8 знак - 24 октября — 22 ноября*/
		WHEN dab.monthNum = 10 AND dab.dayMonthNum BETWEEN 24 AND 31
		THEN 8
		WHEN dab.monthNum = 11 AND dab.dayMonthNum BETWEEN 1 AND 22
		THEN 8
		/*Стрелец 9 знак - 23 ноября — 22 декабря*/
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

PRINT 'zod.vHumanElement - источник со стихиями человека'
GO

CREATE OR ALTER VIEW zod.vHumanElement
AS
SELECT
    sng.humId
   ,CASE
      WHEN sng.zodId IN (1, 5, 9)
	  THEN 1 /*огненный (горячий и сухой)*/
	  WHEN sng.zodId IN (2, 6, 10)
	  THEN 2 /*земной (холодный и сухой)*/
	  WHEN sng.zodId IN (3, 7, 11)
	  THEN 3 /*воздушный (горячий и влажный)*/
	  WHEN sng.zodId IN (4, 8, 12)
	  THEN 4 /*водный (холодный и влажный)*/
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

PRINT 'zod.vDayBirth - часть 1 - источник наполнен'
GO

INSERT INTO human.tCharacteristic
(
    ruName
   ,name
   ,birthDt
)
VALUES
(
    'Денис Фонвизин'
   ,'Denis Fonvizin'
   ,CAST('1745-04-14' AS DATE)
),
(
    'Анатолий Иванов'
   ,'Anatoly Ivanov'
   ,CAST('1928-05-05' AS DATE)
),
(
    'Юрий Бондарев'
   ,'Yuri Bondarev'
   ,CAST('1924-03-15' AS DATE)
),
(
    'Софья Радзиевская'
   ,'Sophia Radzievskaya'
   ,CAST(' 1892-06-12' AS DATE)
),
(
    'Варлам Шаламов'
   ,'Varlam Shalamov'
   ,CAST('1907-06-18' AS DATE)
),
(
    'Владимир Гиляровский'
   ,'Vladimir Gilyarovsky'
   ,CAST('1855-12-08' AS DATE)
),
(
    'Джером К. Джером'
   ,'Jerome K. Jerome'
   ,CAST('1859-05-02' AS DATE)
),
(
    'Дмитрий Фурманов'
   ,'Dmitry Furmanov'
   ,CAST('1891-11-07' AS DATE)
),
(
    'Константин Седых'
   ,'Konstantin Sedykh'
   ,CAST('1908-01-21' AS DATE)
),
(
    'Джон Фаулз'
   ,'John Fowles'
   ,CAST('1926-03-31' AS DATE)
),
(
    'Фазиль Искандер'
   ,'Fazil Iskander'
   ,CAST('1929-03-06' AS DATE)
),
(
    'Пер Вале'
   ,'Per Valais'
   ,CAST('1926-08-05' AS DATE)
),
(
    'Май Шевалль'
   ,'May Chevalley'
   ,CAST('1935-09-25' AS DATE)
),
(
    'Александр Степанов'
   ,'Alexander Stepanov'
   ,CAST('1892-02-02' AS DATE)
),
(
    'Николай Чернышевский'
   ,'Nikolay Chernyshevsky'
   ,CAST('1828-07-24' AS DATE)
),
(
    'Алан Александр Милн'
   ,'Alan Alexander Milne'
   ,CAST('1882-01-18' AS DATE)
),
(
    'Кобо Абэ'
   ,'Kobo Abe'
   ,CAST('1924-03-07' AS DATE)
),
(
    'Томас Майн Рид'
   ,'Thomas Mine Reed'
   ,CAST('1818-04-04' AS DATE)
),
(
    'Джеймс Фенимор Купер'
   ,'James Fenimore Cooper'
   ,CAST('1789-09-15' AS DATE)
),
(
    'Марсель Пруст'
   ,'Marcel Proust'
   ,CAST('1871-07-10' AS DATE)
),
(
    'Эмили Бронте'
   ,'Emily Bronte'
   ,CAST('1818-07-30' AS DATE)
),
(
    'Ричард Бах'
   ,'Richard Bach'
   ,CAST('1936-06-23' AS DATE)
),
(
    'Марина Цветаева'
   ,'Marina Tsvetaeva'
   ,CAST('1892-10-08' AS DATE)
),
(
    'Колин Маккалоу'
   ,'Colin McCullough'
   ,CAST('1937-06-01' AS DATE)
),
(
    'Леонид Андреев'
   ,'Leonid Andreev'
   ,CAST('1871-08-21' AS DATE)
),
(
    'Сомерсет Моэм'
   ,'Somerset Maugham'
   ,CAST('1874-01-25' AS DATE)
),
(
    'Виктор Пелевин'
   ,'Victor Pelevin'
   ,CAST('1962-11-22' AS DATE)
),
(
    'Жорж Сименон'
   ,'Georges Simenon'
   ,CAST('1903-02-13' AS DATE)
),
(
    'Альберт Лиханов'
   ,'Albert Likhanov'
   ,CAST('1935-09-13' AS DATE)
),
(
    'Джон Стейнбек'
   ,'John Steinbeck'
   ,CAST('1902-02-27' AS DATE)
),
(
    'Дэниел Киз'
   ,'Daniel Keyes'
   ,CAST('1927-08-09' AS DATE)
),
(
    'Мария Семенова'
   ,'Maria Semenova'
   ,CAST('1958-11-01' AS DATE)
),
(
    'Николай Кун'
   ,'Nikolay Kun'
   ,CAST('1877-05-21' AS DATE)
),
(
    'Этель Лилиан Войнич'
   ,'Ethel Lilian Voynich'
   ,CAST('1864-05-11' AS DATE)
),
(
    'Омар Хайям'
   ,'Omar Khayyam'
   ,CAST('1048-05-18' AS DATE)
),
(
    'Эдгар По'
   ,'Edgar Allan Poe'
   ,CAST('1809-01-19' AS DATE)
),
(
    'Стефан Цвейг'
   ,'Stefan Zweig'
   ,CAST('1881-11-28' AS DATE)
),
(
    'Владислав Крапивин'
   ,'Vladislav Krapivin'
   ,CAST('1938-10-14' AS DATE)
),
(
    'Владимир Сутеев'
   ,'Vladimir Suteev'
   ,CAST('1903-07-05' AS DATE)
),
(
    'Бернард Шоу'
   ,'Bernard Show'
   ,CAST('1856-07-26' AS DATE)
),
(
    'Леонид Соловьёв'
   ,'Leonid Solovyov'
   ,CAST('1957-01-02' AS DATE)
),
(
    'Дуглас Адамс'
   ,'Douglas Adams'
   ,CAST('1952-03-11' AS DATE)
),
(
    'Евгений Гришковец'
   ,'Evgeny Grishkovets'
   ,CAST('1967-02-17' AS DATE)
),
(
    'Джеймс Хедли Чейз'
   ,'James Headley Chase'
   ,CAST('1906-12-24' AS DATE)
),
(
    'Владимир Маяковский'
   ,'Vladimir Mayakovsky'
   ,CAST('1893-07-19' AS DATE)
),
(
    'Джон Голсуорси'
   ,'John Galsworthy'
   ,CAST('1867-08-14' AS DATE)
),
(
    'Михаил Зощенко'
   ,'Mikhail Zoshchenko'
   ,CAST('1894-08-09' AS DATE)
),
(
    'Вячеслав Шишков'
   ,'Vyacheslav Shishkov'
   ,CAST('1873-10-03' AS DATE)
),
(
    'Евгений Евтушенко'
   ,'Evgeny Evtushenko'
   ,CAST('1932-07-18' AS DATE)
),
(
    'Василий Ян'
   ,'Vasily Yan'
   ,CAST('1875-01-04' AS DATE)
),
(
    'Харпер Ли'
   ,'Harper lee'
   ,CAST('1926-04-28' AS DATE)
),
(
    'Эрнест Сетон-Томпсон'
   ,'Ernest Seton-Thompson'
   ,CAST('1860-08-14' AS DATE)
),
(
    'Альбер Камю'
   ,'Albert Camus'
   ,CAST('1913-11-07' AS DATE)
),
(
    'Андрей Платонов'
   ,'Andrey Platonov'
   ,CAST('1899-08-28' AS DATE)
),
(
    'Александр Фадеев'
   ,'Alexander Fadeev'
   ,CAST('1901-12-24' AS DATE)
),
(
    'Стивен Кинг'
   ,'Stephen king'
   ,CAST('1947-09-21' AS DATE)
),
(
    'Сергей Смирнов'
   ,'Sergey Smirnov'
   ,CAST('1915-09-26' AS DATE)
),
(
    'Виктор Некрасов'
   ,'Victor Nekrasov'
   ,CAST('1911-06-17' AS DATE)
),
(
    'Ги де Мопассан'
   ,'Guy de Maupassant'
   ,CAST('1850-08-05' AS DATE)
),
(
    'Сергей Сергеев-Ценский'
   ,'Sergey Sergeev-Tsensky'
   ,CAST('1875-09-30' AS DATE)
),
(
    'Сергей Алексеев'
   ,'Sergey Alekseev'
   ,CAST('1871-03-09' AS DATE)
),
(
    'Артур Хейли'
   ,'Arthur Haley'
   ,CAST('1920-04-05' AS DATE)
),
(
    'Владимир Высоцкий'
   ,'Vladimir Vysotsky'
   ,CAST('1938-01-25' AS DATE)
),
(
    'Александр Солженицын'
   ,'Alexander Solzhenitsyn'
   ,CAST('1918-12-11' AS DATE)
),
(
    'Алексей Новиков-Прибой'
   ,'Alexey Novikov-Priboy'
   ,CAST('1877-03-24' AS DATE)
),
(
    'Умберто Эко'
   ,'Umberto Eco'
   ,CAST('1932-01-05' AS DATE)
),
(
    'Александр Чаковский'
   ,'Alexander Chakovsky'
   ,CAST('1913-08-26' AS DATE)
),
(
    'Айрис Мердок'
   ,'Iris murdoch'
   ,CAST('1919-07-15' AS DATE)
),
(
    'Уильям Голдинг'
   ,'William Golding'
   ,CAST('1911-09-19' AS DATE)
),
(
    'Эдуард Успенский'
   ,'Eduard Uspensky'
   ,CAST('1937-12-22' AS DATE)
),
(
    'Морис Метерлинк'
   ,'Maurice Meterlink'
   ,CAST('1862-08-29' AS DATE)
),
(
    'Гюстав Флобер'
   ,'Gustave Flaubert'
   ,CAST('1821-12-12' AS DATE)
),
(
    'Джеймс Олдридж'
   ,'James Aldridge'
   ,CAST('1918-07-10' AS DATE)
),
(
    'Джон Болл'
   ,'John Ball'
   ,CAST('1911-07-08' AS DATE)
),
(
    'Уильям Теккерей'
   ,'William Thackeray'
   ,CAST('1811-07-18' AS DATE)
),
(
    'Оноре де Бальзак'
   ,'Honore de Balzac'
   ,CAST('1799-05-20' AS DATE)
),
(
    'Владимир Войнович'
   ,'Vladimir Voinovich'
   ,CAST('1932-09-26' AS DATE)
),
(
    'Григорий Горин'
   ,'Grigory Gorin'
   ,CAST('1940-03-12' AS DATE)
),
(
    'Валентина Осеева'
   ,'Valentina Oseeva'
   ,CAST('1902-04-28' AS DATE)
),
(
    'Виталий Бианки'
   ,'Vitali Bianchi'
   ,CAST('1894-02-11' AS DATE)
),
(
    'Бенедикт Спиноза'
   ,'Benedict Spinoza'
   ,CAST('1632-11-24' AS DATE)
),
(
    'Эрве Базен'
   ,'Herve Bazin'
   ,CAST('1911-04-17' AS DATE)
),
(
    'Пестов Николай Евграфович'
   ,'Pestov Nikolay Evgrafovich'
   ,CAST('1892-08-17' AS DATE)
),
(
    'Владимир Железников'
   ,'Vladimir Zheleznikov'
   ,CAST('1925-10-26' AS DATE)
),
(
    'Вадим Кожевников'
   ,'Vadim Kozhevnikov'
   ,CAST('1909-04-22' AS DATE)
),
(
    'Вальтер Скотт'
   ,'Walter Scott'
   ,CAST('1771-08-15' AS DATE)
),
(
    'Саша Черный'
   ,'Sasha Black'
   ,CAST('1880-10-13' AS DATE)
),
(
    'Эдмон Ростан'
   ,'Edmond Rostan'
   ,CAST('1868-04-01' AS DATE)
),
(
    'Уилки Коллинз'
   ,'Wilkie Collins'
   ,CAST('1824-01-08' AS DATE)
),
(
    'Роберт Рождественский'
   ,'Robert Christmas'
   ,CAST('1932-06-20' AS DATE)
),
(
    'Эмиль Золя'
   ,'Emil Zola'
   ,CAST('1840-04-02' AS DATE)
),
(
    'Василий Гроссман'
   ,'Vasily Grossman'
   ,CAST('1905-12-12' AS DATE)
),
(
    'Владимир Беляев'
   ,'Vladimir Belyaev'
   ,CAST('1909-04-03' AS DATE)
),
(
    'Георгий Данелия'
   ,'George Danelia'
   ,CAST('1930-08-25' AS DATE)
),
(
    'Шарль Перро'
   ,'Charles Perrault'
   ,CAST('1628-01-12' AS DATE)
),
(
    'Богомил Райнов'
   ,'Bogomil Rainov'
   ,CAST('1919-06-19' AS DATE)
),
(
    'Иван Стаднюк'
   ,'Ivan Stadnyuk'
   ,CAST('1920-03-08' AS DATE)
),
(
    'Павел Бажов'
   ,'Pavel Bazhov'
   ,CAST('1879-01-27' AS DATE)
),
(
    'Курт Воннегут'
   ,'Kurt Vonnegut'
   ,CAST('1922-11-11' AS DATE)
),
(
    'Александра Маринина'
   ,'Alexandra Marinina'
   ,CAST('1957-06-16' AS DATE)
),
(
    'Андрей Некрасов'
   ,'Andrey Nekrasov'
   ,CAST('1907-06-22' AS DATE)
),
(
    'Джеймс Джойс'
   ,'James joyce'
   ,CAST('1882-02-02' AS DATE)
),
(
    'Иван Котляревский'
   ,'Ivan Kotlyarevsky'
   ,CAST('1769-09-09' AS DATE)
),
(
    'Шодерло де Лакло'
   ,'Chauderlo de laclos'
   ,CAST('1741-10-18' AS DATE)
),
(
    'Джанни Родари'
   ,'Gianni Rodari'
   ,CAST('1920-10-23' AS DATE)
),
(
    'Марио Пьюзо'
   ,'Mario puzo'
   ,CAST('1920-10-15' AS DATE)
),
(
    'Роджер Желязны'
   ,'Roger Zhelyazny'
   ,CAST('1937-05-13' AS DATE)
),
(
    'Рафаэль Сабатини'
   ,'Rafael Sabatini'
   ,CAST('1875-04-29' AS DATE)
),
(
    'Николай Островский'
   ,'Nikolai Ostrovsky'
   ,CAST('1904-09-29' AS DATE)
),
(
    'Данил Корецкий'
   ,'Danil Koretsky'
   ,CAST('1948-08-04' AS DATE)
),
(
    'Анна Ахматова'
   ,'Anna Akhmatova'
   ,CAST('1889-06-23' AS DATE)
),
(
    'Михаил Успенский'
   ,'Mikhail Uspensky'
   ,CAST('1950-11-29' AS DATE)
),
(
    'Вильгельм Гауф'
   ,'Wilhelm Hauf'
   ,CAST('1802-11-29' AS DATE)
),
(
    'Мусса Джалиль'
   ,'Moussa Jalil'
   ,CAST('1906-02-15' AS DATE)
),
(
    'Якоб Гримм '
   ,'Jacob Grimm'
   ,CAST('1785-01-04' AS DATE)
),
(
    'Вильгельм Гримм'
   ,'Wilhelm Karl Grimm'
   ,CAST('1786-02-24' AS DATE)
),
(
    'Джованни Боккаччо'
   ,'Giovanni Boccaccio'
   ,CAST('1313-06-16' AS DATE)
),
(
    'Николай Гумилёв'
   ,'Nikolay Gumilyov'
   ,CAST('1886-04-15' AS DATE)
),
(
    'Клайв Льюис'
   ,'Clive Lewis'
   ,CAST('1898-11-29' AS DATE)
),
(
    'Николас Спаркс'
   ,'Nicholas Sparks'
   ,CAST('1965-12-31' AS DATE)
),
(
    'Урсула Ле Гуин'
   ,'Ursula Le Guin'
   ,CAST('1929-10-21' AS DATE)
),
(
    'Франсуаза Саган'
   ,'Francoise Sagan'
   ,CAST('1935-06-21' AS DATE)
),
(
    'Лазарь Лагин'
   ,'Lazarus Lagin'
   ,CAST('1903-12-04' AS DATE)
),
(
    'Фридрих Ницше'
   ,'Friedrich Nietzsche'
   ,CAST('1844-10-15' AS DATE)
),
(
    'Михаил Пришвин'
   ,'Mikhail Prishvin'
   ,CAST('1873-02-04' AS DATE)
),
(
    'Джон Ирвинг'
   ,'John Irving'
   ,CAST('1942-03-02' AS DATE)
),
(
    'Алексей Иванов'
   ,'Aleksey Ivanov'
   ,CAST('1969-11-23' AS DATE)
),
(
    'Владимир Арсеньев'
   ,'Vladimir Arseniev'
   ,CAST('1872-09-10' AS DATE)
),
(
    'Александр Арсеньев'
   ,'Alexander Arseniev'
   ,CAST('1854-06-04' AS DATE)
),
(
    'Иоан Арсеньев'
   ,'Ioan Arseniev'
   ,CAST('1862-03-19' AS DATE)
),
(
    'Константин Арсеньев'
   ,'Konstantin Arseniev'
   ,CAST('1837-02-05' AS DATE)
),
(
    'Туве Янссон'
   ,'Tove Jansson'
   ,CAST('1914-08-09' AS DATE)
),
(
    'Гарриет Бичер-Стоу'
   ,'Harriet Beecher Stowe'
   ,CAST('1811-06-14' AS DATE)
),
(
    'Александр Башлачёв'
   ,'Alexander Bashlachev'
   ,CAST('1960-05-27' AS DATE)
),
(
    'Самуил Маршак'
   ,'Samuel Marshak'
   ,CAST('1887-11-03' AS DATE)
),
(
    'Решад Нури Гюнтекин'
   ,'Reshad Nuri Guentekin'
   ,CAST('1889-11-25' AS DATE)
),
(
    'Артур Шопенгауэр'
   ,'Arthur Schopenhauer'
   ,CAST('1788-02-22' AS DATE)
),
(
    'Томас Харрис'
   ,'Thomas harris'
   ,CAST('1940-04-11' AS DATE)
),
(
    'Джон Уиндэм'
   ,'John Wyndham'
   ,CAST('1903-07-10' AS DATE)
),
(
    'Роберт Музиль'
   ,'Robert Musille'
   ,CAST('1880-11-06' AS DATE)
),
(
    'Морис Дрюон'
   ,'Maurice Druon'
   ,CAST('1918-04-23' AS DATE)
),
(
    'Уильям Фолкнер'
   ,'William Faulkner'
   ,CAST('1897-09-25' AS DATE)
),
(
    'Элинор Портер'
   ,'Elinor Porter'
   ,CAST('1868-12-19' AS DATE)
),
(
    'Фернандо Пессоа'
   ,'Fernando pessoa'
   ,CAST('1888-06-13' AS DATE)
),
(
    'Роберт Штильмарк'
   ,'Robert Stilmark'
   ,CAST('1909-04-03' AS DATE)
),
(
    'Ян Ларри'
   ,'Ian Larry'
   ,CAST('1900-02-15' AS DATE)
),
(
    'Уолт Уитмен'
   ,'Walt Whitman'
   ,CAST('1819-05-31' AS DATE)
),
(
    'Козьма Прутков'
   ,'Kozma Rods'
   ,CAST('1803-04-11' AS DATE)
),
(
    'Терри Гудкайнд'
   ,'Terry Goodkind'
   ,CAST('1948-05-01' AS DATE)
),
(
    'Николай Карамзин'
   ,'Nikolay Karamzin'
   ,CAST('1766-12-12' AS DATE)
),
(
    'Николай Заболоцкий'
   ,'Nikolay Zabolotsky'
   ,CAST('1903-05-07' AS DATE)
),
(
    'Милан Кундера'
   ,'Milan Kundera'
   ,CAST('1929-04-01' AS DATE)
),
(
    'Роальд Даль'
   ,'Roald dahl'
   ,CAST('1916-09-13' AS DATE)
),
(
    'Артур Голден'
   ,'Arthur Golden'
   ,CAST('1956-12-06' AS DATE)
),
(
    'Эдуард Лимонов'
   ,'Eduard Limonov'
   ,CAST('1943-02-22' AS DATE)
),
(
    'Вильям Похлебкин'
   ,'William Pokhlebkin'
   ,CAST('1923-08-20' AS DATE)
),
(
    'Мариам Петросян'
   ,'Mariam Petrosyan'
   ,CAST('1969-08-10' AS DATE)
),
(
    'Фёдор Тютчев'
   ,'Fedor Tyutchev'
   ,CAST('1803-12-05' AS DATE)
),
(
    'Готфрид Келлер'
   ,'Gottfried Keller'
   ,CAST('1819-07-19' AS DATE)
),
(
    'Даниил Гранин'
   ,'Daniil Granin'
   ,CAST('1919-01-01' AS DATE)
),
(
    'Гектор Мало'
   ,'Hector Little'
   ,CAST('1830-05-20' AS DATE)
),
(
    'Тибор Дери'
   ,'Tibor Deri'
   ,CAST('1894-10-18' AS DATE)
),
(
    'Дмитрий Мережковский'
   ,'Dmitry Merezhkovsky'
   ,CAST('1865-08-14' AS DATE)
),
(
    'Владимир Дудинцев'
   ,'Vladimir Dudintsev'
   ,CAST('1918-07-29' AS DATE)
),
(
    'Жан Поль'
   ,'Jean Paul'
   ,CAST('1763-03-21' AS DATE)
),
(
    'Рафаэлло Джованьоли'
   ,'Raffaello Giovagnoli'
   ,CAST('1838-03-13' AS DATE)
),
(
    'Дэвид Лоуренс'
   ,'David Lawrence'
   ,CAST('1885-09-11' AS DATE)
),
(
    'Иммануил Кант'
   ,'Immanuel Kant'
   ,CAST('1724-04-22' AS DATE)
),
(
    'Жорж Санд'
   ,'Georges Sand'
   ,CAST('1804-07-01' AS DATE)
),
(
    'Джон Апдайк'
   ,'John Updike'
   ,CAST('1932-03-18' AS DATE)
),
(
    'Генрик Сенкевич'
   ,'Henryk Senkevich'
   ,CAST('1846-05-05' AS DATE)
),
(
    'Андре Нортон'
   ,'Andre Norton'
   ,CAST('1912-02-17' AS DATE)
),
(
    'Грегори Дэвид Робертс'
   ,'Gregory David Roberts'
   ,CAST('1952-06-21' AS DATE)
),
(
    'Гилберт Кит Честертон'
   ,'Gilbert Keith Chesterton'
   ,CAST('1874-05-29' AS DATE)
),
(
    'Боб Шоу'
   ,'Bob show'
   ,CAST('1931-12-31' AS DATE)
),
(
    'Агния Барто'
   ,'Agniya Barto'
   ,CAST('1901-02-17' AS DATE)
),
(
    'Лев Гумилев'
   ,'Lev Gumilev'
   ,CAST('1912-10-01' AS DATE)
),
(
    'Сергей Довлатов'
   ,'Sergey Dovlatov'
   ,CAST('1941-09-03' AS DATE)
),
(
    'Валентин Иванов'
   ,'Valentin Ivanov'
   ,CAST('1967-08-01' AS DATE)
),
(
    'Ромен Роллан'
   ,'Romain Rolland'
   ,CAST('1866-01-29' AS DATE)
),
(
    'Арчибальд Кронин'
   ,'Archibald Cronin'
   ,CAST('1896-07-19' AS DATE)
),
(
    'Борис Стругацкий'
   ,'Boris Strugatsky'
   ,CAST('1933-04-15' AS DATE)
),
(
    'Чабуа Амирэджиби'
   ,'Chabua Amirajibi'
   ,CAST('1921-11-18' AS DATE)
),
(
    'Арсений Тарковский'
   ,'Arseny Tarkovsky'
   ,CAST('1907-06-25' AS DATE)
),
(
    'Жозеф Анри Рони-старший'
   ,'Joseph Henry Roney Sr'
   ,CAST('1856-02-17' AS DATE)
),
(
    'Роберт Шекли'
   ,'Robert Sheckley'
   ,CAST('1928-07-16' AS DATE)
),
(
    'Карл Маркс'
   ,'Karl Marx'
   ,CAST('1818-05-05' AS DATE)
),
(
    'Сергей Михалков'
   ,'Sergey Mikhalkov'
   ,CAST('1913-03-13' AS DATE)
),
(
    'Евгения Гинзбург'
   ,'Evgenia Ginzburg'
   ,CAST('1904-12-20' AS DATE)
),
(
    'Юрий Герман'
   ,'Yuri German'
   ,CAST('1910-04-04' AS DATE)
),
(
    'Анна Гавальда'
   ,'Anna Gavalda'
   ,CAST('1970-12-09' AS DATE)
),
(
    'Вера Панова'
   ,'Vera Panova'
   ,CAST('1905-03-20' AS DATE)
),
(
    'Фёдор Абрамов'
   ,'Fedor Abramov'
   ,CAST('1920-02-29' AS DATE)
),
(
    'Стиг Ларссон'
   ,'Stig Larsson'
   ,CAST('1954-08-15' AS DATE)
),
(
    'Аркадий Фидлер'
   ,'Arkady Fidler'
   ,CAST('1894-11-28' AS DATE)
),
(
    'Джеймс Крюс'
   ,'James Crews'
   ,CAST('1926-05-13' AS DATE)
),
(
    'Куваев Олег Михайлович'
   ,'Kuvaev Oleg Mikhailovich'
   ,CAST('1934-08-12' AS DATE)
),
(
    'Никколо Макиавелли'
   ,'Niccolo Machiavelli'
   ,CAST('1469-05-03' AS DATE)
),
(
    'Роберт Хайнлайн'
   ,'Robert Heinlein'
   ,CAST('1907-07-07' AS DATE)
),
(
    'Джоанн Харрис'
   ,'Joanne harris'
   ,CAST('1964-07-03' AS DATE)
),
(
    'Павел Санаев'
   ,'Pavel Sanaev'
   ,CAST('1969-08-16' AS DATE)
),
(
    'Михаил Задорнов'
   ,'Mikhail Zadornov'
   ,CAST('1948-07-21' AS DATE)
),
(
    'Рувим Фраерман'
   ,'Reuben Fraerman'
   ,CAST('1891-09-22' AS DATE)
),
(
    'Ирвинг Стоун'
   ,'Irving Stone'
   ,CAST('1903-07-14' AS DATE)
),
(
    'Дафна дю Морье'
   ,'Daphne du Maurier'
   ,CAST('1907-05-13' AS DATE)
),
(
    'Иоанна Хмелевская'
   ,'Joanna Khmelevskaya'
   ,CAST('1932-04-02' AS DATE)
),
(
    'Артур Кларк'
   ,'Arthur Clark'
   ,CAST('1917-12-16' AS DATE)
),
(
    'Патрик Зюскинд'
   ,'Patrick Suskind'
   ,CAST('1949-03-26' AS DATE)
),
(
    'Сесилия Ахерн'
   ,'Cecilia Ahern'
   ,CAST('1981-09-30' AS DATE)
),
(
    'Михаил Ломоносов'
   ,'Mikhail Lomonosov'
   ,CAST('1711-11-19' AS DATE)
),
(
    'Герман Мелвилл'
   ,'Herman Melville'
   ,CAST('1819-08-01' AS DATE)
),
(
    'Альфред Брем'
   ,'Alfred Brem'
   ,CAST('1829-02-02' AS DATE)
),
(
    'Генрих Бёлль'
   ,'Heinrich Boll'
   ,CAST('1917-12-21' AS DATE)
),
(
    'Андрей Гуляшки'
   ,'Andrey Gulyashki'
   ,CAST('1914-05-07' AS DATE)
),
(
    'Василий Сухомлинский'
   ,'Vasily Sukhomlinsky'
   ,CAST('1918-09-28' AS DATE)
),
(
    'Венедикт Ерофеев'
   ,'Venedikt Erofeev'
   ,CAST('1938-10-24' AS DATE)
),
(
    'Исай Калашников'
   ,'Isai Kalashnikov'
   ,CAST('1931-08-09' AS DATE)
),
(
    'Александр Казанцев'
   ,'Alexander Kazantsev'
   ,CAST('1906-09-02' AS DATE)
),
(
    'Бернар Вербер'
   ,'Bernard Werber'
   ,CAST('1961-09-18' AS DATE)
),
(
    'Мария Метлицкая'
   ,'Maria Metlitskaya'
   ,CAST('1959-07-19' AS DATE)
),
(
    'Эдуард Асадов'
   ,'Eduard Asadov'
   ,CAST('1923-09-07' AS DATE)
),
(
    'Жоржи Амаду'
   ,'Georges Amadou'
   ,CAST('1912-08-10' AS DATE)
),
(
    'Анн Голон'
   ,'Anne Golon'
   ,CAST('1921-12-17' AS DATE)
),
(
    'Серж Голон'
   ,'Serge Golon'
   ,CAST('1903-08-23' AS DATE)
),
(
    'Отар Чиладзе'
   ,'Otar Chiladze'
   ,CAST('1933-03-20' AS DATE)
),
(
    'Анатолий Кузнецов'
   ,'Anatoly Kuznetsov'
   ,CAST('1929-08-18' AS DATE)
),
(
    'Абдурахман Абсалямов'
   ,'Abdurahman Absalyamov'
   ,CAST('1911-12-28' AS DATE)
),	
(
    'Кнут Гамсун'
   ,'Knut Hamsun'
   ,CAST('1859-08-04' AS DATE)
),
(
    'Эрнст Теодор Амадей Гофман'
   ,'Ernst Theodore Amadeus Hoffmann'
   ,CAST('1776-01-24' AS DATE)
),
(
    'Павел Вежинов'
   ,'Pavel Vezhinov'
   ,CAST('1914-11-09' AS DATE)
),
(
    'Бертольт Брехт'
   ,'Bertolt Brecht'
   ,CAST('1898-02-10' AS DATE)
),
(
    'Джеймс Клавелл'
   ,'James Clavell'
   ,CAST('1921-10-10' AS DATE)
),
(
    'Луи Буссенар'
   ,'Louis Boussenard'
   ,CAST('1847-10-04' AS DATE)
),
(
    'Вольтер'
   ,'Voltaire'
   ,CAST('1694-11-21' AS DATE)
),
(
    'Сидни Шелдон'
   ,'Sydney Sheldon'
   ,CAST('1917-02-11' AS DATE)
),
(
    'Вероника Тушнова'
   ,'Veronika Tushnova'
   ,CAST('1911-03-27' AS DATE)
),
(
    'Бернхард Шлинк'
   ,'Bernhard Schlink'
   ,CAST('1944-07-06' AS DATE)
),
(
    'Терри Пратчетт'
   ,'Terry Pratchett'
   ,CAST('1948-04-28' AS DATE)
),
(
    'Альберт Санчес Пиньоль'
   ,'Albert Sanchez Pignol'
   ,CAST('1965-07-11' AS DATE)
),
(
    'Брэм Стокер'
   ,'Bram Stoker'
   ,CAST('1847-11-08' AS DATE)
),
(
    'Клиффорд Саймак'
   ,'Clifford simak'
   ,CAST('1904-08-03' AS DATE)
),
(
    'Лобсанг Рампа'
   ,'Lobsang Rampa'
   ,CAST('1910-04-08' AS DATE)
),
(
    'Лион Фейхтвангер'
   ,'Lyon Feuchtwanger'
   ,CAST('1884-07-07' AS DATE)
),
(
    'Энн Бронте'
   ,'Anne Bronte'
   ,CAST('1820-02-17' AS DATE)
),
(
    'Лопе де Вега'
   ,'Lope de Vega'
   ,CAST('1562-11-25' AS DATE)
),
(
    'Анатолий Приставкин'
   ,'Anatoly Pristavkin'
   ,CAST('1931-10-17' AS DATE)
),
(
    'Афанасий Фет'
   ,'Athanasius Fet'
   ,CAST('1820-12-05' AS DATE)
),
(
    'Гегель'
   ,'Hegel'
   ,CAST('1770-08-27' AS DATE)
),
(
    'Роберт Джордан'
   ,'Robert Jordan'
   ,CAST('1948-10-17' AS DATE)
),
(
    'Сандра Браун'
   ,'Sandra brown'
   ,CAST('1948-03-12' AS DATE)
),
(
    'Томас Харди'
   ,'Thomas hardy'
   ,CAST('1840-06-02' AS DATE)
),
(
    'Евгений Велтистов'
   ,'Evgeny Veltistov'
   ,CAST('1934-07-21' AS DATE)
),
(
    'Павел Мельников'
   ,'Pavel Melnikov'
   ,CAST('1819-11-06' AS DATE)
),
(
    'Фрэнсис Элиза Бёрнетт'
   ,'Francis Eliza Burnett'
   ,CAST('1849-11-24' AS DATE)
),
(
    'Светлана Мартынчик'
   ,'Svetlana Martynchik'
   ,CAST('1965-06-09' AS DATE)
),
(
    'Игорь Стёпин'
   ,'Igor Styopin'
   ,CAST('1967-01-21' AS DATE)
),
(
    'Гарри Гаррисон'
   ,'Harry harrison'
   ,CAST('1925-03-12' AS DATE)
),
(
    'Себастьян Жапризо'
   ,'Sebastian Japrizo'
   ,CAST('1931-07-04' AS DATE)
),
(
    'Джеймс Хэрриот'
   ,'James harriot'
   ,CAST('1916-10-03' AS DATE)
),
(
    'Андре Моруа'
   ,'Andre Morois'
   ,CAST('1885-07-26' AS DATE)
),
(
    'Дмитрий Липскеров'
   ,'Dmitry Lipskerov'
   ,CAST('1964-02-19' AS DATE)
),
(
    'Генри Миллер'
   ,'Henry Miller'
   ,CAST('1891-12-26' AS DATE)
),
(
    'Мольер'
   ,'Moliere'
   ,CAST('1622-01-15' AS DATE)
),
(
    'Эмиль Брагинский'
   ,'Emil Braginsky'
   ,CAST('1921-11-19' AS DATE)
),
(
    'Эльдар Рязанов'
   ,'Eldar Ryazanov'
   ,CAST('1927-11-18' AS DATE)
),
(
    'Булат Окуджава'
   ,'Bulat Okudzhava'
   ,CAST('1924-05-09' AS DATE)
),
(
    'Сергей Козлов'
   ,'Sergey Kozlov'
   ,CAST('1939-08-22' AS DATE)
),
(
    'Петр Чаадаев'
   ,'Petr Chaadaev'
   ,CAST('1794-06-07' AS DATE)
),
(
    'Фрэнк Герберт'
   ,'Frank Herbert'
   ,CAST('1920-10-08' AS DATE)
),
(
    'Александр Дюма (сын)'
   ,'Alexander Dumas (son)'
   ,CAST('1824-07-27' AS DATE)
),
(
    'Фредерик Бегбедер'
   ,'Frederick Begbeder'
   ,CAST('1965-09-21' AS DATE)
),
(
    'Фридрих Энгельс'
   ,'Friedrich Engels'
   ,CAST('1820-11-28' AS DATE)
),
(
    'Мишель де Монтень'
   ,'Michel de Montaigne'
   ,CAST('1533-02-28' AS DATE)
),
(
    'Шарль Бодлер'
   ,'Charles Baudelaire'
   ,CAST('1821-04-09' AS DATE)
),
(
    'Константин Циолковский'
   ,'Konstantin Tsiolkovsky'
   ,CAST('1857-09-17' AS DATE)
),
(
    'Сьюзен Коллинз'
   ,'Suzanne Collins'
   ,CAST('1962-08-10' AS DATE)
),
(
    'Артемий Троицкий'
   ,'Artemy Troitsky'
   ,CAST('1955-06-16' AS DATE)
),
(
    'Ирина Головкина (Римская-Корсакова)'
   ,'Irina Golovkina (Rimskaya-Korsakova)'
   ,CAST('1904-06-06' AS DATE)
),
(
    'Юрий Олеша'
   ,'Yuri Olesha'
   ,CAST('1899-03-03' AS DATE)
),
(
    'Дмитрий Мамин-Сибиряк'
   ,'Dmitry Mamin-Sibiryak'
   ,CAST('1852-11-06' AS DATE)
),
(
    'Александр Козачинский'
   ,'Alexander Kozachinsky'
   ,CAST('1903-09-04' AS DATE)
),
(
    'Грэм Грин'
   ,'Graham Green'
   ,CAST('1904-10-02' AS DATE)
),
(
    'Чарльз Перси Сноу'
   ,'Charles Percy Snow'
   ,CAST('1905-10-15' AS DATE)
),
(
    'Энтони Бёрджесс'
   ,'Anthony Burgess'
   ,CAST('1917-02-25' AS DATE)
),
(
    'Джеффри Чосер'
   ,'Jeffrey Chaucer'
   ,null
),
(
    'Эзоп'
   ,'Aesop'
   ,null
),
(
    'Филип Пулман'
   ,'Philip Pulman'
   ,CAST('1946-10-19' AS DATE)
),
(
    'Карлос Кастанеда'
   ,'Carlos Castaneda'
   ,CAST('1925-12-25' AS DATE)
),
(
    'Уильям Айриш'
   ,'William Irish'
   ,CAST('1903-12-04' AS DATE)
),
(
    'Лаймен Фрэнк Баум'
   ,'Lymene Frank Baum'
   ,CAST('1856-05-15' AS DATE)
),
(
    'Степан Писахов'
   ,'Stepan Pisakhov'
   ,CAST('1879-10-25' AS DATE)
),
(
    'Даниэль Глаттауэр'
   ,'Daniel Glattauer'
   ,CAST('1960-05-19' AS DATE)
),
(
    'Виталий Губарев'
   ,'Vitaly Gubarev'
   ,CAST('1912-08-30' AS DATE)
),
(
    'Иосиф Бродский'
   ,'Joseph Brodsky'
   ,CAST('1940-05-24' AS DATE)
),
(
    'Мишель Уэльбек'
   ,'Michelle Welbeck'
   ,CAST('1956-02-26' AS DATE)
),
(
    'Генри Райдер Хаггард'
   ,'Henry Ryder Haggard'
   ,CAST('1856-06-22' AS DATE)
),
(
    'Александр Суворов'
   ,'Alexander Suvorov'
   ,CAST('1730-11-24' AS DATE)
),
(
    'Станислав Ежи Лец'
   ,'Stanislav Jerzy Lets'
   ,CAST('1909-03-06' AS DATE)
),
(
    'Андрей Усачев'
   ,'Andrey Usachev'
   ,CAST('1958-07-05' AS DATE)
),
(
    'Светлана Алексиевич'
   ,'Svetlana Aleksievich'
   ,CAST('1948-05-31' AS DATE)
),
(
    'Мария Нуровская'
   ,'Maria Nurovskaya'
   ,CAST('1944-03-03' AS DATE)
),
(
    'Вергилий'
   ,'Virgil'
   ,null
),
(
    'Джон Мильтон'
   ,'John Milton'
   ,CAST('1608-12-19' AS DATE)
),
(
    'Игорь Губерман'
   ,'Igor Huberman'
   ,CAST('1936-07-07' AS DATE)
),
(
    'Софокл'
   ,'Sophocles'
   ,null
),
(
    'Владимир Одоевский'
   ,'Vladimir Odoevsky'
   ,CAST('1804-08-11' AS DATE)
),
(
    'Януш Вишневский'
   ,'Janusz Wisniewski'
   ,CAST('1954-08-18' AS DATE)
),
(
    'Александр Житинский'
   ,'Alexander Zhitinsky'
   ,CAST('1941-01-19' AS DATE)
),
(
    'Михаил Веллер'
   ,'Michael Weller'
   ,CAST('1948-05-20' AS DATE)
),
(
    'Аркадий Аверченко'
   ,'Arkady Averchenko'
   ,CAST('1880-03-27' AS DATE)
),
(
    'Джордж Гордон Байрон'
   ,'George Gordon Byron'
   ,CAST('1788-01-22' AS DATE)
),
(
    'Антоний Погорельский'
   ,'Anthony Pogorelsky'
   ,null
),
(
    'Петроний Арбитр'
   ,'Petronius Referee'
   ,null
),
(
    'Белла Ахмадулина'
   ,'Bella Akhmadulina'
   ,CAST('1937-04-10' AS DATE)
),
(
    'Паруйр Севак'
   ,'Paruyr Sevak'
   ,CAST('1924-01-24' AS DATE)
),
(
    'Нина Берберова'
   ,'Nina Berberova'
   ,CAST('1901-08-08' AS DATE)
),
(
    'Серен Кьеркегор'
   ,'Soren Kierkegaard'
   ,CAST('1813-05-05' AS DATE)
),
(
    'Чак Паланик'
   ,'Chuck Palahniuk'
   ,CAST('1962-02-21' AS DATE)
),
(
    'Андрей Белый'
   ,'Andrey Bely'
   ,CAST('1880-10-26' AS DATE)
),
(
    'Осип Мандельштам'
   ,'Osip Mandelstam'
   ,CAST('1891-01-14' AS DATE)
),
(
    'Марина Влади'
   ,'Marina Vladi'
   ,CAST('1938-05-10' AS DATE)
),
(
    'Даниил Хармс'
   ,'Daniel Harms'
   ,CAST('1905-12-30' AS DATE)
),
(
    'Элизабет Гаскелл'
   ,'Elizabeth Gaskell'
   ,CAST('1810-09-29' AS DATE)
),
(
    'Петр Вайль'
   ,'Peter Weil'
   ,CAST('1949-09-29' AS DATE)
),
(
    'Александр Генис'
   ,'Alexander Genis'
   ,CAST('1953-02-11' AS DATE)
),
(
    'Вероника Долина'
   ,'Veronica Valley'
   ,CAST('1956-01-02' AS DATE)
),
(
    'Ричард Матесон'
   ,'Richard Mateson'
   ,CAST('1926-02-20' AS DATE)
),
(
    'Ясунари Кавабата'
   ,'Yasunari Kawabata'
   ,CAST('1899-06-11' AS DATE)
),
(
    'Владимир Тендряков'
   ,'Vladimir Tendryakov'
   ,CAST('1923-12-05' AS DATE)
),
(
    'Монтейру Лобату'
   ,'Monteiro Lobato'
   ,CAST('1882-04-18' AS DATE)
),
(
    'Василий Аксенов'
   ,'Vasily Aksenov'
   ,CAST('1932-08-20' AS DATE)
),
(
    'Шарль де Костер'
   ,'Charles de Coster'
   ,null
),
(
    'Галина Щербакова'
   ,'Galina Shcherbakova'
   ,CAST('1932-05-10' AS DATE)
),
(
    'Катарина Масетти'
   ,'Katarina Masetti'
   ,CAST('1944-04-29' AS DATE)
),
(
    'Андреас Эшбах'
   ,'Andreas Eschbach'
   ,CAST('1959-09-15' AS DATE)
),
(
    'Джек Керуак'
   ,'Jack Kerouac'
   ,CAST('1922-03-12' AS DATE)
),
(
    'Плутарх'
   ,'Plutarch'
   ,null
),
(
    'Вирджиния Вулф'
   ,'Virginia Woolf'
   ,CAST('1882-01-25' AS DATE)
),
(
    'Дмитрий Григорович'
   ,'Dmitry Grigorovich'
   ,CAST('1822-03-31' AS DATE)
),
(
    'Владимир Сорокин'
   ,'Vladimir Sorokin'
   ,CAST('1955-08-07' AS DATE)
),
(
    'Федор Сологуб'
   ,'Fedor Sologub'
   ,CAST('1863-03-01' AS DATE)
),
(
    'Север Гансовский'
   ,'North Gansovsky'
   ,CAST('1918-12-15' AS DATE)
),
(
    'Диана Сеттерфилд'
   ,'Diana Setterfield'
   ,CAST('1964-08-22' AS DATE)
),
(
    'Пэлем Грэнвил Вудхауз'
   ,'Pale Granville Woodhouse'
   ,CAST('1881-10-15' AS DATE)
),
(
    'Василий Жуковский'
   ,'Vasily Zhukovsky'
   ,CAST('1783-02-09' AS DATE)
),
(
    'Ланьлинский насмешник'
   ,'Lanling mocker'
   ,null
),
(
    'Томас Мор'
   ,'Thomas More'
   ,CAST('1478-02-07' AS DATE)
),
(
    'Кеннет Грэм'
   ,'Kenneth Graham'
   ,CAST('1859-03-08' AS DATE)
),
(
    'Наталья Щерба'
   ,'Natalya Shcherba'
   ,CAST('1981-11-16' AS DATE)
),
(
    'Александр Бушков'
   ,'Alexander Bushkov'
   ,CAST('1956-04-05' AS DATE)
),
(
    'Людмила Улицкая'
   ,'Lyudmila Ulitskaya'
   ,CAST('1943-02-21' AS DATE)
),
(
    'Дино Буццати'
   ,'Dino Buzzati'
   ,CAST('1906-10-16' AS DATE)
),
(
    'Кормак Маккарти'
   ,'Cormac McCarthy'
   ,CAST('1933-07-20' AS DATE)
),
(
    'Конкордия Антарова'
   ,'Concordia Antarova'
   ,CAST('1886-04-25' AS DATE)
),
(
    'Орсон Скотт Кард'
   ,'Orson Scott Card'
   ,CAST('1951-08-24' AS DATE)
),
(
    'Дени Дидро'
   ,'Denis Didro'
   ,CAST('1713-10-05' AS DATE)
),
(
    'Юрий Нестеренко'
   ,'Yuri Nesterenko'
   ,CAST('1972-10-09' AS DATE)
),
(
    'Эсхил'
   ,'Aeschylus'
   ,null
),
(
    'Райнер Мария Рильке'
   ,'Rainer Maria Rilke'
   ,CAST('1875-12-04' AS DATE)
),
(
    'Милорад Павич'
   ,'Milorad Pavic'
   ,CAST('1929-10-15' AS DATE)
),
(
    'Рабиндранат Тагор'
   ,'Rabindranath Tagore'
   ,CAST('1861-05-07' AS DATE)
),
(
    'Хорхе Луис Борхес'
   ,'Jorge Luis Borges'
   ,CAST('1899-08-24' AS DATE)
),
(
    'Петер Якобсен'
   ,'Peter Jacobsen'
   ,CAST('1847-04-07' AS DATE)
),
(
    'Борис Шергин'
   ,'Boris Shergin'
   ,null
),
(
    'Виктор Точинов'
   ,'Victor Tochinov'
   ,null
),
(
    'Юрий Трифонов'
   ,'Yuri Trifonov'
   ,CAST('1925-08-28' AS DATE)
),
(
    'Джакомо Казанова'
   ,'Giacomo Casanova'
   ,CAST('1725-04-02' AS DATE)
),
(
    'Эжен Сю'
   ,'Eugene Xu'
   ,CAST('1804-01-26' AS DATE)
),
(
    'Генрих Манн'
   ,'Heinrich Mann'
   ,CAST('1871-03-27' AS DATE)
),
(
    'Дмитрий Быков'
   ,'Dmitry Bykov'
   ,CAST('1967-12-20' AS DATE)
),
(
    'Джоджо Мойес'
   ,'Jojo Moyes'
   ,CAST('1969-08-04' AS DATE)
),
(
    'Юлия Друнина'
   ,'Julia Drunina'
   ,CAST('1924-05-10' AS DATE)
),
(
    'Эрл Стэнли Гарднер'
   ,'Earl Stanley Gardner'
   ,CAST('1889-07-17' AS DATE)
),
(
    'Леонид Каганов'
   ,'Leonid Kaganov'
   ,CAST('1972-05-21' AS DATE)
),
(
    'Мариэтта Шагинян'
   ,'Marietta Shaginyan'
   ,CAST('1888-04-02' AS DATE)
),
(
    'Мэри Шелли'
   ,'Mary Shelley'
   ,CAST('1797-08-30' AS DATE)
),
(
    'Даниил Андреев'
   ,'Daniil Andreev'
   ,null
),
(
    'Нил Гейман'
   ,'Neil Gaiman'
   ,CAST('1960-11-10' AS DATE)
),
(
    'Трумен Капоте'
   ,'Truman Capote'
   ,CAST('1924-09-30' AS DATE)
),
(
    'Жан Жак Руссо'
   ,'Jean Jacques Rousseau'
   ,CAST('1712-06-28' AS DATE)
),
(
    'Эрих Фромм'
   ,'Erich Fromm'
   ,CAST('1900-03-23' AS DATE)
),
(
    'Густав Майринк'
   ,'Gustav Meyrink'
   ,CAST('1868-01-19' AS DATE)
),
(
    'Януш Корчак'
   ,'Janusz Korczak'
   ,CAST('1878-07-22' AS DATE)
),
(
    'Маркус Зузак'
   ,'Marcus Z'
   ,CAST('1975-06-23' AS DATE)
),
(
    'Вадим Шефнер'
   ,'Vadim Shefner'
   ,CAST('1915-01-12' AS DATE)
),
(
    'Тамара Крюкова'
   ,'Tamara Kryukova'
   ,CAST('1953-10-14' AS DATE)
),
(
    'Энн Райс'
   ,'Ann rice'
   ,CAST('1941-10-04' AS DATE)
),
(
    'Хелен Филдинг'
   ,'Helen Fielding'
   ,CAST('1958-02-19' AS DATE)
),
(
    'Эдмунд Гуссерль'
   ,'Edmund Husserl'
   ,CAST(' 1859-04-08' AS DATE)
),
(
    'Леонардо да Винчи'
   ,'Leonardo da Vinci'
   ,CAST('1452-04-15' AS DATE)
),
(
    'Тимур Кибиров'
   ,'Timur Kibirov'
   ,CAST('1955-02-15' AS DATE)
),
(
    'Френсис Бэкон'
   ,'Francis Bacon'
   ,CAST('1561-01-22' AS DATE)
),
(
    'Ивлин Во'
   ,'Evelyn Waugh'
   ,CAST('1903-10-28' AS DATE)
),
(
    'Дмитрий Горчев'
   ,'Dmitry Gorchev'
   ,CAST('1963-09-27' AS DATE)
),
(
    'Анатолий Алексин'
   ,'Anatoly Aleksin'
   ,CAST('1924-08-03' AS DATE)
),
(
    'Олег Дивов'
   ,'Oleg Divov'
   ,CAST('1968-10-03' AS DATE)
),
(
    'Иэн Макьюэн'
   ,'Ian McEwan'
   ,CAST('1948-06-21' AS DATE)
),
(
    'Андрей Белянин'
   ,'Andrey Belyanin'
   ,CAST('1967-01-24' AS DATE)
),
(
    'Луций Анней Сенека'
   ,'Lucius Anney Seneca'
   ,null
),
(
    'Рене Декарт'
   ,'Rene Descartes'
   ,CAST('1596-03-31' AS DATE)
),
(
    'Герман Зудерман'
   ,'Herman Suderman'
   ,CAST('1857-09-30' AS DATE)
),
(
    'Чарльз Дарвин'
   ,'Charles Darwin'
   ,CAST('1809-02-12' AS DATE)
),
(
    'Генрик Ибсен'
   ,'Henryk Ibsen'
   ,CAST('1828-03-20' AS DATE)
),
(
    'Лоренс Стерн'
   ,'Lawrence Stern'
   ,CAST('1713-11-24' AS DATE)
),
(
    'Эдгар Берроуз'
   ,'Edgar Burroughs'
   ,CAST('1875-09-01' AS DATE)
),
(
    'Дмитрий Артис'
   ,'Dmitry Artis'
   ,CAST('1973-07-14' AS DATE)
),
(
    'Сара Джио'
   ,'Sarah gio'
   ,CAST('1978-02-18' AS DATE)
),
(
    'Дик Фрэнсис'
   ,'Dick francis'
   ,CAST('1920-10-31' AS DATE)
),
(
    'Марио Варгас Льоса'
   ,'Mario Vargas Llosa'
   ,CAST('1936-03-28' AS DATE)
),
(
    'Хантер Стоктон Томпсон'
   ,'Hunter Stockton Thompson'
   ,CAST('1937-07-18' AS DATE)
),
(
    'Николай Дубов'
   ,'Nikolay Dubov'
   ,CAST('1910-11-04' AS DATE)
),
(
    'Михаэль Энде'
   ,'Michael Ende'
   ,CAST('1929-11-12' AS DATE)
),
(
    'Карел Чапек'
   ,'Karel Capek'
   ,CAST('1890-01-09' AS DATE)
),
(
    'Марк Леви'
   ,'Mark Levy'
   ,CAST('1961-10-16' AS DATE)
),
(
    'Томас Гоббс'
   ,'Thomas Hobbes'
   ,CAST('1588-04-05' AS DATE)
),
(
    'Бернгард Гржимек'
   ,'Bernhard Grzimek'
   ,CAST('1909-04-24' AS DATE)
),
(
    'Михаэль Гржимек'
   ,'Michael Grzimek'
   ,CAST('1934-04-12' AS DATE)
),
(
    'Сэмюэл Беккет'
   ,'Samuel Beckett'
   ,CAST('1906-04-13' AS DATE)
),
(
    'Сергей Лукьяненко'
   ,'Sergey Lukyanenko'
   ,CAST('1968-04-11' AS DATE)
),
(
    'Публий Корнелий Тацит'
   ,'Publius Cornelius Tacitus'
   ,null
),
(
    'Рик Янси'
   ,'Rick Yancy'
   ,CAST('1962-11-04' AS DATE)
)

PRINT 'zod.vDayBirth - часть 2 - источник наполнен'
GO

PRINT 'Наполнить zod.vCharacteristic часть 20 - писатели 18 века'
GO

INSERT INTO human.tCharacteristic
(
     ruName
    ,name
    ,birthDt
)
VALUES
(
 'Абей Гаспар'
,'Gaspard Abeille'
,null
),
('Авалишвили Георгий Иоаннович'
,'Avalishvili George Ioannovich'
,null
),
('Акстельмейер Станислав Рейнхард'
,'Axtelmeier'
,null
),
('Алер Пауль'
,'Paul Aler'
,CAST('1656-11-09' AS DATE)
),
('Алтуфьев Василий Иванович'
,'Altufiev Vasily Ivanovich'
,null
),
('Асаи Рёи'
,'Asai Ryoi'
,null
),
('Байза Йозеф Игнац'
,'Jozef Igac Bajza'
,CAST('1755-03-05' AS DATE)
),
('Баланос Козмас'
,'Balanos Kozmas'
,null
),
('Банье Антуан'
,'Antoine Banier'
,CAST('1673-11-02' AS DATE)
),
('Баретти Джузеппе'
,'Giuseppe Marco Antonio Baretti'
,CAST('1719-04-24' AS DATE)
),
('Барнс Джошуа'
,'Joshua Barnes'
,CAST('1654-01-10' AS DATE)
),
('Бастид Жан-Франсуа де'
,'Jean-Francois de Bastide'
,CAST('1724-07-15' AS DATE)
),
('Батерст Ральф'
,'Ralph Bathurst'
,null
),
('Бегелин Николас де'
,'Nicolas de Beguelin'
,CAST('1714-06-25' AS DATE)
),
('Бенцель-Штернау Кристиан Эрнст фон'
,'Karl Christian Ernst von Bentzel-Sternau'
,CAST('1767-04-09' AS DATE)
),
('Беркень Арно'
,'Arnaud Berquin'
,CAST('1749-09-25' AS DATE)
),
('Бешшеньеи Дьёрдь'
,'Bessenyei Gyorgy'
,null
),
('Богданов Андрей'
,'Bogdanov Andrey'
,null
),
('Богданович Пётр Фёдорович'
,'Bogdanovich Peter Fedorovich'
,null
),
('Бойе Генрих Христиан'
,'Boyer Heinrich Christian'
,CAST('1744-07-19' AS DATE)
),
('Брамбах Йохан'
,'Brambach Johan'
,CAST('1744-07-19' AS DATE)
),
('Браун Чарльз Брокден'
,'Charles Brockden Brown'
,CAST('1771-01-17' AS DATE)
),
('Брук Генри (писатель)'
,'Henry Brooke'
,null
),
('Буасси Луи де'
,'Louis de Boissy'
,CAST('1694-11-26' AS DATE)
),
('Будай-Деляну Ион'
,'Ioan Budai-Deleanu'
,CAST('1760-01-06' AS DATE)
),
('Вага Теодор'
,'Teodor Waga'
,null
),
('Валенкур Жан-Батист Анри де'
,'Jean-Baptiste-Henri de Valincour'
,CAST('1653-03-01' AS DATE)
),
('Вейсе Христиан Феликс'
,'Weiss Christian Felix'
,CAST('1726-01-28' AS DATE)
),
('Великанович Иван'
,'Ivan Velikanovic'
,CAST('1723-08-07' AS DATE)
),
('Вельяшева-Волынцева Анна Ивановна'
,'Velyasheva-Volintseva Anna Ivanovna'
,null
),
('Вехтер Леонард'
,'Georg Philipp Ludwig Leonard Wachter'
,CAST('1762-11-25' AS DATE)
),
('Виллебранд Иоганн Петер'
,'Johann Peter Willebrand'
,CAST('1719-09-10' AS DATE)
),
('Винанд Старинг Антони Кристиан'
,'Vinand Staring Anthony Christian'
,CAST('1767-01-24' AS DATE)
),
('Висс Иоганн Рудольф'
,'Johann Rudolf Wyss'
,CAST('1782-03-04' AS DATE)
),
('Висс Йоханн Давид'
,'Johann David Wyss'
,CAST('1743-05-28' AS DATE)
),
('Вуазенон Клод Анри де Фюзе де'
,'Claude-Henri de Fusee de Voisenon'
,CAST('1708-07-08' AS DATE)
),
('Выбицкий Юзеф'
,'Jozef Rufin Wybicki'
,CAST('1747-09-29' AS DATE)
),
('Галенковский Яков Андреевич'
,'Galenkovsky Yakov Andreevich'
,CAST('1777-10-17' AS DATE)
),
('Глейх Йозеф Алоис'
,'Josef Alois Gleich'
,CAST('1772-09-14' AS DATE)
),
('Гловер Ричард (поэт)'
,'Richard Glover'
,null
),
('Голицын Алексей Иванович'
,'Golitsyn Alexey Ivanovich'
,CAST('1765-05-22' AS DATE)
),
('Готтер Фридрих Вильгельм'
,'Friedrich Wilhelm Gotter'
,CAST('1746-09-03' AS DATE)
),
('Грабовац Филипп'
,'Filip Grabovac'
,null
),
('Данибегашвили Рафаил'
,'Danibegashvili Raphael'
,null
),
('Дескамп Жан-Батист'
,'Descampes Jean-Baptiste'
,CAST('1714-08-28' AS DATE)
),
('Джордани Пьетро'
,'Pietro Giordani'
,CAST('1774-01-01' AS DATE)
),
('Дзиппэнся Икку'
,'Jippensya Ikku'
,null
),
('Дибдин Чарлз'
,'Charles Dibdin'
,CAST('1745-03-15' AS DATE)
),
('Дмитревский Дмитрий Иванович'
,'Dmitrevsky Dmitry Ivanovich'
,null
),
('Дмитриев-Мамонов Фёдор Иванович'
,'Dmitriev-Mamonov Fedor Ivanovich'
,CAST('1727-02-12' AS DATE)
),
('Дмоховский Францишек Ксаверий'
,'Franciszek Ksawery Dmochowski'
,CAST('1762-12-02' AS DATE)
),
('Дюро де Ла Маль Жан Батист'
,'Jean-Baptiste Dureau de La Malle'
,CAST('1742-11-27' AS DATE)
),
('Енгалычев Парфений Николаевич'
,'Engalychev Parfeny Nikolaevich'
,CAST('1769-02-10' AS DATE)
),
('Журовский Фёдор'
,'Zhurovsky Fedor'
,null
),
('Заруцкий Афанасий Алексеевич'
,'Zarutsky Afanasy Alekseevich'
,null
),
('Золотницкий Владимир Трофимович'
,'Zolotnitsky Vladimir Trofimovich'
,null
),
('Кадальсо Хосе'
,'Jose Cadalso y Vazquez de Andrade'
,CAST('1741-10-08' AS DATE)
),
('Капечелатро Джузеппе'
,'Giuseppe Capecelatro'
,CAST('1744-09-25' AS DATE)
),
('Карли Джованни-Ринальдо'
,'Giovanni Rinaldo Carli (Carli-Rubbi)'
,CAST('1720-04-11' AS DATE)
),
('Карманов Диомид Иванович'
,'Karmanov Diomid Ivanovich'
,null
),
('Квадрио Франциск Ксаверий'
,'Kvadrio Frantsisk Ksaveriy'
,CAST('1695-12-01' AS DATE)
),
('Киндлебен Христиан Вильгельм'
,'Kindleben Christian Wilhelm'
,CAST('1748-10-04' AS DATE)
),
('Клавихо-и-Фахардо Хосе'
,'Jose Clavijo y Fajardo'
,CAST('1726-05-19' AS DATE)
),
('Козловский Фёдор Алексеевич'
,'Kozlovsky Fedor Alekseevich'
,null
),
('Кондратович Кирьяк Андреевич'
,'Kondratovich Kiryak Andreevich'
,null
),
('Коутинью Родригу де Соуза'
,'Coutinho Rodrigue de Souza'
,CAST('1755-08-04' AS DATE)
),
('Кошен Шарль-Николя (Младший)'
,'Koshen Charles-Nicolas (Younger)'
,CAST('1715-02-22' AS DATE)
),
('Краевский Михал Димитр'
,'Kraevsky Michal Dimitar'
,CAST('1746-09-08' AS DATE)
),
('Куртиль де Сандра Гасьен де'
,'Gatien de Courtilz de Sandras'
,null
),
('Кэстль Джон'
,'Jan Cassel'
,null
),
('Ластрич Филип'
,'Lastrich Phillip'
,null
),
('Лисков Христиан Людвиг'
,'Christian Ludwig Liscow'
,CAST('1701-04-29' AS DATE)
),
('Лобысевич Панас Кириллович'
,'Lobisevich Panas Kirillovich'
,null
),
('Ловро Шитович'
,'Lovro Shitovich'
,null
),
('Ломонд Шарль-Франсуа'
,'Charles Francois Lhomond'
,null
),
('Максимович Михаил (писатель)'
,'Mihail Maksimovic'
,null
),
('Мануэль Эдуардо де Горостиса'
,'Manuel Maria del Pilar Eduardo de Gorostiza y Cepeda'
,CAST('1789-10-13' AS DATE)
),
('Матушевич Марцин'
,'Marcin Matuszewicz'
,CAST('1714-11-11' AS DATE)
),
('Мейер Андрей Казимирович'
,'Meyer Andrei Kazimirovich'
,null
),
('Мелендес Вальдес Хуан'
,'Juan Melendez Valdes'
,CAST('1754-03-11' AS DATE)
),
('Моргенштерн Лина'
,'Lina Morgenstern'
,CAST('1830-11-25' AS DATE)
),
('Моруа Жан Тестю де'
,'Jean Testu de Mauroy'
,null
),
('Муасси Александр-Гийом де'
,'Alexandre-Guillaume Mouslier de Moissy'
,null
),
('Наумов Иван Мокеевич'
,'Naumov Ivan Mokeevich'
,null
),
('Несецкий Каспер'
,'Neseck Casper'
,CAST('1682-12-31' AS DATE)
),
('Паисий Хилендарский'
,'Paisius Hilendarsky'
,null
),
('Пай Генри Джеймс'
,'Henry James Pye'
,CAST('1744-02-10' AS DATE)
),
('Патрикий Аристовский'
,'Patrician Aristovsky'
,null
),
('Пейн Томас'
,'Thomas Pain'
,CAST('1737-01-29' AS DATE)
),
('Пёлльниц Карл-Людвиг'
,'Pollnitz Karl-Ludwig'
,CAST('1692-02-25' AS DATE)
),
('Перри Джон'
,'John Bennett Perry'
,CAST('1941-01-04' AS DATE)
),
('Пилати Карло Антонио'
,'Pilati Carlo Antonio'
,CAST('1733-12-28' AS DATE)
),
('Пирамович Гжегож'
,'Piramovich Grzegorz'
,CAST('1735-11-25' AS DATE)
),
('Потоцкий Ян'
,'Pototskiy Yan'
,CAST('1761-03-08' AS DATE)
),
('Прокудин-Горский Михаил Иванович'
,'Prokudin-Gorsky Mikhail Ivanovich'
,null
),
('Протопопов Василий Михайлович'
,'Protopopov Vasily Mikhailovich'
,null
),
('Пруцкий Матвей Евсигнеевич'
,'Prutsky Matvey Evsigneevich'
,null
),
('Рабек Кнуд Люне'
,'Rabek Knud Lune'
,CAST('1760-12-18' AS DATE)
),
('Рагене Франсуа'
,'Francois Ragen'
,null
),
('Репьев Иван Николаевич'
,'Repev Ivan Nikolaevich'
,null
),
('Ржевуский Адам Станиславович'
,'Rzhevusky Adam Stanislavovich'
,CAST('1760-08-21' AS DATE)
),
('Родзянко Семён Емельянович'
,'Rodzianko Semyon Emelyanovich'
,null
),
('Рохлиц Иоганн Фридрих'
,'Rohlitz Johann Friedrich'
,CAST('1769-02-12' AS DATE)
),
('Руссель Пьер Жозеф Алексис'
,'Roussel Pierre Joseph Alexis'
,null
),
('Раймондо де Сангро'
,'Raymondo de Sangro'
,CAST('1710-01-30' AS DATE)
),
('Сатанов Исаак'
,'Satan Isaac'
,null
),
('Свифт Джонатан'
,'Swift Jonathan'
,CAST('1667-11-30' AS DATE)
),
('Сергий (Юршев)'
,'Sergius (Yurshev)'
,null
),
('Сикитэй Самба'
,'Shikitei Samba'
,null
),
('Софроний Врачанский'
,'Sofroniy Vrachansky'
,CAST('1739-03-11' AS DATE)
),
('Сумароков Александр Петрович'
,'Sumarokov Alexander Petrovich'
,CAST('1717-11-25' AS DATE)
),
('Сушков Михаил Васильевич'
,'Sushkov Mikhail Vasilievich'
,CAST('1792-06-26' AS DATE)
),
('Танбовцев Василий'
,'Tanbovtsev Vasily'
,null
),
('Тиндал Мэтью'
,'Tyndall Matthew'
,null
),
('Томса Франтишек-Ян'
,'Tomsa Frantisek Jan'
,CAST('1753-10-04' AS DATE)
),
('Торрес Вильярроэль Диего де'
,'Diego de Torres Villarroel'
,CAST('1694-06-18' AS DATE)
),
('У Цзинцзы'
,'Wu Jingzi'
,null
),
('Уильямс Уильям Пантицелин'
,'William Williams Pantycelyn'
,CAST('1717-02-11' AS DATE)
),
('Уильямс Хелен Мария'
,'Helen Maria Williams'
,CAST('1759-06-17' AS DATE)
),
('Уолстонкрафт Мэри'
,'Mary Wollstonecraft'
,CAST('1759-04-27' AS DATE)
),
('Уорбертон Уильям'
,'William Warburton'
,CAST('1698-12-24' AS DATE)
),
('Уэда Акинари'
,'Ueda Akinari'
,CAST('1734-07-25' AS DATE)
),
('Фабер Кристоф'
,'Kristof Frid Faber'
,null
),
('Фелькнер Фёдор Христианович'
,'Felkner Fedor Khristianovich'
,null
),
('Феофан Трофимович'
,'Feofan Trofimovich'
,null
),
('Франсуа Лафермьер'
,'Francois Lafermier'
,CAST('1737-02-11' AS DATE)
),
('Франсуаза де Графиньи'
,'Francoise de Graffigny'
,CAST('1695-02-11' AS DATE)
),
('Фридлендер Давид'
,'David Friedlander'
,CAST('1750-12-06' AS DATE)
),
('Фукс Антон (педагог)'
,'Anton Fuchs'
,null
),
('Фуллер Томас (писатель)'
,'Thomas Fuller'
,CAST('1654-06-24' AS DATE)
),
('Хейберг Петер Андреас'
,'Heyberg Peter Andreas'
,CAST('1758-11-16' AS DATE)
),
('Хирага Гэннай'
,'Hiraga Gennai'
,null
),
('Хмелёвский Бенедикт'
,'Benedykt Joachim Chmielowski'
,CAST('1700-03-20' AS DATE)
),
('Цао Сюэцинь'
,'Cao Zhan'
,null
),
('Цикиндял Дмитрий'
,'Tsikindyal Dmitry'
,null
),
('Цицианов Дмитрий Павлович'
,'Tsitsianov Dmitriy Pavlovich'
,null
),
('Цицианов Егор Павлович'
,'Tsitsianov Egor Pavlovich'
,null
),
('Чарлтон Уолтер'
,'Charlton Walter'
,CAST('1619-02-02' AS DATE)
),
('Чейн Джорж'
,'George Cheyne'
,null
),
('Ченыкаев Алексей Михайлович'
,'Chenykaev Alexey Mikhailovich'
,null
),
('Чижов Пётр Фёдорович'
,'Chizhov Peter Fedorovich'
,null
),
('Шалль Грегуар де'
,'Gregoire Robert Challe'
,CAST('1659-08-17' AS DATE)
),
('Шарль Мишель маркиз де Виллет'
,'Charles Michel Marquis de Villette'
,CAST('1736-12-04' AS DATE)
),
('Шевремон Жан-Батист де'
,'Jean-Baptiste de Chevremont'
,null
),
('Шенье Луи де'
,'Louis de Chenier'
,CAST('1722-06-08' AS DATE)
),
('Шерзенфельд Бригитта Кристина'
,'Brigitta Kristina Scherzenfeldt'
,null
),
('Шерлок Томас'
,'Thomas Sherlock'
,null
),
('Шлегель Иоганн Адольф'
,'Schlegel Johann Adolf'
,CAST('1721-09-17' AS DATE)
),
('Шлиппенбах Ульрих Герман Генрих Густав Фрайхерр фон'
,'Ulrich Hermann Heinrich Gustav Freiherr von Schlippenbach'
,CAST('1774-05-18' AS DATE)
),
('Шпеер Даниэль'
,'Speer Daniel'
,null
),
('Штарк Иоганн Август фон'
,'Stark Johann August fon'
,null
),
('Шульц Фридрих Иоахим Христофор'
,'Joachim Christoph Friedrich Schulz'
,CAST('1762-01-01' AS DATE)
),
('Шутов Гавриил Софронович'
,'Shutov Gavriil Sofronovich'
,null
),
('Щедритский Алексей Иванович'
,'Shchedritsky Alexey Ivanovich'
,null
),
('Щекатов Афанасий Михайлович'
,'Shchekatov Afanasy Mikhailovich'
,null
),
('Эвальд Йоханнес'
,'Johannes Ewald'
,CAST('1743-11-18' AS DATE)
),
('Эйкин Джон'
,'John Aikin'
,CAST('1747-01-05' AS DATE)
),
('Энгельгардт Карл Август'
,'Karl August Engelhardt'
,CAST('1768-02-04' AS DATE)
),
('Эно Шарль Жан Франсуа'
,'Charles-Jean-Francois Henault '
,CAST('1685-02-08' AS DATE)
),
('Эрсан Марк Антуан'
,'Ersan Marc Antoine'
,CAST('1649-01-31' AS DATE)
),
('Эшенбург Иоганн Иоахим'
,'Johann Joachim Eschenburg'
,CAST('1743-12-07' AS DATE)
),
('Юнгер Иоганн Фридрих'
,'Johann Friedrich Junger'
,CAST('1756-02-15' AS DATE)
),
('Юсуф Наби'
,'Yusuf Nabi'
,null
),
('Ягельский Кассиан Иосифович'
,'Yagelsky Kassian Iosifovich'
,null
),
('Ямбрешич Андрей'
,'Yambreshich Andrey'
,CAST('1706-09-20' AS DATE)
),
('Яннау Генрих Иоанн фон'
,'Heinrich Johann von Jannau'
,CAST('1753-03-09' AS DATE)
)
GO

PRINT 'Источник human.vСharacteristic часть 20 - писатели 18 века наполнен '
GO

PRINT 'Наполнить источник human.vСharacteristic часть 19 - писатели 17 века'
GO

INSERT INTO human.tCharacteristic
(
    ruName
   ,name
   ,birthDt
)
VALUES
(
    'Абей Гаспар'
   ,'Bernard Shaw'
   ,CAST('1856-07-26' AS DATE)
),
(
    'Агапий Ландос'
   ,'Agapius Landos'
   ,null
)




Агапий Ландос
Agapius Landos
null

Акстельмейер Станислав Рейнхард
Axtelmeier
null

Алер Пауль
Paul Aler
9 ноября 1656

Альва Иштлильшочитль Фернандо де
Fernando de Navas de Peraleda y Alva Cortes Ixtlilxochitl
null

Ангелони Франческо
Francesco Angeloni
null

Антоний (Подольский)
Anthony (Podolsky)
null

Анчич Иван
Ivan Ancic Dumljanin
11 февраля 1624

Армин Роберт
Robert Armin
null

Асаи Рёи
Asai Ryoi
null

Ашулар Педро де
Pedro Agerre Azpilkueta
null

Банье Антуан
Antoine Banier
2 ноября 1673

Баньян Джон
John Bunyan
null

Барбо де Вильнёв Габриэль Сюзанна
Gabrielle-Suzanne Barbot de Villeneuve
null

Барнс Джошуа
Joshua Barnes
10 января 1654

Баселар Антониу Барбоза
Antonio Barbosa Bacelar
null

Батерст Ральф
Ralph Bathurst
null

Берендес Мерта
Marta Berendes
21 января 1639

Бероальд де Вервиль
Francois Beroalde de Verville
15 апреля 1556

Блажовский Мартин
Marcin Blazowski
null

Богдани Петер
Pjeter Bogdani
null

Ботеро Джованни
Giovanni Botero
null

Браун Томас (писатель)
Thomas Browne
19 октября 1605

Бретон Николас
Nicholas Breton
null

Брук Фулк-Гревилль
Fulke-Greville Brooke
3 октября 1554

Буало Никола
Nicolas Boileau
1 ноября 1636

Буасса Пьер де
Pierre de Boissat
null

Быджовский Марк
Marek Bydzovsky z Florentyna
null

Бэкон Энн
Francis Bacon
null

Валенкур Жан-Батист Анри де
Jean-Baptiste-Henri de Valincour
1 марта 1653

Виейра Раваско Бернардо
Bernardo Vieira Ravasco
null

Винченцо Карафа
Vincenzo Carafa
5 мая 1585

Вишоватый Анджей
Andrzej Wiszowaty
26 ноября 1608

Вондел Йост ван ден
Joost van den Vondel
17 ноября 1587

Габделич Юрай
Juraj Habdelic
27 ноября 1609

Гаватович Якуб
Iacob Gawatthowic
17 марта 1598

Гез де Бальзак Жан-Луи
Jean-Louis Guez de Balzac
31 мая 1597

Гличнер Эразм
Erazm Gliczner Skrzetuski Glicner
null

Годо Антуан
Antoine Godeau
24 сентября 1605

Гомбервиль Марен Леруа де
Marin Le Roy de Gomberville
null

Рец Жан Франсуа Поль де Гонди
Jean-Francois Paul de Gondi
20 сентября 1613

Горницкий Лукаш
Lukasz Gornicki
null

Гуабо-Дюбуа Филипп
Philippe Goibaud-Dubois
3 июня 1626

Дадли Норт 4-й барон Норт
Dudley North 4th Baron North
null

Даниэлло Бартоли
Daniello Bartoli
12 февраля 1608

Делагарди Юханна Элеонора
Johanna Eleonora De la Gardie
26 июня 1661

Демболенцкий Войцех
Wojciech Debocecki
null

Диаментовский Вацлав
Waclaw Dyamentowski
null

Дивкович Матия
Matija Divkovi
21 августа 1563

Дикаст Йиржи
Jiri Dikastus Mirkovsky
null

Дюшен Андре
Andre Duchesne
null

Евлашовский Фёдор Михайлович
Evlashovsky Fyodor Mikhailovich
7 февраля 1546

Завадский Казимир
Kazimierz Rogala Zawadzki
null

Иоанн Милютин
John Milyutin
null

Ихара Сайкаку
Ihara Saikaku
null

Кадлинский Феликс
Felix Kadlinsky
18 октября 1613

Капаччо Джулио Чезаре
Capaccio Giulio Cesare
null

Каррильо Альфонс Ласо де ла Вега
Carrillo Alfons Lazo de la Vega
null

Каччини Джулио
Giulio Caccini или Giulio Romano
8 октября 1551

Кватромани Серторио
Sertorio Quattromani
null

Кеведо Франсиско де
Francisco de Quevedo
17 сентября 1580

Кемени Иоанн
Janos Kemeny
14 декабря 1607

Клирик Острожский
Cleric of Ostrog
null

Кольте Гийом
Guillaume Colletet
12 марта 1598

Конрар Валантэн
Valentin Conrart
null

Коховский Веспасиан
Kochovsky Vespasian
null

Красинский Ян
Jan Andrzej Krasinski
null

Кроче Джулио Чезаре
Giulio Cesare Croce
null

Кульман Квирин
Quirinus Kuhlmann
25 февраля 1651

Куртиль де Сандра Гасьен де
Gatien de Courtilz de Sandras
null

Куэва Хуан де ла
Juan de la Cueva de Garoza
23 октября 1543

Кьябрера Габриэлло
Gabriello Chiabrera
18 июня 1552

Ла Кальпренед Готье
Gautier de Costes de La Calprenede
null

Ла Шапель Жан де
Jean de La Chapelle
24 октября 1651

Лабрюйер Жан де
Jean de La Bruyere
16 августа 1645

Лафайет Мари Мадлен де
Marie-Madeleine Pioche de La Vergne
18 марта 1634

Ли Юй (драматург)
Li Yu (playwright)
null

Липсий Юст
Justus Lipsius
18 октября 1547

Лобу Франсишку Родригеш
Francisco Rodrigues Lobo
null

Лопес де Когольюдо Диего
Diego Lopez de Cogolludo
null

Людовико Цаккони
Ludovico Zacconi
11 июня 1555

Мандей Энтони
Anthony Munday
null

Маринелла Лукреция
Lucrezia Marinella
null

Марино Джамбаттиста
Marino giambattista
14 октября 1569

Матос Грегориу де
Matos Gregoriu de
23 декабря 1636

Мезенец Александр Иванович
Mezenets Alexander Ivanovich
null

Мелу Франсишку Мануэл де
Melus Francisco Manuel de
23 ноября 1608

Мильтон Джон
John Milton
19 декабря 1608

Миямото Мусаси
Miyamoto Musashi
null

Монфокон де Виллар Анри де
Nicolas Pierre Henri de Montfaucon
null

Моруа Жан Тестю де
Jean Testu de Mauroy
null

Морштын Иероним
Hieronim Morsztyn
null

Надаши Янош
Janos Nadasi
13 января 1613

Обухович Филипп Казимир
Filip Kazimierz Obuchowicz
null

Олива Джованни Паоло
Giovanni Paolo Oliva
4 октября 1600

Мадам д Онуа
Marie-Catherine d Aulnoy
14 января 1651

Пальяс Херонимо
Geronimo Pallas
null

Парависино Ортенсьо Феликс
Hortensio Felix Paravicino y Arteaga
12 октября 1580

Пасторий Иоахим
Joachim Pastorius
20 сентября 1611

Пачакути Ямки Салькамайуа Хуан де Санта Крус
Juan de Santa Cruz Pachacuti Yamqui Salcamayhua
null

Пелиссон Поль
Paul Pellisson
30 октября 1624

Перес де Ита Хинес
Gines Perez de Hita
null

Рагене Франсуа
Francois Raguenet
null

Рокко Антонио
Antonio Rocco
null

Росс Александр
Alexander Ross
1 января 1591

Роулендсон Мэри
Mary White
null

Рохас Соррилья Франсиско де
Francisco de Rojas Zorrilla
4 октября 1607

Сааведра Диего
Diego de Saavedra y Faxardo
6 мая 1584

Саси Луи де
Louis de Sacy
null

Свифт Джонатан
Jonathan Swift
30 ноября 1667

Сегре Жан Реньо де
Jean Regnault de Segrais
22 августа 1624

Седовский Яков
Sedovsky Yakov
null

Сердань де Таллада Томас
Cerdany de Tallada Thomas
null

Симон Педро
Fray Pedro Simon
null

Скарга Пётр
Piotr Skarga
2 февраля 1536

Скюдери Жорж де
Georges de Scudery
22 августа 1601

Скюдери Мадлен де
Madeleine de Scudery
15 ноября 1607

Смит Джон (капитан)
John Smith
null

Сорель Шарль
Charles Sorel sieur de Souvigny
null

Стильяни Томмазо
Tommaso Stigliani
null

Сюй Сякэ
Xu Xiake
5 января 1587

Тассони Алессандро
Alessandro Tassoni
28 сентября 1565

Твардовский Самуил
Twardowski Samuel
null

Тейлор Джереми (писатель)
Jeremy Taylor
15 августа 1613

Тейлор Джон (поэт)
John Taylor
24 августа 1578

Тиндал Мэтью
Matthew Tindal
null

Тирсо Гонсалес
Tirso Gonzalez
18 января 1624

Урсула Микаэла Мората
Ursula Micaela Morata
21 октября 1628

Фелтем 
Owen Feltham
null

Феодосий Боровик
Teodozy Borowik
null

Фернандес Пьедраита Лукас
Lucas Fernandez de Piedrahita
null

Фонтенель Бернар Ле Бовье де
Bernard le Bovier de Fontenelle
11 февраля 1657

Фуллер Томас (писатель)
Thomas Fuller
24 июня 1654

Фэн Мэнлун
Feng Menglong
null

Фюретьер Антуан
Antoine Furetiere
28 декабря 1619

Хаклюйт Ричард
Richard Hakluyt
null

Халецкий Николай Христофор
Khaletsky Nicholas Christopher
null

Хемскерк Йохан ван
Hemskerk Johan Van
null

Чарлтон Уолтер
Walter Charleton
2 февраля 1619

Шалль Грегуар де
Gregoire Robert Challe
17 августа 1659

Шаплен Жан
Jean Chapelain
4 декабря 1595

Шевремон Жан-Батист де
Jean-Baptiste de Chevremont
null

Шедвелл Томас
Thomas Shadwell
null

Шпеер Даниэль
Daniel Speer
null

Штенгель Георг
Georg Stengel
null

Эрсан Марк Антуан
Marc-Antoine Hersan
31 января 1649

Юсуф Наби
Yusuf Nabi
null

PRINT 'Источник zod.vDayBirth часть 19 - писатели 17 века наполнен '
GO


PRINT 'Наполнить источник human.tDay'
GO

INSERT INTO human.tDay
(
     id
    ,centuryId
)
SELECT DISTINCT
     chr.birthDt
    ,CASE
         WHEN chr.birthDt BETWEEN '1900-01-01' AND '2020-01-01' THEN 20 /*20-ый век и начало 21-ого*/
         WHEN chr.birthDt BETWEEN '1800-01-01' AND '1899-12-31' THEN 19 /*19-ый век*/
         WHEN chr.birthDt BETWEEN '1700-01-01' AND '1799-12-31' THEN 18 /*18-ый век*/
         WHEN chr.birthDt BETWEEN '1600-01-01' AND '1699-12-31' THEN 17 /*17-ый век*/
         WHEN chr.birthDt BETWEEN '1500-01-01' AND '1599-12-31' THEN 16 /*16-ый век*/
         WHEN chr.birthDt BETWEEN '1400-01-01' AND '1499-12-31' THEN 15 /*15-ый век*/
         WHEN chr.birthDt BETWEEN '1300-01-01' AND '1399-12-31' THEN 14 /*14-ый век*/
         WHEN chr.birthDt BETWEEN '1200-01-01' AND '1299-12-31' THEN 13 /*13-ый век*/
         WHEN chr.birthDt BETWEEN '1100-01-01' AND '1199-12-31' THEN 12 /*12-ый век*/
         WHEN chr.birthDt BETWEEN '1000-01-01' AND '1099-12-31' THEN 11 /*11-ый век*/
         WHEN chr.birthDt BETWEEN '0900-01-01' AND '0999-12-31' THEN 10 /*10-ый век*/
         WHEN chr.birthDt BETWEEN '0800-01-01' AND '0899-12-31' THEN 9  /*9-ый век*/
         WHEN chr.birthDt BETWEEN '0700-01-01' AND '0799-12-31' THEN 8  /*8-ой век*/
         WHEN chr.birthDt BETWEEN '0600-01-01' AND '0699-12-31' THEN 7  /*7-ой век*/
         WHEN chr.birthDt BETWEEN '0500-01-01' AND '0599-12-31' THEN 6  /*6-ой век*/
         WHEN chr.birthDt BETWEEN '0400-01-01' AND '0499-12-31' THEN 5  /*5-ый век*/
         WHEN chr.birthDt BETWEEN '0300-01-01' AND '0399-12-31' THEN 4  /*4-ый век*/
         WHEN chr.birthDt BETWEEN '0200-01-01' AND '0299-12-31' THEN 3  /*3-ый век*/
         WHEN chr.birthDt BETWEEN '0100-01-01' AND '0199-12-31' THEN 2  /*2-ой век*/
         WHEN chr.birthDt BETWEEN '0001-01-01' AND '0099-12-31' THEN 1/*1-ый век*/
    END AS centuryId
FROM human.vСharacteristic AS chr
WHERE 1 = 1
    AND chr.birthDt IS NOT NULL

PRINT 'Источник human.vDay наполнен'
GO

PRINT 'Запрос - общая статистика по элементам'
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

PRINT 'Запрос - статистика по элементам - группировка до века'
GO

SELECT
     CAST(sng.centuryId AS NVARCHAR(3)) + ' век' AS centuryName
    ,elm.name
    ,sng.humanCnt
FROM (
    SELECT
         hday.centuryId
        ,sng.elementId
        ,COUNT(1) AS humanCnt
    FROM human.vСharacteristic AS chc
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

PRINT 'Запрос - общая статистика по зодиакам'
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

PRINT 'Запрос - статистика по зодиакам по векам'
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
    FROM human.vСharacteristic AS chc
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

--SELECT * FROM human.vСharacteristic
--WHERE birthDt IS NOT NULL
