 drop table unit$Test;
 
 create table unit$Test (
 Id Integer,
 SirName varchar(20),
 LastName varchar(40),
 Age integer,
 Salary float,
 DOB date,
 Height integer
 Ceiling integer
);
 
 
 alter table unit$Test add primary key (Id);
 alter table unit$Test add unique  key (SirName, LastName);
 
 insert into unit$Test (Id, SirName, LastName, Age, Salary,DOB, Height,Ceiling)
 Values (1,"Payne","Ian", 68, 100000.50, DATE '1958-03-23',176,174);
  insert into unit$Test (Id, SirName, LastName, Age, Salary,DOB, Height,Ceiling)
 Values (2,"Payne","Ross", 64, 600000.50,DATE '1978-06-23',156,174);
  insert into unit$Test (Id, SirName, LastName, Age, Salary,DOB, Height,Ceiling)
 Values (3,"Payne","Paul", 61, 110000.50,DATE '2012-12-23',163,174);
  insert into unit$Test (Id, SirName, LastName, Age, Salary,DOB, Height,Ceiling)
 Values (4,"Payne","Janet", 33, 10000.50,DATE '1966-07-03',168,174);
  insert into unit$Test (Id, SirName, LastName, Age, Salary,DOB, Height,Ceiling)
 Values (5,"Smith","Mark", 12, 10.50,DATE '2012-08-23',174,174);
  insert into unit$Test (Id, SirName, LastName, Age, Salary,DOB, Height,Ceiling)
 Values (7,"Jones","Julia", 24, 130000.50,DATE '2022-03-23',179,174);
   insert into unit$Test (Id, SirName, LastName, Age, Salary,DOB, Height,Ceiling)
 Values (8,"Jones","Peter", 24, 140000.50,DATE '2017-01-03',188,174);
   insert into unit$Test (Id, SirName, LastName, Age, Salary,DOB, Height,Ceiling)
 Values (9,"Cocket","Phil", 24, 90000.50,DATE '2011-03-13',181,174);
 
 
create table test$Page (
 Id Integer,
 A  varchar(20),
 B varchar(40),
 C integer,
 D float
);

alter table test$Page add primary key (Id);

insert into test$Page (Id, A,B,C,D) Values (1,"A","AA",10,100.0);
insert into test$Page (Id, A,B,C,D) Values (2,"B","AB",11,110.0);
insert into test$Page (Id, A,B,C,D) Values (3,"C","AC",12,120.0);
insert into test$Page (Id, A,B,C,D) Values (4,"D","AD",13,130.0);
insert into test$Page (Id, A,B,C,D) Values (5,"E","AE",14,140.0);
insert into test$Page (Id, A,B,C,D) Values (6,"F","AF",15,150.0);
insert into test$Page (Id, A,B,C,D) Values (7,"G","AG",16,160.0);
insert into test$Page (Id, A,B,C,D) Values (8,"H","AH",17,170.0);
insert into test$Page (Id, A,B,C,D) Values (9,"I","AI",18,180.0);
insert into test$Page (Id, A,B,C,D) Values (10,"J","AJ",19,190.0);
 
insert into test$Page (Id, A,B,C,D) Values (11,"A","AA",10,100.0);
insert into test$Page (Id, A,B,C,D) Values (12,"B","AB",11,110.0);
insert into test$Page (Id, A,B,C,D) Values (13,"C","AC",12,120.0);
insert into test$Page (Id, A,B,C,D) Values (14,"D","AD",13,130.0);
insert into test$Page (Id, A,B,C,D) Values (15,"E","AE",14,140.0);
insert into test$Page (Id, A,B,C,D) Values (16,"F","AF",15,150.0);
insert into test$Page (Id, A,B,C,D) Values (17,"G","AG",16,160.0);
insert into test$Page (Id, A,B,C,D) Values (18,"H","AH",17,170.0);
insert into test$Page (Id, A,B,C,D) Values (19,"I","AI",18,180.0);
insert into test$Page (Id, A,B,C,D) Values (20,"J","AJ",19,190.0);

insert into test$Page (Id, A,B,C,D) Values (21,"A","AA",10,100.0);
insert into test$Page (Id, A,B,C,D) Values (22,"B","AB",11,110.0);
insert into test$Page (Id, A,B,C,D) Values (23,"C","AC",12,120.0);
insert into test$Page (Id, A,B,C,D) Values (24,"D","AD",13,130.0);
insert into test$Page (Id, A,B,C,D) Values (25,"E","AE",14,140.0);
insert into test$Page (Id, A,B,C,D) Values (26,"F","AF",15,150.0);
insert into test$Page (Id, A,B,C,D) Values (27,"G","AG",16,160.0);
insert into test$Page (Id, A,B,C,D) Values (28,"H","AH",17,170.0);
insert into test$Page (Id, A,B,C,D) Values (29,"I","AI",18,180.0);
insert into test$Page (Id, A,B,C,D) Values (30,"J","AJ",19,190.0);

insert into test$Page (Id, A,B,C,D) Values (31,"A","AA",10,100.0);
insert into test$Page (Id, A,B,C,D) Values (32,"B","AB",11,110.0);
insert into test$Page (Id, A,B,C,D) Values (33,"C","AC",12,120.0);
insert into test$Page (Id, A,B,C,D) Values (34,"D","AD",13,130.0);
insert into test$Page (Id, A,B,C,D) Values (35,"E","AE",14,140.0);
insert into test$Page (Id, A,B,C,D) Values (36,"F","AF",15,150.0);
insert into test$Page (Id, A,B,C,D) Values (37,"G","AG",16,160.0);
insert into test$Page (Id, A,B,C,D) Values (38,"H","AH",17,170.0);
insert into test$Page (Id, A,B,C,D) Values (39,"I","AI",18,180.0);
insert into test$Page (Id, A,B,C,D) Values (40,"J","AJ",19,190.0);