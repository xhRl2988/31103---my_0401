--���ּ� : ctrl + /
--��� �ּ� : alt + shift + c
----------------------------------------------------------
/*SQL�⺻ 
1)���̺� ����(create table~), ����(alter table~  rename to~), ����(drop table~)
2)�÷� �߰�(alter table~ add~), ����(alter table~ rename column~/alter table~ modify~), ����(alter table~ drop column~)
3)������ �߰�(insert into~), ����(update~ set~), ����(delete from~)=>DML
4)��������(commit, savepoint, rollback)= >TCL*/
----------------------------------------------------------
desc emp;

select * from tab;


--(1)���̺� ����
alter table emp
  rename to new_emp;
  

alter table new_emp
  rename to emp;

--(2)���̺� ���� 
drop table emp;

--(3)���̺� ����
CREATE TABLE EMP (
 EMPNO               NUMBER(4) NOT NULL,
 ENAME               VARCHAR2(10),
 JOB                 VARCHAR2(9),
 MGR                 NUMBER(4) ,
 HIREDATE            DATE,
 SAL                 NUMBER(7,2),
 COMM                NUMBER(7,2),
 DEPTNO              NUMBER(2) );
 
--(4)������ �߰�
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

-- (5) �÷� �߰�
alter table emp
  add (age number(2) default 1);

-- (6) �÷� ����(�Ӽ�)  
alter table emp
  modify (ename varchar2(15) not null);
  
desc emp;

alter table emp
  modify (ename varchar2(10) null);
  
  -- (7) �÷� ����(�̸�)
alter table emp
  rename column ename to new_ename;
  

desc emp; 

-- (8) �÷� ����
alter table emp
  drop column age;
  

select * from emp;

INSERT INTO EMP VALUES (111,'ADAMS','CLERK',7788,'83-01-15',1100,NULL,20);
INSERT INTO EMP VALUES (222,'MILLER','CLERK',7782,'82-01-11',1300,NULL,10);

rollback;

-- (13) Ȯ��

commit;

savepoint t1;

INSERT INTO EMP VALUES (333,'MILLER','CLERK',7782,'82-01-11',1300,NULL,10);

savepoint t2;

-- (10) ����Ÿ ����
update EMP                 
  SET new_ename='KKKKKK'
  WHERE empno=111;

-- (11) ��������(savepoint)
savepoint t3;

-- (12) �ѹ�(Ư���������� �ǵ�����)
rollback to t1;
 
  
  