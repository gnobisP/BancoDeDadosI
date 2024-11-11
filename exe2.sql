create TABLE DEPART (
                    deptno number(2),
                    nome varchar2(20),
                    criacao date default sysdate); --Pega data automáticamente do sistema


select * from DEPART;

/*-------------------Alterar atributos de uma tabela-------------------*/
alter table DEPART
add constraint pk_DEPART PRIMARY KEY (deptno); --Transforma deptno em chave primária

/*-------------inserindo chave primaria duplicada--------------------*/
insert into DEPART (deptno,nome) values(10, 'joão');
insert into DEPART (deptno, nome) values (11, 'alex');

/*--------------------inserindo uma nova coluna---------------------*/
alter table DEPART add local varchar2(20) not null; --Erro por que quando é inserido uma coluna na tabela ela vem com valores NULL
-- para resolver, removemos o parametro 'not null' ou exluimos as linhas da tabela
delete from DEPART;

/*-----------------------Exluindo uma coluna------------------------*/
alter table depart drop column criacao;


/*---Se a coluna for uma chave primaria é necessário utilizar a constante CASCADE CONSTRAINT---*/
Create table TESTE1(t1c1 number(5) primary key,
                    t1c2 number(5));

Create table TESTE2(t2c1 number(5) references TESTE1,
                    t2c2 number(5));

alter table TESTE1 drop column t1c1; -- remover coluna sem cascade, remoção proibida
alter table TESTE1 drop column t1c1 CASCADE CONSTRAINT; -- CASCADE CONSTRAINT remove as restrições

/*------------Remoção da chaves-----------------------*/
alter TABLE DEPART drop constraint pk_DEPART;

/*-------------------Inclusão de chave estrangeira-----------------*/
create table EMPREGADO (mat number (5) primary key, name varchar2(20), deptno number(2));
alter table DEPART add constraint pk_dept primary key (deptno);
alter table EMPREGADO add constraint fk_emp_dept foreign key (deptno) references DEPART (deptno);

/*------------- Remoção da chave estrangeira --------------*/
Create table teste3(c1 number(5) primary key);
Create table teste4(c2 number(5) CONSTRAINT fk_teste4_teste3 references teste3);

alter table teste4 drop constraint fk_teste4_teste3;

/*----------------Alteração nome da coluna------------*/
Alter table EMPREGADO
rename column mat to matricula

/*--------Alteração do tamanho da coluna-----------------*/
Alter table EMPREGADO
modify name varchar2(30);

/*--------------Adicionando chave única------------------*/
alter table EMPREGADO
add constraint uk_nome unique (name);


/*--------------------Remoção de tabelas---------------------*/
-- Drop table <nome da tabela> [cascade constraints];


Create table teste5 (c1 number(5) primary key);
Create table teste6 (c2 number(5) references teste5);
Drop table teste5; -- sem cascade constraints
-- não é possível a remoção


Drop table teste5 cascade constraints; -- remocao ok
Drop table teste1;
Drop table teste2;
Drop table teste3;
Drop table teste4;
Drop table teste6;

/*-- Adiciona uma regra de validação --*/
alter table EMPREGADO add sexo char (1);
alter table EMPREGADO add constraint sexo_emp_ck
check (sexo in ('M', 'F'));

/*-- Adicionando uma valor default --*/

Drop table teste1 cascade constraints;
Create table teste1 (c1 number(5) primary key,
c2 number(5));
alter table teste1 modify c1 default 1;

/*-- Removendo um valor default --*/
alter table teste1 modify c1 default (null);

/*-- Insert --*/
Insert into DEPART (deptno, nome, local)
values (10, 'Vendas','BH');

Insert into DEPART
values (20, 'TI','BH');

select * from DEPART;

/*--Comando update--*/
Update EMPREGADO set matricula=3000
Where matricula=1000;

Select * from EMPREGADO;

/*--Comando delete--*/
Delete from EMPREGADO
Where matricula=3000;

Select * from EMPREGADO;

/*-- Commit --*/
COMMIT;


select * from EMPLOYEES order by last_name;


SELECT 
    FIRST_NAME,
    LAST_NAME,
    TO_CHAR(HIRE_DATE, 'DD-Month-YYYY') AS DATA_ADMISSAO
FROM 
    EMPLOYEES
WHERE 
    SUBSTR(upper(LAST_NAME), 1, 1) = 'R';


SELECT 
    CONCAT(CONCAT(FIRST_NAME, ' '), LAST_NAME) AS NOME_COMPLETO,
    UPPER(DEPARTMENT_NAME) AS NOME_DEPARTAMENTO
FROM 
    EMPLOYEES
JOIN 
    DEPARTMENTS ON EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
WHERE 
    INSTR(LOWER(DEPARTMENT_NAME), 'executive') > 0;


SELECT 
   CONCAT(CONCAT(FIRST_NAME, ' '), LAST_NAME) AS NOME_COMPLETO,
    TO_CHAR(HIRE_DATE, 'DD-Month-YYYY') AS DATA_ADMISSAO
FROM 
    EMPLOYEES
WHERE 
     SUBSTR(HIRE_DATE, 7, 8) = '99';



SELECT 
    CONCAT(CONCAT(FIRST_NAME, ' '), LAST_NAME) AS NOME_COMPLETO,
    ROUND(SALARY / 30, 2) AS SALARIO_DIARIO,
    (SALARY * 12) AS SALARIO_ANUAL
FROM 
    EMPLOYEES
WHERE 
    COMMISSION_PCT IS NOT NULL;

SELECT 
    CONCAT(CONCAT(FIRST_NAME, ' '), LAST_NAME) AS NOME_COMPLETO,
    SALARY AS SALARIO_MENSAL,
    SALARY * (1 + CASE WHEN COMMISSION_PCT IS NULL THEN 0 ELSE COMMISSION_PCT END) AS SALARIO_COM_COMISSAO
FROM 
    EMPLOYEES;

SELECT 
    CONCAT(CONCAT(CONCAT(SUBSTR(FIRST_NAME, 1, 1), '.'), SUBSTR(LAST_NAME, 1, 1)), '.') AS INICIAIS_NOME,
    DEPARTMENT_NAME AS NOME_DEPARTAMENTO
FROM 
    EMPLOYEES
JOIN 
    DEPARTMENTS ON EMPLOYEES.EMPLOYEE_ID = DEPARTMENTS.MANAGER_ID;
    
SELECT 
    CONCAT(CONCAT(FIRST_NAME, ' '), LAST_NAME) AS NOME_COMPLETO,
    FLOOR(MONTHS_BETWEEN(SYSDATE, HIRE_DATE) / 12) AS ANOS_TRABALHADOS,
    FLOOR(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) AS MESES_TRABALHADOS
FROM 
    EMPLOYEES;


    SELECT 
    D.DEPARTMENT_NAME AS NOME_DEPARTAMENTO,
    ROUND(AVG(E.SALARY), 2) AS MEDIA_SALARIO,
    MAX(E.SALARY) AS SALARIO_MAXIMO,
    MIN(E.SALARY) AS SALARIO_MINIMO
FROM 
    EMPLOYEES E
JOIN 
    DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY 
    D.DEPARTMENT_NAME;



SELECT 
    D.DEPARTMENT_NAME AS NOME_DEPARTAMENTO,
    COUNT(E.EMPLOYEE_ID) AS QTD_EMPREGADOS
FROM 
    EMPLOYEES E
JOIN 
    DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE 
    LOWER(E.JOB_ID) LIKE '%clerk%'
GROUP BY 
    D.DEPARTMENT_NAME;