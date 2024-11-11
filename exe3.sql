DROP table membro;
Create table MEMBRO (   mat number(12) primary key,
                        nome varchar2(40) not null,
                        cpf varchar2(11) not null,
                        ende varchar2(40) not null,
                        data_nasc date not null);
select * from MEMBRO;

insert into MEMBRO values(111,
                     'Gustavo',
                     '02005643661',
                     'Rua das chacaras',
                      to_date(('14/05/2002'), 'DD/MM/YYYY'));



Grant select on MEMBRO to ECLBDIT122;

Select * from ECLBDIT120.MEMBRO;

insert into MEMBRO values(112,
                     'Aira',
                     '12345678910',
                     'Rua A',
                        to_date(('13/05/2002'), 'DD/MM/YYYY'));

insert into MEMBRO values(113,
                     'Gallegos',
                     '40028922',
                     'Rua B',
                        to_date(('12/05/2002'), 'DD/MM/YYYY'));

insert into MEMBRO values(114,
                     'nome1',
                     '12345678910',
                     'Rua A',
                        to_date(('11/05/2002'), 'DD/MM/YYYY'));

insert into MEMBRO values(115,
                     'nome2',
                     '40028922',
                     'Rua B',
                        to_date(('10/05/2002'), 'DD/MM/YYYY'));

