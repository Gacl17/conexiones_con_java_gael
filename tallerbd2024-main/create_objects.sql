-- ******************************
-- for ORACLE
-- ******************************
-- Create tablespace, user and grant privileges with account sys 
--  Run as script not as SQL command 
CREATE BIGFILE TABLESPACE tallerbd 
DATAFILE 'tallerbd.dat'
SIZE 10M AUTOEXTEND ON;

ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

CREATE USER developer PROFILE DEFAULT IDENTIFIED BY 1234567890
DEFAULT TABLESPACE tallerbd;
 
GRANT CREATE SESSION, CONNECT, CREATE TABLE TO gael;
 
ALTER USER developer QUOTA UNLIMITED ON tallerbd;
 
 -- Connect using account developer
 conn gael/1234567890  --  from console
 -- or create connection from dbeaver using account developer
 CREATE TABLE student3 (
  nocontrol VARCHAR(15)
 , fullname VARCHAR (100)
 , career VARCHAR (50)
 , curp VARCHAR (18) UNIQUE
 , currentgrade INT 
 , CONSTRAINT pkStudent PRIMARY KEY (nocontrol)
 );

INSERT INTO student(nocontrol, fullname, career, curp, currentgrade)
VALUES ('21920131','Miguel Lopez Oswaldo','Ing. Tics','AAAA000119MOCLNHA7',6);

INSERT INTO student(nocontrol, fullname, career, curp, currentgrade)
VALUES ('22920204','Ruiz Mendoza Yuridia Itzel','Ing. Tics','AAAA031111MOCRRRA0',6);


 -- ******************************
-- for MariaDB
-- ******************************
-- Execute this sentence with account root
CREATE DATABASE tallerbd CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;

 USE tienda;
 
 CREATE TABLE student3 (
    nocontrol VARCHAR(15) 
 ,  fullname VARCHAR (100)
 , career VARCHAR (50)
 , curp VARCHAR (18) UNIQUE
 , currentgrade INT 
 , CONSTRAINT pkStudent PRIMARY KEY (nocontrol)
 );

INSERT INTO student(nocontrol, fullname, career, curp, currentgrade)
VALUES ('21920133','Hugo Martinez Sosa','Ing. Informatica','AAAA880429MOCMLN03',6);

INSERT INTO student(nocontrol, fullname, career, curp, currentgrade)
VALUES ('22920234','Marisol Lopez Martinez','Ing. Informatica','AAAA980529MOCMRD18',6);


GRANT ALL PRIVILEGES ON tienda.*  TO root@'%' IDENTIFIED BY '1234567890';
GRANT ALL PRIVILEGES ON tienda.*  TO root@'localhost' IDENTIFIED BY '1234567890';
  
  -- ******************************
-- for postgres
-- ******************************
-- Execute this sentence with account postgres
docker exec -it postgres bash
su postgres
psql

CREATE DATABASE tallerbd;
 \c tienda;
 
 CREATE TABLE student3 (
   nocontrol VARCHAR(15)
 , fullname VARCHAR (100)
 , career VARCHAR (50)
 , curp VARCHAR (18) UNIQUE
 , currentgrade INT 
 , CONSTRAINT pkStudent PRIMARY KEY (nocontrol)
 );

INSERT INTO student(nocontrol, fullname, career, curp, currentgrade)
VALUES ('202020161','Margarita Perez Perez','Ing. Agronomia','CAGK081201MOCBNRA7',2);

INSERT INTO student(nocontrol, fullname, career, curp, currentgrade)
VALUES ('202020162','Gerardo Martinez Martinez','Ing. Agronomia','CEPG080217HOCLRLA8',2);


CREATE USER postgres   WITH PASSWORD '1234567890';
ALTER USER postgres superuser;

GRANT ALL PRIVILEGES ON DATABASE tienda TO postgres;

 
 
 


