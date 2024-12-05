drop table ESCOLA;
drop table TURMAS;
drop table ALUNO;

create TABLE ESCOLA(ID NUMBER(3) not null,
                    NOME VARCHAR2(20),
                    CONSTRAINT pk_ESCOLA primary key (NOME)
                         
);

create table TURMAS(NOME_ESCOLA VARCHAR2(20),
                    ID_TURMA VARCHAR2(3) not null,
                    NOME VARCHAR(20) unique,
                    CONSTRAINT pk_TURMAS primary key (NOME),
                    CONSTRAINT fk_TURMAS foreign key (NOME_ESCOLA)
                    references ESCOLA (NOME) 
                    ON DELETE CASCADE
                    
);

create table ALUNO(NOME_TURMA VARCHAR2(3) not null,
                   ID_ALUNO NUMBER(3),
                   NOME VARCHAR(20) not null,
                   IDADE NUMBER(3) not null,
                   CONSTRAINT fk_ALUNO foreign key(NOME_TURMA)
                   references TURMAS(NOME) 
                   ON DELETE CASCADE);

insert into ESCOLA (ID, NOME)
values(1,'Escola Modelo');

insert into TURMAS(NOME_ESCOLA, ID_TURMA, NOME)
values(1, '1A', 'Turma 1A');

insert into ALUNO(NOME_TURMA, ID_ALUNO, NOME, IDADE)
values('1A', 101, 'João Silva', 14);

insert into ALUNO(NOME_TURMA, ID_ALUNO, NOME, IDADE)
values('1A', 102, 'Maria Oliveira', 15);

insert into TURMAS(NOME_ESCOLA, ID_TURMA, NOME)
values('1', '2B', 'Turma 2B');

insert into ALUNO(NOME_TURMA, ID_ALUNO, NOME, IDADE)
values('2B', 20, 'Pedro Costa', 16);

insert into ALUNO(NOME_TURMA, ID_ALUNO, NOME, IDADE)
values('2B', 202, 'Ana souza', 15);


