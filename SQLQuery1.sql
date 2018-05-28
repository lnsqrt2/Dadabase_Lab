--1.创建数据库
--CREATE DATABASE movie;
  Use movie;
  Go
--2.创建5个表
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
	
	--3.数据准备
  -- insert into FILM values('1', '功夫', '喜剧', '周星驰', 95, 'N', 87);
  -- insert into FILM values('2', '战狼', '动作片', '吴京', 96, 'Y', 69);
  -- insert into FILM values('3', '战狼2', '动作片', '吴京', 123, 'Y', 81);
  -- insert into FILM values('4', '碟中谍2', '警匪片', '吴宇森', 123, 'N', 88);
  -- insert into FILM values('5', '英雄本色', '枪战片', '吴宇森', 95, 'N', 91);
  -- insert into FILM values('6', '西游伏妖篇', '喜剧', '徐克', 108, 'Y', 60);
	-- insert into FILM values('8', '肖申克的救赎', '剧情片', '弗兰克·达拉邦特', 142, 'N', 96);
  
  -- insert into ACTOR values('1','周星驰', '男', 1962);
  -- insert into ACTOR values('2','吴京', '男', 1974);
  -- insert into ACTOR values('3','汤姆克鲁斯', '男', 1962);
  -- insert into ACTOR values('4','周润发', '男', 1955);
  -- insert into ACTOR values('5','张翰', '男', 1984);
  -- insert into ACTOR values('6','吴亦凡', '男', 1990);

  -- insert into ACTIN values('1','1', 'Y', 84);
  -- insert into ACTIN values('2','2', 'Y', 78);
  -- insert into ACTIN values('3','4', 'N', 93);
  -- insert into ACTIN values('4','5', 'N', 87);
  -- insert into ACTIN values('5','3', 'N', 55);
	-- insert into ACTIN values('6','6', 'Y', 25);
		
	-- insert into THEATER values('1', '华谊兄弟影院', '洪山区', '关山大道519号');
	-- insert into THEATER values('2', '万达国际影城', '武昌区', '中北路166号');
	-- insert into THEATER values('3', '中影天河影城', '洪山区', '珞喻路726号');
	-- insert into THEATER values('4', '江汉环球电影城', '武昌区', '解放路464号');
	-- insert into THEATER values('5', '摩尔国际影院', '江汉区', '解放大道690号');

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

	--4 分别用一条sql语句完成对电影表基本的增、删、改的操作
	--insert into SHOW values('5', '1', '1000', '2019','11');
	--update SHOW set YEAR = 1999 where PRICE = 1000;
	--delete from SHOW where TID='1' and FID = '5';

	--5 批处理操作
	
	create table YOUNG_ACTOR(ACTID int PRIMARY key,
					ANAME char(30) not NULL, 
					SEX char(2) not NULL,
					BYEAR int not NULL);
	INSERT INTO YOUNG_ACTOR(ACTID,ANAME,SEX,BYEAR)
	(
			select ACTID,ANAME,SEX,BYEAR
			from ACTOR
			where BYEAR >= 1990
	)

	--6 观察性实验，插入重复元祖
	insert into TEST1 values('WA');
	insert into TEST1 values('WA');
	UPDATE TEST1 SET FNAME = 'NOOOO' WHERE FNAME = 'WA';
	delete from TEST1 where FNAME='NOOOO';

	--7 创建视图
	create VIEW young_leading(ACTID,ANAME,BYEAR,LEADING_NUMBER, MAX_GRADE)
		as select ACTIN.ACTID, ANAME,BYEAR,COUNT(ACTIN.FID), MAX(FILM.GRADE)
		from ACTIN, ACTOR, FILM
		where ACTIN.ISLEADING = 'Y'
			and ACTIN.ACTID=ACTOR.ACTID
			and ACTIN.FID = FILM.FID
			and ACTOR.BYEAR >= 1980
		GROUP BY ACTIN.ACTID, ANAME,BYEAR;

	8 触发器
	CREATE TRIGGER zhouxingchi 
		ON  FILM 
		AFTER INSERT
	AS 
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		UPDATE FILM SET FTYPE = '喜剧'
		WHERE DNAME= '周星驰';
	-- Insert statements for trigger here
	END
	insert into FILM values('7', '长江7号', '剧', '周星驰', 87, 'N', 66)

	--查询1 ok
	--“战狼”这部电影在洪山区各家影院的2017年的上映情况，
	--并按照上映的月份的降序排列
	select SHOW.FID,SHOW.TID,FNAME,TNAME,TAREA,PRICE,YEAR,MONTH
	from SHOW,FILM,THEATER
	WHERE FNAME ='战狼' AND
				THEATER.TAREA = '洪山区' AND
				SHOW.FID = FILM.FID AND
				SHOW.TID = THEATER.TID AND
				SHOW.YEAR = '2017' 
	ORDER BY SHOW.MONTH DESC;

	--查询2 ok
	--查询所有无参演演员信息的电影的基本信息
  -- 并且将结果按照电影类型的升序排列，
  -- 相同类型的电影则按照用户评分的降序排列
	select *
	from FILM
	WHERE NOT EXISTS
						(
							SELECT *
							FROM ACTIN
							WHERE ACTIN.FID = FILM.FID
						)
	ORDER BY FILM.FTYPE DESC;
	
	--查询3 ok
	--查询所有直到2017年仍未上映的电影编号、电影名称、导演姓名
  select FILM.FID, FILM.FNAME,FILM.DNAME
  FROM SHOW, FILM
  WHERE FILM.FID = SHOW.FID AND
				SHOW.YEAR >2017;

	--查询4
	--查询在各家电影院均上映过的电影编号
	--没有一家影院是它没上映过的
	select DISTINCT FID
	FROM FILM
	WHERE NOT EXISTS
				(
					SELECT *
					FROM THEATER
					WHERE NOT EXISTS
								(
									SELECT *
									FROM SHOW
									WHERE FILM.FID = SHOW.FID AND
										  	THEATER.TID = SHOW.TID
								)
				);
	
	--查询5
  -- 查询所有用户评分低于80分或者高于89分的电影编号
  -- 电影名称、导演姓名及其用户评分，要求where子句中只能有一个条件表达式
	select FID,FNAME,DNAME,GRADE
	from FILM
	where  GRADE NOT BETWEEN 80 AND 89;

	--查询6
	--查询每个导演所执导的全部影片的最低和最高用户评分
	SELECT DNAME,MAX(GRADE)最高分,MIN(GRADE)最低分
	FROM FILM
	GROUP BY DNAME;

	--查询7
	--查询至少执导过2部电影的导演姓名、执导电影数量
	select DNAME,count(FID)电影数量
	from FILM
	group by DNAME   
	having count(FID)>=2;

	--查询8
	--查询至少2部电影的用户评分超过80分的导演及其执导过的影片数量、平均用户评分
	SELECT DNAME,count(FID)电影数量,AVG(GRADE)平均用户评分
	FROM FILM
	where grade >80
	group by DNAME
	HAVING count(*)>=2;

	--查询9
	--查询至少执导过2部电影的导演姓名以及跟这些导演合作过的演员编号、姓名
	select DNAME,ACTIN.ACTID,ANAME
	from FILM,ACTIN,ACTOR
	WHERE DNAME =ANY
	(SELECT DNAME
	FROM FILM
	group by DNAME
	HAVING count(*)>=2)
	AND ACTIN.FID = FILM.FID
	AND ACTIN.ACTID = ACTOR.ACTID;

	--查询10
	--查询每个演员担任主角的电影中的平均用户评分
	select ANAME,AVG(FILM.GRADE)
	from FILM,ACTIN,ACTOR
	where FILM.FID = ACTIN.FID AND
				ACTOR.ACTID = ACTIN.ACTID AND
				ACTIN.ISLEADING = 'Y'
	GROUP BY ANAME;

	--查询11
	--查询用户评分超过90分的电影的最早上映年月
	select top 1*
	from SHOW
	where FID IN
						(
							SELECT FID
							FROM FILM
							WHERE GRADE >90
						)
	order by YEAR,MONTH;

	--查询12
	--查询用户评分超过90分的电影的最早上映年月及其相应的上映影院编号
	select top 1*
	from SHOW
	where FID IN
						(
							SELECT FID
							FROM FILM
							WHERE GRADE >90
						)
	order by YEAR,MONTH;

	--查询13
	--查询每个电影的上映总次数
	SELECT FID,COUNT(*)上映次数
	from SHOW
	GROUP BY FID;

	--查询14
	--查询执导过动作片，或者警匪片，或者枪战片的导演的姓名，要求where子句中只能有一个条件表达式
	SELECT DNAME
	FROM FILM
	WHERE FTYPE = '动作片'
	UNION
	SELECT DNAME
	FROM FILM
	WHERE FTYPE = '警匪片'
	UNION
	SELECT DNAME
	FROM FILM
	WHERE FTYPE = '枪战片';

	--查询15
	--查询所有
  --“战狼”系列的电影的编号、电影名称、上映电影院名称及其上映年月，结果按照电影名称的升序排列
	select FILM.FID,FNAME,TNAME,YEAR,MONTH
	from FILM,SHOW,THEATER
	where (FILM.FID = SHOW.FID AND
				SHOW.TID = THEATER.TID AND
				FNAME = '战狼') OR
				(FILM.FID = SHOW.FID AND
				SHOW.TID = THEATER.TID AND
				FNAME = '战狼2')
	ORDER BY FNAME;

	--查询16
	--查询在同一个年月上映1号和2号电影的影院编号（2号影院）
	SELECT TID
	FROM SHOW
	WHERE FID = 1 AND
				YEAR =ANY(SELECT YEAR
								FROM SHOW
								WHERE FID =2) AND
				MONTH =ANY(SELECT MONTH
								FROM SHOW
								WHERE FID =2);

	--查询17
	--查询所有没参演过用户评分85分以下电影的演员的编号、姓名
	SELECT ACTIN.ACTID,ANAME
	FROM ACTOR,ACTIN
	WHERE FID != ALL(
										SELECT FID
										FROM FILM
										WHERE GRADE <85
									) AND
				ACTOR.ACTID = ACTIN.ACTID;

	--查询18
	--查询参演过“吴宇森”执导过的所有电影的演员姓名
	--没有一部吴宇森的电影是他没有参演过的
	select ANAME
	FROM ACTOR
	WHERE NOT EXISTS
				(
					SELECT *
					FROM FILM
					WHERE NOT EXISTS
								(
									SELECT *
									FROM ACTIN
									WHERE FILM.FID = ACTIN.FID AND
												ACTIN.ACTID = ACTOR.ACTID
								)
								AND DNAME = '吴宇森'
				);

	--查询19
	--查询所有的演员的编号、姓名及其参演过的电影名称，要求即使该演员未参演过任何电影也要能够输出其编号、姓名
	SELECT ACTOR.ACTID,ANAME,FNAME
	FROM ACTOR,ACTIN,FILM
	WHERE (FILM.FID = ACTIN.FID AND
				ACTIN.ACTID = ACTOR.ACTID)OR
				(NOT EXISTS(SELECT *
									FROM ACTOR
									WHERE ACTIN.ACTID = ACTOR.ACTID)
				);

	--查询20
	--查询所有上映超过3次但没有用户评分的电影编号、名称
	SELECT FID,FNAME
	FROM FILM
	WHERE FID =ANY
	(SELECT FID
	from SHOW
	WHERE FID =ANY(SELECT FID
							FROM FILM
							WHERE GRADE IS NULL)
	GROUP BY FID
	HAVING COUNT(*) >=3);