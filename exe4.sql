
-- Criando tabelas
create table TIME(
    id number(3),
    nome varchar2(20)
);

create table JOGO(
    data date default sysdate,
    placar_casa number(3),
    placar_visitante number(3)
);

create table JOGADOR(
    cpf number(11),
    nome varchar2(20)
);


-- Inserindo valores
insert into JOGADOR(cpf, nome) values(11111111111, 'Roberto');
insert into JOGADOR(cpf, nome) values (22222222222, 'José');
insert into JOGADOR(cpf, nome) values (33333333333, 'Rodrigo');
select * from JOGADOR;

insert into JOGO(data, placar_casa,placar_visitante) values ('14-05-2002', 1,1);
insert into JOGO(data, placar_casa, placar_visitante) values ('13-05-2002',2,2);
insert into JOGO(data, placar_casa, placar_visitante) values ('12-05-2002',3,3);
select * from JOGO;

insert into TIME(id, nome) values (1, 'Galo');
insert into TIME(id, nome) values (2, 'Internacional');
insert into TIME(id, nome) values (3, 'Barcelona');
select * from TIME;

--Inserindo chave primária em uma coluna já existente
alter table TIME
add constraint pk_TIME primary key (id);

alter table JOGADOR
add constraint pk_JOGADOR primary key(cpf);

--Inserindo chave estrangeira
ALTER TABLE JOGO
add id_casa number(3);
DESCRIBE JOGO; 

alter table JOGO
add constraint fk_jogo_time
foreign key (id_casa)
references TIME(id);


ALTER TABLE JOGO
add id_visitante number(3);
DESCRIBE JOGO;

ALTER TABLE JOGO
add constraint fk_jogo_visitante
foreign key(id_visitante)
references TIME(id);


ALTER TABLE JOGADOR
add id_time number(3);
DESCRIBE JOGADOR;

ALTER TABLE JOGADOR
ADD CONSTRAINT fk_jogador_time
foreign key(id_time)
references TIME(id);


--Estabelendo integridade referêncial
UPDATE JOGO 
SET id_casa=1, id_visitante=2
where data = TO_DATE('14-05-2002');

UPDATE JOGO
SET id_casa = 2, id_visitante=3
WHERE DATA = ('13-05-2002');

UPDATE JOGO
SET id_casa = 1, id_visitante = 3
WHERE DATA = ('12-05-2002');

UPDATE JOGADOR
SET id_time = 1
WHERE nome = 'Roberto';

UPDATE JOGADOR
SET id_time = 2
WHERE nome = 'José';

UPDATE JOGADOR 
SET id_time = 3
WHERE nome = 'Rodrigo';

select * from jogador;


--Adicionando chave primária composta
ALTER TABLE JOGO
add constraint Pk_jogo primary key(id_casa, id_visitante, data);

--Garantido que não haja linhas vazias em id_time
ALTER TABLE JOGADOR
MODIFY id_time number not null;

--Criando chave única em uma coluna já existente
ALTER TABLE JOGADOR
ADD CONSTRAINT uk_jogador_nome unique(nome);


--Consultando os dados
SELECT * FROM JOGADOR;
SELECT * FROM JOGO;
SELECT * FROM TIME;