--헹주석 : ctrl + /
--블록 주석 : alt + shift + c
----------------------------------------------------------
/*SQL기본 
1)테이블 생성(create table~), 변경(alter table~  rename to~), 삭제(drop table~)
2)컬럼 추가(alter table~ add~), 변경(alter table~ rename column~/alter table~ modify~), 삭제(alter table~ drop column~)
3)데이터 추가(insert into~), 변경(update~ set~), 삭제(delete from~)=>DML
4)시점관리(commit, savepoint, rollback)= >TCL*/
----------------------------------------------------------
desc emp;

select * from tab;


--(1)테이블 변경
alter table emp
  rename to new_emp;
  

alter table new_emp
  rename to emp;

--(2)테이블 삭제 
drop table emp;

--(3)테이블 생성
CREATE TABLE EMP (
 EMPNO               NUMBER(4) NOT NULL,
 ENAME               VARCHAR2(10),
 JOB                 VARCHAR2(9),
 MGR                 NUMBER(4) ,
 HIREDATE            DATE,
 SAL                 NUMBER(7,2),
 COMM                NUMBER(7,2),
 DEPTNO              NUMBER(2) );
 
--(4)데이터 추가
INSERT INTO EMP VALUES (7839,'KING','PRESIDENT',NULL,'81-11-17',5000,NULL,10);
INSERT INTO EMP VALUES (7698,'BLAKE','MANAGER',7839,'81-05-01',2850,NULL,30);
INSERT INTO EMP VALUES (7782,'CLARK','MANAGER',7839,'81-05-09',2450,NULL,10);
INSERT INTO EMP VALUES (7566,'JONES','MANAGER',7839,'81-04-01',2975,NULL,20);
INSERT INTO EMP VALUES (7654,'MARTIN','SALESMAN',7698,'81-09-10',1250,1400,30);
INSERT INTO EMP VALUES (7499,'ALLEN','SALESMAN',7698,'81-02-11',1600,300,30);
INSERT INTO EMP VALUES (7844,'TURNER','SALESMAN',7698,'81-08-21',1500,0,30);
INSERT INTO EMP VALUES (7900,'JAMES','CLERK',7698,'81-12-11',950,NULL,30);
INSERT INTO EMP VALUES (7521,'WARD','SALESMAN',7698,'81-02-23',1250,500,30);
INSERT INTO EMP VALUES (7902,'FORD','ANALYST',7566,'81-12-11',3000,NULL,20);
INSERT INTO EMP VALUES (7369,'SMITH','CLERK',7902,'80-12-11',800,NULL,20);
INSERT INTO EMP VALUES (7788,'SCOTT','ANALYST',7566,'82-12-22',3000,NULL,20);
INSERT INTO EMP VALUES (7876,'ADAMS','CLERK',7788,'83-01-15',1100,NULL,20);
INSERT INTO EMP VALUES (7934,'MILLER','CLERK',7782,'82-01-11',1300,NULL,10);

commit;

select * from tab;


desc emp;

-- (5) 컬럼 추가
alter table emp
  add (age number(2) default 1);

-- (6) 컬럼 변경(속성)  
alter table emp
  modify (ename varchar2(15) not null);
  
desc emp;

alter table emp
  modify (ename varchar2(10) null);
  
  -- (7) 컬럼 변경(이름)
alter table emp
  rename column ename to new_ename;
  

desc emp; 

-- (8) 컬럼 삭제
alter table emp
  drop column age;
  

select * from emp;

INSERT INTO EMP VALUES (111,'ADAMS','CLERK',7788,'83-01-15',1100,NULL,20);
INSERT INTO EMP VALUES (222,'MILLER','CLERK',7782,'82-01-11',1300,NULL,10);

rollback;

-- (13) 확정

commit;

savepoint t1;

INSERT INTO EMP VALUES (333,'MILLER','CLERK',7782,'82-01-11',1300,NULL,10);

savepoint t2;

-- (10) 데이타 변경
update EMP                 
  SET new_ename='KKKKKK'
  WHERE empno=111;

-- (11) 시점저장(savepoint)
savepoint t3;

-- (12) 롤백(특정시점으로 되돌리기)
rollback to t1;
 
  
  