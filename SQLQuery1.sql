--1.�������ݿ�
--CREATE DATABASE movie;
  Use movie;
  Go
--2.����5����
  -- create table FILM(FID int PRIMARY key,
	-- 				FNAME char(30) not NULL,
	-- 				FTYPE char(10) not NULL,
	-- 				DNAME char(30) not NULL,
	-- 				length int not NULL,
	-- 				IS3D char(1) not NULL,
	-- 				GRADE int);
  -- create table ACTOR(ACTID int PRIMARY key,
	-- 				ANAME char(30) not NULL, 
	-- 				SEX char(2) not NULL,
	-- 				BYEAR int not NULL);
  -- create table ACTIN(ACTID int not NULL,
	-- 				FID int not NULL,
	-- 				ISLEADING char(1),
	-- 				GRADE int);
  -- create table THEATER(TID int PRIMARY key,
	-- 				TNAME char(20) not NULL,
	-- 				TAREA char(20) not NULL, 
	-- 				ADDRESS char(30) not NULL);
  -- create table SHOW(FID int not NULL,
	-- 				TID int not NULL,
	-- 				PRICE int not NULL,
	-- 				YEAR int not NULL,
	-- 				MONTH int not NULL);
	-- create table TEST1(FNAME char(30) not NULL);
	
	--3.����׼��
  -- insert into FILM values('1', '����', 'ϲ��', '���ǳ�', 95, 'N', 87);
  -- insert into FILM values('2', 'ս��', '����Ƭ', '�⾩', 96, 'Y', 69);
  -- insert into FILM values('3', 'ս��2', '����Ƭ', '�⾩', 123, 'Y', 81);
  -- insert into FILM values('4', '���е�2', '����Ƭ', '����ɭ', 123, 'N', 88);
  -- insert into FILM values('5', 'Ӣ�۱�ɫ', 'ǹսƬ', '����ɭ', 95, 'N', 91);
  -- insert into FILM values('6', '���η���ƪ', 'ϲ��', '���', 108, 'Y', 60);
	-- insert into FILM values('8', 'Ф��˵ľ���', '����Ƭ', '�����ˡ���������', 142, 'N', 96);
  
  -- insert into ACTOR values('1','���ǳ�', '��', 1962);
  -- insert into ACTOR values('2','�⾩', '��', 1974);
  -- insert into ACTOR values('3','��ķ��³˹', '��', 1962);
  -- insert into ACTOR values('4','����', '��', 1955);
  -- insert into ACTOR values('5','�ź�', '��', 1984);
  -- insert into ACTOR values('6','���ෲ', '��', 1990);

  -- insert into ACTIN values('1','1', 'Y', 84);
  -- insert into ACTIN values('2','2', 'Y', 78);
  -- insert into ACTIN values('3','4', 'N', 93);
  -- insert into ACTIN values('4','5', 'N', 87);
  -- insert into ACTIN values('5','3', 'N', 55);
	-- insert into ACTIN values('6','6', 'Y', 25);
		
	-- insert into THEATER values('1', '�����ֵ�ӰԺ', '��ɽ��', '��ɽ���519��');
	-- insert into THEATER values('2', '������Ӱ��', '�����', '�б�·166��');
	-- insert into THEATER values('3', '��Ӱ���Ӱ��', '��ɽ��', '����·726��');
	-- insert into THEATER values('4', '���������Ӱ��', '�����', '���·464��');
	-- insert into THEATER values('5', 'Ħ������ӰԺ', '������', '��Ŵ��690��');

	-- insert into SHOW values('1', '1', '35', '2004','12');
	-- insert into SHOW values('1', '2', '36', '2015','4');
	-- insert into SHOW values('2', '2', '50', '2015','4');
	-- insert into SHOW values('3', '3', '75', '2017','7');
	-- insert into SHOW values('4', '4', '20', '2000','5');
	-- insert into SHOW values('5', '5', '100', '2018','1');
	-- insert into SHOW values('2', '1', '111', '2017','1');
	-- insert into SHOW values('2', '3', '133', '2017','5');
	-- insert into SHOW values('2', '4', '144', '2017','10');
	-- insert into SHOW values('2', '5', '124', '2013','6');
	-- insert into SHOW values('4', '3', '43', '2018','9');

	--4 �ֱ���һ��sql�����ɶԵ�Ӱ�����������ɾ���ĵĲ���
	--insert into SHOW values('5', '1', '1000', '2019','11');
	--update SHOW set YEAR = 1999 where PRICE = 1000;
	--delete from SHOW where TID='1' and FID = '5';

	--5 ���������
	
	-- create table YOUNG_ACTOR(ACTID int PRIMARY key,
	-- 				ANAME char(30) not NULL, 
	-- 				SEX char(2) not NULL,
	-- 				BYEAR int not NULL);
	-- INSERT INTO YOUNG_ACTOR(ACTID,ANAME,SEX,BYEAR)
	-- (
	-- 		select ACTID,ANAME,SEX,BYEAR
	-- 		from ACTOR
	-- 		where BYEAR >= 1990
	-- )

	--6 �۲���ʵ�飬�����ظ�Ԫ��
	-- insert into TEST1 values('WA');
	-- insert into TEST1 values('WA');
	-- UPDATE TEST1 SET FNAME = 'NOOOO' WHERE FNAME = 'WA';
	--delete from TEST1 where FNAME='NOOOO';

	--7 ������ͼ
	-- create VIEW young_leading(ACTID,ANAME,BYEAR,LEADING_NUMBER, MAX_GRADE)
	-- 	as select ACTIN.ACTID, ANAME,BYEAR,COUNT(ACTIN.FID), MAX(FILM.GRADE)
	-- 	from ACTIN, ACTOR, FILM
	-- 	where ACTIN.ISLEADING = 'Y'
	-- 		and ACTIN.ACTID=ACTOR.ACTID
	-- 		and ACTIN.FID = FILM.FID
	-- 		and ACTOR.BYEAR >= 1980
	-- 	GROUP BY ACTIN.ACTID, ANAME,BYEAR;

	--8 ������
	-- CREATE TRIGGER zhouxingchi 
	-- 	ON  FILM 
	-- 	AFTER INSERT
	-- AS 
	-- BEGIN
	-- 	-- SET NOCOUNT ON added to prevent extra result sets from
	-- 	-- interfering with SELECT statements.
	-- 	UPDATE FILM SET FTYPE = 'ϲ��'
	-- 	WHERE DNAME= '���ǳ�';
	-- -- Insert statements for trigger here
	-- END
	--insert into FILM values('7', '����7��', '��', '���ǳ�', 87, 'N', 66)

	--��ѯ1
	--��ս�ǡ��ⲿ��Ӱ�ں�ɽ������ӰԺ��2017�����ӳ�����
	--��������ӳ���·ݵĽ�������
	-- select SHOW.FID,SHOW.TID,FNAME,TNAME,TAREA,PRICE,YEAR,MONTH
	-- from SHOW,FILM,THEATER
	-- WHERE FNAME ='ս��' AND
	-- 			THEATER.TAREA = '��ɽ��' AND
	-- 			SHOW.FID = FILM.FID AND
	-- 			SHOW.TID = THEATER.TID AND
	-- 			SHOW.YEAR = '2017' 
	-- ORDER BY SHOW.MONTH DESC;

	--��ѯ2
	--��ѯ�����޲�����Ա��Ϣ�ĵ�Ӱ�Ļ�����Ϣ
  -- ���ҽ�������յ�Ӱ���͵��������У�
  -- ��ͬ���͵ĵ�Ӱ�����û����ֵĽ�������
	-- select *
	-- from FILM
	-- WHERE NOT EXISTS
	-- 					(
	-- 						SELECT *
	-- 						FROM ACTIN
	-- 						WHERE ACTIN.FID = FILM.FID
	-- 					)
	-- ORDER BY FILM.FTYPE DESC;
	
	--��ѯ3
	--��ѯ����ֱ��2017����δ��ӳ�ĵ�Ӱ��š���Ӱ���ơ���������
  -- select FILM.FID, FILM.FNAME,FILM.DNAME
  -- FROM SHOW, FILM
  -- WHERE FILM.FID = SHOW.FID AND
	-- 			SHOW.YEAR >2017;

	--��ѯ4
	--��ѯ�ڸ��ҵ�ӰԺ����ӳ���ĵ�Ӱ���
	-- select FILM.FID
	-- FROM FILM,SHOW
	-- WHERE SHOW.FID=FILM.FID AND
	-- 			SHOW.TID = '1' AND
	-- 			SHOW.TID = '2' AND
	-- 			SHOW.TID = '3' AND
	-- 			SHOW.TID = '4' AND
	-- 			SHOW.TID = '5';

	--��ѯ5
  -- ��ѯ�����û����ֵ���80�ֻ��߸���89�ֵĵ�Ӱ���
  -- ��Ӱ���ơ��������������û����֣�Ҫ��where�Ӿ���ֻ����һ���������ʽ
	-- select FID,FNAME,DNAME,GRADE
	-- from FILM
	-- where GRADE<80 OR
	-- 			GRADE>89;

	--��ѯ10
	--��ѯÿ����Ա�������ǵĵ�Ӱ�е�ƽ���û�����
	-- select ANAME,AVG(FILM.GRADE)
	-- from FILM,ACTIN,ACTOR
	-- where FILM.FID = ACTIN.FID AND
	-- 			ACTOR.ACTID = ACTIN.ACTID AND
	-- 			ACTIN.ISLEADING = 'Y'
	-- GROUP BY ANAME;

	--��ѯ15
	--��ѯ����
  --��ս�ǡ�ϵ�еĵ�Ӱ�ı�š���Ӱ���ơ���ӳ��ӰԺ���Ƽ�����ӳ���£�������յ�Ӱ���Ƶ���������
	-- select FILM.FID,FNAME,TNAME,YEAR,MONTH
	-- from FILM,SHOW,THEATER
	-- where (FILM.FID = SHOW.FID AND
	-- 			SHOW.TID = THEATER.TID AND
	-- 			FNAME = 'ս��') OR
	-- 			(FILM.FID = SHOW.FID AND
	-- 			SHOW.TID = THEATER.TID AND
	-- 			FNAME = 'ս��2')
	-- ORDER BY FNAME;

	--��ѯ16
	--��ѯ��ͬһ��������ӳ1�ź�2�ŵ�Ӱ��ӰԺ��ţ�2��ӰԺ��

	--��ѯ18
	--��ѯ���ݹ�������ɭ��ִ���������е�Ӱ����Ա����
	select ANAME
	from ACTOR,ACTIN,FILM
	WHERE FILM.DNAME='����ɭ' AND
				ACTIN.FID = FILM.FID;

	--��ѯ20
	--��ѯ������ӳ����3�ε�û���û����ֵĵ�Ӱ��š�����