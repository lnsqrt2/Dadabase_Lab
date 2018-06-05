--工种
create table profession(
                job char(30) not NULL,
                level char(30) not NULL,
                BaseSalary char(30) not NULL,
                primary key (job,level)
                );
--基本信息
create table info(
                uid int PRIMARY key,
                job char(30) not NULL,
                level char(30) not NULL,
                uname char(30) not NULL,
                sex char(30) not NULL,
                email char(30),
                foreign key (job,level) references profession(job,level)
                );
--考勤
create table attendance(
                uid int PRIMARY key,
                absence int,
                rate char(10),
                foreign key (uid) references info(uid)
                );
--津贴
create table allowance(
                uid int not NULL,
                date char(30) not NULL,
                ExtraType char(30),
                ExtraHours char(30),
                ExtraDays char(30),
                ExtraGain char(30),
                primary key (uid,date),
                foreign key (uid) references info(uid)
                );
--工资
create table wages(
                uid int PRIMARY key,
                monthly int,
                annual int,
                foreign key (uid) references info(uid)
                );

--数据准备
insert into profession values('策划', '1', '20000');
insert into profession values('策划', '2', '30000');
insert into profession values('策划', '3', '50000');
insert into profession values('美术', '1', '8000');
insert into profession values('美术', '2', '15000');
insert into profession values('美术', '3', '25000');
insert into profession values('程序', '1', '8000');
insert into profession values('程序', '2', '10000');
insert into profession values('程序', '3', '20000');
insert into profession values('程序', '4', '30000');
insert into profession values('运营', '1', '5000');
insert into profession values('运营', '2', '8000');
insert into profession values('运营', '3', '10000');
insert into profession values('市场', '1', '6000');
insert into profession values('市场', '2', '12000');
insert into profession values('市场', '3', '15000');


insert into info values('1', '策划', '3', '陈星汉', '男', 'cxh@gmail.com');

insert into attendance values('1', '2', '90.5');

insert into allowance values('1', '2018-6-5', '总体设计', '2', '1', '500');

insert into wages values('1', '49900', '600400');