create database gestion_emp;
\c gestion_emp;

create table employe(
    id varchar(50) primary key,
    nom varchar(50),
    prenom varchar(100)
);

create table plat (
    id varchar(50) primary key,
    plat varchar(150)
);

create table dejeuner (
    id serial primary key,
    idEmploye varchar(50),
    idPlat varchar(50),
    date timestamp,
    foreign key(idEmploye) references Employe(id),
    foreign key(idPlat) references Plat(id)
);

insert into employe values 
('EMP0001', 'RANDRIA', 'Malala'),
('EMP0002', 'RAKOTONIRIANA', 'Mendrika'),
('EMP0003', 'MIALITIANA', 'Nandrianina');

insert into plat values
('PLT0001', 'Hena kisoa sy Tsara maso'),
('PLT0002', 'Hena kisoa sy Anana'),
('PLT0003', 'Hena omby sy voanjobory'),
('PLT0004', 'Sosisy sy rakoty sy Harico vert');