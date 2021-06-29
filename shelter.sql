DROP TABLE ShelterBranches;
DROP TABLE Employees;
DROP TABLE Owners;
DROP TABLE Animals;
DROP TABLE VetClinic;
DROP TABLE Suppliers;
DROP TABLE LooksAfter;
DROP TABLE BuysFrom;

--- Создаём таблицу "Филиалы"
CREATE TABLE ShelterBranches(
ShelterNo NUMERIC(3) CONSTRAINT pk_br PRIMARY KEY,
BranchCity VARCHAR(50),
BranchAddress VARCHAR(150),
BranchCapacity INT
);

--- Заполняем таблицу "Филиалы"
insert into ShelterBranches values(001, 'Мытищи', 'ул. Бухарестская, 22', 50);
insert into ShelterBranches values(002, 'Одинцово', 'ул. Красногорская, 72', 80);
insert into ShelterBranches values(003, 'Москва', 'пер. Черноморский, 155', 130);
insert into ShelterBranches values(004, 'Руза', 'ул. Ленина, 192', 30);
insert into ShelterBranches values(005, 'Волоколамск', 'ул. Азина, 361', 60);
insert into ShelterBranches values(006, 'Подольск', 'въезд Гоголя, 8', 40);
insert into ShelterBranches values(007, 'Воскресенск', 'ул. Ладыгина, 93', 70);
SELECT * FROM ShelterBranches;

--- Создаём таблицу "Сотрудники"
CREATE TABLE Employees(
EmployeeID VARCHAR(30) NOT NULL PRIMARY KEY,
EmployeeName VARCHAR(90) NOT NULL,
EmployeePath VARCHAR(512) NOT NULL,
EmplyeeSex VARCHAR(30) CONSTRAINT check_sex CHECK (EmplyeeSex LIKE 'муж' OR EmplyeeSex LIKE 'жен'),
EmplyeeBirth DATE,
EmployeePosition VARCHAR(100) NOT NULL,
ShelterNo NUMERIC(3) CONSTRAINT ref_branch REFERENCES ShelterBranches
);

--- Заполняем таблицу "Сотрудники"
insert into Employees values('МТ341541', 'Афанасов Н.А.', '1', 'муж', '27.01.1973', 'Директор', 1);
insert into Employees values('МТ856728', 'Кушик А.К.', '1.1', 'жен', '04.10.1985', 'Специалист по кошкам', 1);
insert into Employees values('МТ396027', 'Кузьминов Я.А.', '1.2', 'муж', '05.12.1998', 'Специалист по собакам', 1);
insert into Employees values('ОД395724', 'Кочинян К.П.', '2', 'жен', '14.01.1991', 'Директор', 2);
insert into Employees values('ОД164582', 'Павлов И.П.', '2.1', 'муж', '17.05.1997', 'Специалист по кошкам', 2);
insert into Employees values('ОД835616', 'Аулова У.К.', '2.2', 'жен', '29.03.2000', 'Специалист по собакам', 2);
insert into Employees values('ОД946382', 'Чермошенцев К.М.', '2.2.1', 'муж', '11.04.1993', 'Гастроэнтеролог', 2);
insert into Employees values('МО961582', 'Чернигов О.Н.', '3', 'муж', '21.06.1989', 'Директор', 3);
insert into Employees values('МО697518', 'Пантюхин Д.В.', '3.1', 'муж', '17.02.1995', 'Специалист по кошкам', 3);
insert into Employees values('МО725182', 'Маркушова К.В.', '3.2', 'жен', '19.12.1996', 'Специалист по собакам', 3);
insert into Employees values('МО251474', 'Набиуллина Э.В.', '3.2.1', 'жен', '16.10.1999', 'Волонтер', 3);
insert into Employees values('РУ738127', 'Михальков А.В.', '4', 'муж', '10.05.1987', 'Директор', 4);
insert into Employees values('ВО266481', 'Безенчук М.М.', '5', 'жен', '18.07.1984', 'Директор', 5);
insert into Employees values('ВО827634', 'Сергеева А.А.', '5.1', 'жен', '16.01.1999', 'Волонтер', 5);
insert into Employees values('ПО182736', 'Смирнов К.Е.', '6', 'муж', '05.02.1979', 'Директор', 6);
insert into Employees values('ВС103723', 'Земскова А.Т.', '7', 'жен', '13.06.1978', 'Директор', 7);
insert into Employees values('ВС736482', 'Ливанова К.Л.', '7.1', 'жен', '23.09.1993', 'Специалист по собакам', 7);

SELECT * FROM Employees;

--- Создаём таблицу "Хозяева"

CREATE TABLE Owners(
OwnerID VARCHAR2(80) NOT NULL PRIMARY KEY,
OwnerName VARCHAR(80),
OwnerBirthDate DATE,
OwnerCity VARCHAR(80),
OwnerAddress VARCHAR(80)
);

--- Заполняем таблицу "Хозяева"
insert into Owners values('МТ7212', 'Карманов А.И.', '23.01.1998', 'Мытищи', 'ул. Замшевая, 221');
insert into Owners values('МТ7823', 'Заславская А.И.', '07.05.1997', 'Мытищи', 'ул. Барская, 20');
insert into Owners values('МО2134', 'Ивахненко А.М.', '05.11.1978', 'Москва', 'пер. Орджоникидзе, 12');
insert into Owners values('ОД9878', 'Муниров Н.Х.', '14.07.1991', 'Одинцово', 'ул.Красноармейская, 204');
insert into Owners values('ОД1567', 'Незнамова Д.В.', '04.10.1977', 'Москва', 'пр. Сталина, 59');
insert into Owners values('ОД9983', 'Низов Н.Р.', '19.04.2000', 'Одинцово', 'пл. Чехова, 37');
insert into Owners values('РУ9567', 'Ольшанченков М.В.', '01.04.1993', 'Руза', 'ул. Кассиора, 99');
insert into Owners values('МО8123', 'Пехпатрова А.К.', '21.06.1989', 'Москва', 'пер. Ломоносова, 15');
insert into Owners values('ОД6781', 'Рязанов К.П.', '07.08.1996', 'Одинцово', 'ул. 1905 года, 44');
insert into Owners values('ВО8291', 'Трофимов И.Е.', '19.02.1984', 'Волоколамск', 'ул. Домодедовская, 26');
insert into Owners values('ПО9021', 'Таова М.А.', '26.12.1979', 'Подольск', 'ул. Краморова, 3');

SELECT * FROM Owners;

--- Создаём таблицу "Животные"
CREATE TABLE Animals(
Species VARCHAR(50) NOT NULL,
Nickname VARCHAR(50),
Weight NUMBER(4, 2) NOT NULL,
BirthYear INTEGER NOT NULL,
Illnesses VARCHAR(100) NOT NULL,
ShelterNo NUMERIC(3) CONSTRAINT an_ref_shbr REFERENCES ShelterBranches,
OwnerID VARCHAR(80) CONSTRAINT own_id REFERENCES Owners,
PRIMARY KEY (Species, Nickname)
);

--- Заполняем таблицу "Животные"
insert into Animals values('Терьер', 'Шарик', 6.2, 2016, 'глисты', 1, 'МТ7212');
insert into Animals values('Терьер', 'Тузик', 5.7, 2017, 'лихорадка', 1, 'МТ7823');
insert into Animals values('Овчарка', 'Атос', 15.2, 2017, 'булимия', 2, 'ОД9878');
insert into Animals values('Овчарка', 'Портос', 14.7, 2017, 'ангина', 2, 'ОД9878');
insert into Animals values('Дворняжка', 'Хвостик', 9.8, 2014, 'альцгеймер', 2, 'ОД1567');
insert into Animals values('Дворняжка', 'Лапка', 8.9, 2015, 'аллергия', 3, 'МО2134');
insert into Animals values('Дворняжка', 'Юля', 6.2, 2018, 'порча', 3, 'МО2134');
insert into Animals values('Дворняжка', 'Барон', 9.2, 2016, 'желтуха', 3, 'МО8123');
insert into Animals values('Британская кошка', 'Маркиз', 5.4, 2019, 'аллергия', 4, 'РУ9567');
insert into Animals values('Британская кошка', 'Шпинат', 6.2, 2018, 'анемия', 4, 'РУ9567');
insert into Animals values('Британская кошка', 'Мурка', 2.5, 2020, 'выпадение шерсти', 5, 'ВО8291');
insert into Animals values('Русская голубая', 'Шуба', 4.8, 2019, 'гастрит', 5, 'ВО8291');
insert into Animals values('Русская голубая', 'Фаянс', 2.5, 2020, 'глисты', 6, 'ПО9021');
insert into Animals values('Мейнкун', 'Годзилла', 7.1, 2019, 'глисты', 7, 'ОД9983');

SELECT * FROM Animals;

--- Создаём таблицу "Ветеринарные клиники"

CREATE TABLE VetClinic(
ClinicName VARCHAR(80),
ClinicCity VARCHAR(80),
ClinicAddress VARCHAR(180),
PhoneNumber NUMBER(11, 0),
CONSTRAINT ClinicInfo PRIMARY KEY (ClinicCity, ClinicName)
);

--- Заполняем таблицу "Ветеринарные клиники"
insert into VetClinic values('Дед Мазай', 'Мытищи', 'ул. Вейерштрассе, 10', 79146478364);
insert into VetClinic values('Собачье сердце', 'Воскресенск', 'ул. Коши, 212', 79637589123);
insert into VetClinic values('Бармалей', 'Одинцово', 'ул. Пуассона, 47', 79836789128);
insert into VetClinic values('Собачье сердце', 'Москва', 'пер. Чебышева, 82', 79314513727);
insert into VetClinic values('Герасим', 'Подольск', 'въезд Романова, 55', 79710982301);
insert into VetClinic values('Дед Мазай', 'Волоколамск', 'ул. Перельмана, 1231', 79276927163);
insert into VetClinic values('Белоснежка', 'Руза', 'ул. Архимеда, 3', 79126534091);

SELECT * FROM VetClinic;

--- Создаём таблицу "Поставщики"

CREATE TABLE Suppliers(
SupAddress VARCHAR(80) PRIMARY KEY,
SupName VARCHAR(80),
Goods Varchar(80)
);

--- Заполняем таблицу "Поставщики"
insert into Suppliers values('г. Мытищи, ул. Черномырдина, 52', 'Ухо и хвост', 'Корм для животных');
insert into Suppliers values('г. Мытищи, пр. Семёнова, 25', 'Айболит', 'Медикаменты');
insert into Suppliers values('г. Воскресенск, ул. Санталовская, 621', 'Акелла', 'Корм для животных');
insert into Suppliers values('г. Воскресенск, ул. Гильфанского, 94', 'Друг человека', 'Мисочки, лоточки');
insert into Suppliers values('г. Одинцово, ул.  Ерёменская, 91', 'Ухо и хвост', 'Корм для животных');
insert into Suppliers values('г. Одинцово, пер. Никонова, 15', 'Айболит', 'Медикаменты');
insert into Suppliers values('г. Одинцово, ул. Потапова, 78', 'Друг человека', 'Мисочки, лоточки');
insert into Suppliers values('г. Москва, ул. Жарикова, 63', 'Акелла', 'Корм для животных');
insert into Suppliers values('г. Москва, пер. Миронский, 123', 'Счастье пушистика', 'Медикаменты');
insert into Suppliers values('г. Москва, ул. Ивановский, 106', 'Друг человека', 'Мисочки, лоточки');
insert into Suppliers values('г. Подольск, въезд Мхитаряна, 28', 'Счастье пушистика', 'Медикаменты');
insert into Suppliers values('г. Подольск, ул. Гуревича, 39', 'Друг человека', 'Мисочки, лоточки');
insert into Suppliers values('г. Волоколамск, пр. Мира, 41', 'Айболит', 'Медикаменты');
insert into Suppliers values('г. Руза, ул. Яблоневая, 77', 'Акелла', 'Корм для животных');

SELECT * FROM Suppliers;

--- Создаём таблицу "Следит за"

CREATE TABLE LooksAfter(
EmployeeID VARCHAR(30) CONSTRAINT looks_aft REFERENCES Employees,
Species VARCHAR(50),
Nickname VARCHAR(50),
CONSTRAINT SpNick FOREIGN KEY (Species, Nickname) REFERENCES Animals (Species, Nickname),
WorkingDays VARCHAR(50)
);

--- Заполняем таблицу "Следит за"
insert into LooksAfter values('МТ856728', 'Терьер', 'Шарик', 'пн ср чт');
insert into LooksAfter values('МТ396027', 'Терьер', 'Тузик', 'вт сб');
insert into LooksAfter values('ОД164582', 'Британская кошка', 'Шпинат', 'пн ср чт');
insert into LooksAfter values('ОД835616', 'Британская кошка', 'Мурка', 'вт пт сб');
insert into LooksAfter values('ОД946382', 'Дворняжка', 'Хвостик', 'вт пт сб');
insert into LooksAfter values('МО697518', 'Дворняжка', 'Лапка', 'вт чт сб');
insert into LooksAfter values('МО725182', 'Дворняжка', 'Юля', 'пн ср чт');
insert into LooksAfter values('МО251474', 'Русская голубая', 'Фаянс', 'пн вт сб');
insert into LooksAfter values('МО251474', 'Мейнкун', 'Годзилла', 'чт пт сб');

SELECT * FROM LooksAfter;

--- Создаём таблицу "Покупает у"

CREATE TABLE BuysFrom(
SupAddress VARCHAR(80) CONSTRAINT SupplierRef REFERENCES Suppliers,
ShelterNo NUMERIC(3) CONSTRAINT BrRef REFERENCES ShelterBranches,
Discount NUMBER(3, 0) CONSTRAINT check_disc CHECK (Discount <= 100)
);

--- Заполняем таблицу "Покупает у"
insert into BuysFrom values('г. Мытищи, ул. Черномырдина, 52', 1, 15);
insert into BuysFrom values('г. Мытищи, пр. Семёнова, 25', 3, 20);
insert into BuysFrom values('г. Воскресенск, ул. Санталовская, 621', 7, 25);
insert into BuysFrom values('г. Воскресенск, ул. Гильфанского, 94', 7, 15);
insert into BuysFrom values('г. Одинцово, ул.  Ерёменская, 91', 2, 10);
insert into BuysFrom values('г. Одинцово, пер. Никонова, 15', 2, 5);
insert into BuysFrom values('г. Одинцово, ул. Потапова, 78', 2, 15);
insert into BuysFrom values('г. Москва, ул. Жарикова, 63', 2, 30);
insert into BuysFrom values('г. Москва, пер. Миронский, 123', 3, 25);
insert into BuysFrom values('г. Москва, ул. Ивановский, 106', 3, 20);
insert into BuysFrom values('г. Подольск, въезд Мхитаряна, 28', 6, 15);
insert into BuysFrom values('г. Подольск, ул. Гуревича, 39', 6, 50);
insert into BuysFrom values('г. Волоколамск, пр. Мира, 41', 5, 30);
insert into BuysFrom values('г. Руза, ул. Яблоневая, 77', 4, 25);

SELECT * FROM BuysFrom;

-- 1 Немного изменим тип данных в таблице ветеренарные клиники на случай, если у владельца будет номер не российского оператора:

ALTER TABLE VetClinic MODIFY PHONENUMBER Number(15, 0);
DESCRIBE vetclinic;


-- 2 Запрос: выведем клички крупных животных (будем считать крупным жив. от 7 кг), отсортируем по виду:

SELECT nickname, Species  
From animals
WHERE weight >= 7
ORDER BY Species;

-- 3 Выведем средний вес крупных животных и филиалы, где они живут:

SELECT ShelterNo, AVG(weight) as avg_weight
FROM animals
Group by ShelterNo
having AVG(weight) > 7;

-- 4 Выведем число уникальных пород животных при помощи вложенного запроса.

SELECT COUNT (DISTINCT Species) 
FROM animals;

-- 5 Заменим вместимость одного из филиалов, затем найдем общую вместимость всех филиалов:

UPDATE ShelterBranches 
SET branchcapacity = 70
where shelterno = '001';

SELECT SUM (branchcapacity)
FROM ShelterBranches;









