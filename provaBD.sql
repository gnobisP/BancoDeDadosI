drop table INSTITUICAO;
drop table DEPARTAMENTO;
drop table PROJETO;
drop table PESQUISADOR;

create TABLE INSTITUICAO(COD_INST NUMBER(3) not null,
                         NOME_INST VARCHAR2(20),
                         CONSTRAINT pk_INST primary key(COD_INST)
                         
);

create table DEPARTAMENTO(COD_INST NUMBER(3),
                          COD_DEP NUMBER(3),
                          NOME VARCHAR2(20) unique,
                          CONSTRAINT pk_dep primary key(COD_INST, COD_DEP),
                          CONSTRAINT fk_DEPARTAMENTO foreign key (COD_INST) 
                          references INSTITUICAO(COD_INST)
                          ON DELETE CASCADE
);

create table PROJETO(COD_PROJ NUMBER(3),
                    NOME VARCHAR2 (20) unique,
                    CONSTRAINT pk_proj primary key (COD_PROJ)
);

create table PESQUISADOR(COD_INST NUMBER(3), 
                        COD_DEP NUMBER(3), 
                        NOME VARCHAR2(20), 
                        COD_PROJ NUMBER(3), 
                        DATA_NASCIMENTO date,
                        CATEGORIA VARCHAR2(20) 

                        CONSTRAINT pesquisador_cat_ck check (CATEGORIA in ('Senior', 'Pleno', 'Junior')),

                        CONSTRAINT pk_PESQ primary key (COD_INST, COD_DEP, NOME),

                        CONSTRAINT fk_PESQUISADOR foreign key (COD_INST, COD_DEP) 
                        references DEPARTAMENTO (COD_INST, COD_DEP)
                        ON DELETE CASCADE,

                        CONSTRAINT fk_PESQUISADOR1 foreign key (COD_PROJ)
                        references PROJETO (COD_PROJ) 
                        ON DELETE CASCADE
);


--Inserindo elementos INSTITUICAO
insert into INSTITUICAO (COD_INST, NOME_INST)
values(001,'AAA');

insert into INSTITUICAO (COD_INST, NOME_INST)
values(002,'BBB');

--Inserindo elementos Departamento
insert into DEPARTAMENTO (COD_INST, COD_DEP, NOME)
values (001, 010, 'dep_A');

insert into DEPARTAMENTO (COD_INST, COD_DEP, NOME)
values (002, 020, 'dep_B');

-- Inserindo elementos Projeto
insert into PROJETO (COD_PROJ, NOME)
values (100, 'proj_A');

insert into PROJETO (COD_PROJ, NOME)
values (200, 'proj_B');

--Inserindo elementos Pesquisador
insert into PESQUISADOR (COD_INST, COD_DEP, NOME, COD_PROJ, DATA_NASCIMENTO, CATEGORIA)
values (001, 010, 'pes01', 100,  to_date(('13/05/2002'), 'DD/MM/YYYY'), 'Senior');

insert into PESQUISADOR (COD_INST, COD_DEP, NOME, COD_PROJ, DATA_NASCIMENTO, CATEGORIA)
values (002, 020, 'pes02', 200,  to_date(('13/05/2002'), 'DD/MM/YYYY'), 'Senior');

commit;


select I.NOME_INST, D.Nome, P.Nome
from INSTITUICAO I join DEPARTAMENTO D ON
I.COD_INST = D.COD_INST join PESQUISADOR P 
on P.COD_INST = D.COD_INST and P.COD_DEP = D.COD_DEP;

select PJ.NOME NOME_PROJETO, PS.NOME NOME_PESQUISADOR, PS.CATEGORIA 
from PROJETO PJ right join Pesquisador PS ON
PJ.COD_PROJ = PS.COD_PROJ;

--Incluindo CPF em pesquisador
--Removendo chave primaria de pesquisador
alter table pesquisador drop PRIMARY KEY;
alter table pesquisador add CPF NUMBER(11);

update pesquisador set CPF = 111 where COD_INST = 001; --Adicionando CPF em todas colunas
--commit
update pesquisador set CPF = 110 where COD_INST = 002;

alter table pesquisador add constraint pk_pesquisador PRIMARY KEY(CPF);

select * from PESQUISADOR;