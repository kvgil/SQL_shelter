DROP TABLE ShelterBranches;
DROP TABLE Employees;
DROP TABLE Owners;
DROP TABLE Animals;
DROP TABLE VetClinic;
DROP TABLE Suppliers;
DROP TABLE LooksAfter;
DROP TABLE BuysFrom;

--- ������ ������� "�������"
CREATE TABLE ShelterBranches(
ShelterNo NUMERIC(3) CONSTRAINT pk_br PRIMARY KEY,
BranchCity VARCHAR(50),
BranchAddress VARCHAR(150),
BranchCapacity INT
);

--- ��������� ������� "�������"
insert into ShelterBranches values(001, '������', '��. ������������, 22', 50);
insert into ShelterBranches values(002, '��������', '��. �������������, 72', 80);
insert into ShelterBranches values(003, '������', '���. ������������, 155', 130);
insert into ShelterBranches values(004, '����', '��. ������, 192', 30);
insert into ShelterBranches values(005, '�����������', '��. �����, 361', 60);
insert into ShelterBranches values(006, '��������', '����� ������, 8', 40);
insert into ShelterBranches values(007, '�����������', '��. ��������, 93', 70);
SELECT * FROM ShelterBranches;

--- ������ ������� "����������"
CREATE TABLE Employees(
EmployeeID VARCHAR(30) NOT NULL PRIMARY KEY,
EmployeeName VARCHAR(90) NOT NULL,
EmployeePath VARCHAR(512) NOT NULL,
EmplyeeSex VARCHAR(30) CONSTRAINT check_sex CHECK (EmplyeeSex LIKE '���' OR EmplyeeSex LIKE '���'),
EmplyeeBirth DATE,
EmployeePosition VARCHAR(100) NOT NULL,
ShelterNo NUMERIC(3) CONSTRAINT ref_branch REFERENCES ShelterBranches
);

--- ��������� ������� "����������"
insert into Employees values('��341541', '�������� �.�.', '1', '���', '27.01.1973', '��������', 1);
insert into Employees values('��856728', '����� �.�.', '1.1', '���', '04.10.1985', '���������� �� ������', 1);
insert into Employees values('��396027', '��������� �.�.', '1.2', '���', '05.12.1998', '���������� �� �������', 1);
insert into Employees values('��395724', '������� �.�.', '2', '���', '14.01.1991', '��������', 2);
insert into Employees values('��164582', '������ �.�.', '2.1', '���', '17.05.1997', '���������� �� ������', 2);
insert into Employees values('��835616', '������ �.�.', '2.2', '���', '29.03.2000', '���������� �� �������', 2);
insert into Employees values('��946382', '����������� �.�.', '2.2.1', '���', '11.04.1993', '���������������', 2);
insert into Employees values('��961582', '�������� �.�.', '3', '���', '21.06.1989', '��������', 3);
insert into Employees values('��697518', '�������� �.�.', '3.1', '���', '17.02.1995', '���������� �� ������', 3);
insert into Employees values('��725182', '��������� �.�.', '3.2', '���', '19.12.1996', '���������� �� �������', 3);
insert into Employees values('��251474', '���������� �.�.', '3.2.1', '���', '16.10.1999', '��������', 3);
insert into Employees values('��738127', '��������� �.�.', '4', '���', '10.05.1987', '��������', 4);
insert into Employees values('��266481', '�������� �.�.', '5', '���', '18.07.1984', '��������', 5);
insert into Employees values('��827634', '�������� �.�.', '5.1', '���', '16.01.1999', '��������', 5);
insert into Employees values('��182736', '������� �.�.', '6', '���', '05.02.1979', '��������', 6);
insert into Employees values('��103723', '�������� �.�.', '7', '���', '13.06.1978', '��������', 7);
insert into Employees values('��736482', '�������� �.�.', '7.1', '���', '23.09.1993', '���������� �� �������', 7);

SELECT * FROM Employees;

--- ������ ������� "�������"

CREATE TABLE Owners(
OwnerID VARCHAR2(80) NOT NULL PRIMARY KEY,
OwnerName VARCHAR(80),
OwnerBirthDate DATE,
OwnerCity VARCHAR(80),
OwnerAddress VARCHAR(80)
);

--- ��������� ������� "�������"
insert into Owners values('��7212', '�������� �.�.', '23.01.1998', '������', '��. ��������, 221');
insert into Owners values('��7823', '���������� �.�.', '07.05.1997', '������', '��. �������, 20');
insert into Owners values('��2134', '��������� �.�.', '05.11.1978', '������', '���. ������������, 12');
insert into Owners values('��9878', '������� �.�.', '14.07.1991', '��������', '��.���������������, 204');
insert into Owners values('��1567', '��������� �.�.', '04.10.1977', '������', '��. �������, 59');
insert into Owners values('��9983', '����� �.�.', '19.04.2000', '��������', '��. ������, 37');
insert into Owners values('��9567', '������������ �.�.', '01.04.1993', '����', '��. ��������, 99');
insert into Owners values('��8123', '���������� �.�.', '21.06.1989', '������', '���. ����������, 15');
insert into Owners values('��6781', '������� �.�.', '07.08.1996', '��������', '��. 1905 ����, 44');
insert into Owners values('��8291', '�������� �.�.', '19.02.1984', '�����������', '��. �������������, 26');
insert into Owners values('��9021', '����� �.�.', '26.12.1979', '��������', '��. ���������, 3');

SELECT * FROM Owners;

--- ������ ������� "��������"
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

--- ��������� ������� "��������"
insert into Animals values('������', '�����', 6.2, 2016, '������', 1, '��7212');
insert into Animals values('������', '�����', 5.7, 2017, '���������', 1, '��7823');
insert into Animals values('�������', '����', 15.2, 2017, '�������', 2, '��9878');
insert into Animals values('�������', '������', 14.7, 2017, '������', 2, '��9878');
insert into Animals values('���������', '�������', 9.8, 2014, '����������', 2, '��1567');
insert into Animals values('���������', '�����', 8.9, 2015, '��������', 3, '��2134');
insert into Animals values('���������', '���', 6.2, 2018, '�����', 3, '��2134');
insert into Animals values('���������', '�����', 9.2, 2016, '�������', 3, '��8123');
insert into Animals values('���������� �����', '������', 5.4, 2019, '��������', 4, '��9567');
insert into Animals values('���������� �����', '������', 6.2, 2018, '������', 4, '��9567');
insert into Animals values('���������� �����', '�����', 2.5, 2020, '��������� ������', 5, '��8291');
insert into Animals values('������� �������', '����', 4.8, 2019, '�������', 5, '��8291');
insert into Animals values('������� �������', '�����', 2.5, 2020, '������', 6, '��9021');
insert into Animals values('�������', '��������', 7.1, 2019, '������', 7, '��9983');

SELECT * FROM Animals;

--- ������ ������� "������������ �������"

CREATE TABLE VetClinic(
ClinicName VARCHAR(80),
ClinicCity VARCHAR(80),
ClinicAddress VARCHAR(180),
PhoneNumber NUMBER(11, 0),
CONSTRAINT ClinicInfo PRIMARY KEY (ClinicCity, ClinicName)
);

--- ��������� ������� "������������ �������"
insert into VetClinic values('��� �����', '������', '��. ������������, 10', 79146478364);
insert into VetClinic values('������� ������', '�����������', '��. ����, 212', 79637589123);
insert into VetClinic values('��������', '��������', '��. ��������, 47', 79836789128);
insert into VetClinic values('������� ������', '������', '���. ��������, 82', 79314513727);
insert into VetClinic values('�������', '��������', '����� ��������, 55', 79710982301);
insert into VetClinic values('��� �����', '�����������', '��. ����������, 1231', 79276927163);
insert into VetClinic values('����������', '����', '��. ��������, 3', 79126534091);

SELECT * FROM VetClinic;

--- ������ ������� "����������"

CREATE TABLE Suppliers(
SupAddress VARCHAR(80) PRIMARY KEY,
SupName VARCHAR(80),
Goods Varchar(80)
);

--- ��������� ������� "����������"
insert into Suppliers values('�. ������, ��. ������������, 52', '��� � �����', '���� ��� ��������');
insert into Suppliers values('�. ������, ��. �������, 25', '�������', '�����������');
insert into Suppliers values('�. �����������, ��. ������������, 621', '������', '���� ��� ��������');
insert into Suppliers values('�. �����������, ��. ������������, 94', '���� ��������', '�������, �������');
insert into Suppliers values('�. ��������, ��.  ���������, 91', '��� � �����', '���� ��� ��������');
insert into Suppliers values('�. ��������, ���. ��������, 15', '�������', '�����������');
insert into Suppliers values('�. ��������, ��. ��������, 78', '���� ��������', '�������, �������');
insert into Suppliers values('�. ������, ��. ��������, 63', '������', '���� ��� ��������');
insert into Suppliers values('�. ������, ���. ���������, 123', '������� ���������', '�����������');
insert into Suppliers values('�. ������, ��. ����������, 106', '���� ��������', '�������, �������');
insert into Suppliers values('�. ��������, ����� ���������, 28', '������� ���������', '�����������');
insert into Suppliers values('�. ��������, ��. ��������, 39', '���� ��������', '�������, �������');
insert into Suppliers values('�. �����������, ��. ����, 41', '�������', '�����������');
insert into Suppliers values('�. ����, ��. ���������, 77', '������', '���� ��� ��������');

SELECT * FROM Suppliers;

--- ������ ������� "������ ��"

CREATE TABLE LooksAfter(
EmployeeID VARCHAR(30) CONSTRAINT looks_aft REFERENCES Employees,
Species VARCHAR(50),
Nickname VARCHAR(50),
CONSTRAINT SpNick FOREIGN KEY (Species, Nickname) REFERENCES Animals (Species, Nickname),
WorkingDays VARCHAR(50)
);

--- ��������� ������� "������ ��"
insert into LooksAfter values('��856728', '������', '�����', '�� �� ��');
insert into LooksAfter values('��396027', '������', '�����', '�� ��');
insert into LooksAfter values('��164582', '���������� �����', '������', '�� �� ��');
insert into LooksAfter values('��835616', '���������� �����', '�����', '�� �� ��');
insert into LooksAfter values('��946382', '���������', '�������', '�� �� ��');
insert into LooksAfter values('��697518', '���������', '�����', '�� �� ��');
insert into LooksAfter values('��725182', '���������', '���', '�� �� ��');
insert into LooksAfter values('��251474', '������� �������', '�����', '�� �� ��');
insert into LooksAfter values('��251474', '�������', '��������', '�� �� ��');

SELECT * FROM LooksAfter;

--- ������ ������� "�������� �"

CREATE TABLE BuysFrom(
SupAddress VARCHAR(80) CONSTRAINT SupplierRef REFERENCES Suppliers,
ShelterNo NUMERIC(3) CONSTRAINT BrRef REFERENCES ShelterBranches,
Discount NUMBER(3, 0) CONSTRAINT check_disc CHECK (Discount <= 100)
);

--- ��������� ������� "�������� �"
insert into BuysFrom values('�. ������, ��. ������������, 52', 1, 15);
insert into BuysFrom values('�. ������, ��. �������, 25', 3, 20);
insert into BuysFrom values('�. �����������, ��. ������������, 621', 7, 25);
insert into BuysFrom values('�. �����������, ��. ������������, 94', 7, 15);
insert into BuysFrom values('�. ��������, ��.  ���������, 91', 2, 10);
insert into BuysFrom values('�. ��������, ���. ��������, 15', 2, 5);
insert into BuysFrom values('�. ��������, ��. ��������, 78', 2, 15);
insert into BuysFrom values('�. ������, ��. ��������, 63', 2, 30);
insert into BuysFrom values('�. ������, ���. ���������, 123', 3, 25);
insert into BuysFrom values('�. ������, ��. ����������, 106', 3, 20);
insert into BuysFrom values('�. ��������, ����� ���������, 28', 6, 15);
insert into BuysFrom values('�. ��������, ��. ��������, 39', 6, 50);
insert into BuysFrom values('�. �����������, ��. ����, 41', 5, 30);
insert into BuysFrom values('�. ����, ��. ���������, 77', 4, 25);

SELECT * FROM BuysFrom;

-- 1 ������� ������� ��� ������ � ������� ������������ ������� �� ������, ���� � ��������� ����� ����� �� ����������� ���������:

ALTER TABLE VetClinic MODIFY PHONENUMBER Number(15, 0);
DESCRIBE vetclinic;


-- 2 ������: ������� ������ ������� �������� (����� ������� ������� ���. �� 7 ��), ����������� �� ����:

SELECT nickname, Species  
From animals
WHERE weight >= 7
ORDER BY Species;

-- 3 ������� ������� ��� ������� �������� � �������, ��� ��� �����:

SELECT ShelterNo, AVG(weight) as avg_weight
FROM animals
Group by ShelterNo
having AVG(weight) > 7;

-- 4 ������� ����� ���������� ����� �������� ��� ������ ���������� �������.

SELECT COUNT (DISTINCT Species) 
FROM animals;

-- 5 ������� ����������� ������ �� ��������, ����� ������ ����� ����������� ���� ��������:

UPDATE ShelterBranches 
SET branchcapacity = 70
where shelterno = '001';

SELECT SUM (branchcapacity)
FROM ShelterBranches;









