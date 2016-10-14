Clinic Table
create table clinic

(
clinicNO int not null primary key,
telNo varchar(11),
address varchar(255),
);
alter table clinic
add clinicName varchar (255);

alter table clinic
add openingHour varchar(255);

alter table clinic
add eTelNo varchar (11);

insert into clinic values (01,3860001,'address1 Avenue','8.00-21.00',2863000,'clinic1');
insert into clinic values (02,3860002,'address2 Avenue','8.00-21.00',2868000,'clinic2');
insert into clinic values (03,3860003,'address3 Avenue','8.00-21.00',2867000,'clinic3');
insert into clinic values (04,3860004'address4 Avenue','8.00-21.00',2866000,'clinic4');
insert into clinic values (05,3860005,'address5 Avenue','8.00-21.00',2865000,'clinic5');
insert into clinic values (06,3860006,'address6 Avenue','8.00-21.00',2864000,'clinic6');

Pet owner
create table petowner

(
ownerID int not null primary key,
oFName varchar (255),
oLName varchar (255),
clinicNo int foreign key references clinic (clinicNo)
);

alter table petowner
add addres varchar(255);

alter table petowner
add hTelNo varchar(255);

alter table petowner
add mTelNo varchar (255);

insert into petowner values (01,'Ryan','Sapp',01,'owner1 addreess Str',8484008,7581956);
insert into petowner values (02,'Jordan','Wilson',02,'owner2 addreess Str',3334444,75815695);
insert into petowner values (03,'Michael','Sapp',03,'owner3 addreess Str',8484008,7581957);


Pet Table
create table pet

(
petNo int not null primary key,
type varchar (64),
breed varchar (255),
sex varchar (16),
dob varchar (64)
);
alter table pet
add clinicNo int foreign key references clinic (clinicNo);

alter table pet
add ownerid int foreign key references petOwner (ownerid);

alter table pet
add petName varchar (255);

insert into pet values (01,'Dog','Terrier','Male','3 Feb 2012',01,01,'Wilfred');
insert into pet values (02,'Dog','Mastif','Female','4 Feb 2015',02,02,'SnoopaLoop');
insert into pet values (03,'Cat','Simaese','Male','5 March 2016',03,03,'Jordan');
insert into pet values (04,'Cat','Tabby','Female','6 March 2007',04,04,'Miley');
insert into pet values (05,'Rabit','American','male','6 March 2010',05,05,'Bugs');
insert into pet values (06,'Cat','Tabby','Female','4 December 2011',06,06,'IwishIwasADog');
	
Examination Table
create table examination

(
examNo int not null primary key 
);
alter table examination
add veterinaryId int foreign key references veterinary (veterinaryId);
alter table examination
add petNo int foreign key references pet (petNo);
alter table examination
add presDrugType varchar (255),
presPeriod varchar (255);

insert into examination values (1,1,'Anti-biotic',15,01);
insert into examination values (2,2,'Painkiller',14,02);
insert into examination values (3,3,'Behaviour modification',13,03);
insert into examination values (4,4,'Ear medication',12,04);
insert into examination values (5,5,'Skin medication',15,05);
insert into examination values (6,6,'Painkiller',10,06);

Appointment Table
create table appointment

(
appNo int not null primary key,
aDate varchar (255),
aTime varchar (255),
petNo int foreign key references pet (petNo),
ownerID int foreign key references petowner (ownerID),
veterinaryId int foreign key references veterinary (veterinaryId)
);
alter table appointment
add clinicNO int foreign key references clinic (clinicNO);

alter table appointment
alter column aDate date;

insert into	appointment values (01,'2 October 2010','10.00',1,1,1,1);
insert into	appointment values (02,'3 November 2009','10.35',2,2,2,2);
insert into	appointment values (03,'4 December 2009','13.00',3,3,3,3);
insert into	appointment values (04,'5 January 2010','15.00',4,4,4,4);
insert into	appointment values (05,'6 Feb 2010','18.00',5,5,5,5);
insert into	appointment values (06,'7 March 2010','9.00',6,6,6,6);

Invoice Table
create table invoice
(
invoiceNo int not null primary key,
ownerid int foreign key references petowner (ownerid),
amt int
);
alter table invoice
add examNo int foreign key references examination (examNo);

insert into invoice values (01,01,500,1);
insert into invoice values (02,02,2000,2);
insert into invoice values (03,03,400,3);
insert into invoice values (04,04,300,4);
insert into invoice values (05,05,1500,5);
insert into invoice values (06,06,750,6);

Veterinary Table
create table veterinary

(
veterinaryId int not null primary key,
name varchar (255),
Address varchar(255),
hTelNo varchar(255),
mTelNo varchar(255),
clinicBranch varchar (255),
specialise varchar(255)
);
select * from veterinary
alter table veterinary
add spspecialise varchar(255);

alter table veterinary
drop column clinicBranch;

alter table veterinary
add clinicNo int foreign key references clinic (clinicNo);

insert into veterinary values (01,'Jean','High Street Way 43',6358264,7595865,1,'dog');
insert into veterinary values (02,'Robbin','Lower Downtown 2',6582354,7362548,2,'cat');
insert into veterinary values (03,'Ricky','Market Ville Road',4582356,7586523,3,'rabit');
insert into veterinary values (04,'Rowan','Little China Road2',4582653,7263158,4,'dog');
insert into veterinary values (05,'Laksh','Havana Roadway',8596564,7236458,5,'rabit');
insert into veterinary values (06,'Hans','Talipos Road',4625687,7859584,6,'cat');