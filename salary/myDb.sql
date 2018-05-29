--创建员工基本信息表

primary key (Sno,Cno),    /*主码由两个属性构成*/
foreign key (Sno) references Student(Sno)


create table attendance(
                a 
                );
create table profession(
                job char(30) PRIMARY key,
                level char(30) not NULL,
                BaseSalary char(30) not NULL
                );

create table allowance(
                uid int PRIMARY key,
                ExtraHours char(30),
                ExtraType char(30),
                ExtraDays char(30),
                ExtraGain char(30),
                primary key (uid,ExtraGain),
                foreign key (uid) references info(uid)
                );

create table info(
                uid int PRIMARY key,
                job char(30) not NULL,
                uname char(30) not NULL,
                sex char(30) not NULL,
                email char(30),
                foreign key (job) references profession(job)
                );
salary

--数据准备
insert into info values('1', '主策', '陈星汉', '男', 'cxh@gmail.com');