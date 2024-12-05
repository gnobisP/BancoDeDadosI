drop table ESCOLA;
drop table TURMAS;
drop table ALUNO;

create TABLE ESCOLA(ID VARCHAR2(3),
                    NOME VARCHAR2(20) unique,
                    CONSTRAINT pk_ESCOLA primary key (ID)
                         
);

create table TURMAS(ID_ESCOLA VARCHAR2(3),
                    ID_TURMA VARCHAR2(3) not null,
                    NOME VARCHAR(20) unique,
                    CONSTRAINT pk_TURMAS primary key (ID_TURMA),
                    CONSTRAINT fk_TURMAS foreign key (ID_ESCOLA)
                    references ESCOLA (ID) 
                    ON DELETE CASCADE
                    /*Verificando se existe mesma turma na escola
                    AS
                    BEGIN
                        if(exists SELECT * FROM TURMAS)

                    END*/
);

create table ALUNO(ID_TURMA VARCHAR2(3) not null,
                   ID_ALUNO VARCHAR2(3),
                   NOME VARCHAR(20) not null,
                   IDADE NUMBER(3) not null,
                   CONSTRAINT fk_ALUNO foreign key(ID_TURMA)
                   references TURMAS(ID_TURMA) 
                   ON DELETE CASCADE,
                   CONSTRAINT pk_ALUNO primary key(ID_ALUNO));

insert into ESCOLA (ID, NOME)
values('1','Escola Modelo');

insert into TURMAS(ID_ESCOLA, ID_TURMA, NOME)
values('1', '1A', 'Turma 1A');

insert into ALUNO(ID_TURMA, ID_ALUNO, NOME, IDADE)
values('1A', 101, 'João Silva', 14);

insert into ALUNO(ID_TURMA, ID_ALUNO, NOME, IDADE)
values('1A', 102, 'Maria Oliveira', 15);

insert into TURMAS(ID_ESCOLA, ID_TURMA, NOME)
values('1', '2B', 'Turma 2B');

insert into ALUNO(ID_TURMA, ID_ALUNO, NOME, IDADE)
values('2B', 201, 'Pedro Costa', 16);

insert into ALUNO(ID_TURMA, ID_ALUNO, NOME, IDADE)
values('2B', 202, 'Ana souza', 15);


