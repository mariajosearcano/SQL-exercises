ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

-- crear usuario
create user profepoli23 -- Crear el usuario
identified by "1111" -- Se le asigna una clave de usuario
default tablespace "SYSTEM" --Se asigna un tableSpace, un area de trabajo
QUOTA UNLIMITED ON SYSTEM-- Se asigna un espacion de trabajo o almacenamiento, que puede ser en megas o gigas, en este caso es ilimitado.
temporary tablespace "TEMP";-- Igual se asigna el espacio temporar de trabajo

--Verificar existencia del usuario
SELECT USERNAME FROM DBA_USERS;
-- Borrar un Usuario
DROP USER profepoli23;
--Generar Roles
CREATE ROLE PROFESOR;
GRANT "CONNECT" TO PROFEPOLI23;
-- Generar Privilegios
GRANT "CONNECT" TO PROFESOR;
-- También se pueden listar todos los privilegios en una sola línea
GRANT CREATE SESSION, CREATE TABLE, ALTER ANY TABLE,
DROP ANY TABLE, INSERT ANY TABLE,
UPDATE ANY TABLE, DELETE ANY TABLE, SELECT ANY TABLE TO
profesor;
GRANT ALTER TABLESPACE TO PROFEPOLI23;
GRANT EXECUTE ANY PROCEDURE TO PROFEPOLI23;
SELECT TABLESPACE_NAME FROM DBA_TABLESPACES;-- Permite ver todos los tablespace

--Ver los privilegios de un rol
Select privilege from dba_sys_privs where grantee = 'PROFESOR';
--Asignar el rol al usuario que ya se creo
GRANT PROFESOR TO PROFEPOLI23;
--Para ver los roles del usuario
SELECT USERNAME, GRANTED_ROLE FROM USER_ROLE_PRIVS;

REVOKE insert, delete, select
ON clientes
FROM profepoli23;

--Se crea un usuario
create user estudiante21 IDENTIFIED by estudiante21 default
tablespace "SYSTEM";
--se crea un ROL
create role facultad;
--Se crean los privilegios para el rol
grant create session, create table, create synonym to facultad;
--Se asigna el Rol al usuario creado
grant facultad to estudiante21;

Grant select ON clientes to facultad,estudiante21;

Select * from University.clientes;

CREATE USER JORGEI IDENTIFIED BY 0000
DEFAULT TABLESPACE SYSTEM
TEMPORARY TABLESPACE TEMP
QUOTA 100M ON SYSTEM;

CREATE ROLE PERMI;

GRANT CREATE SESSION, CREATE TABLE,CREATE VIEW, CREATE
PROCEDURE TO PERMI;

GRANT PERMI TO JORGEI;

CREATE TABLE FRUTAS(
    ID NUMERIC,
    FRUTA VARCHAR2(20)
);

INSERT INTO FRUTAS VALUES(1, 'UVAS');
INSERT INTO FRUTAS VALUES(1, 'MANZANAS');
INSERT INTO FRUTAS VALUES(1, 'PERAS');
INSERT INTO FRUTAS VALUES(4, 'GUAYABAS');

SELECT * FROM FRUTAS;

//espacio para crear a hijo
CREATE USER HIJO IDENTIFIED BY 0000;

GRANT PERMI TO HIJO;

SELECT PRIVILEGE FROM DBA_SYS_PRIVS WHERE GRANTEE = 'PERMI';

REVOKE UPDATE ON frutas FROM permi;

REVOKE all ON frutas FROM permi;

Select privilege from dba_sys_privs where grantee ='PERMI';

GRANT SELECT ON FRUTAS to hijo;

GRANT INSERT ON FRUTAS TO HIJO;

GRANT INSERT ON FRUTAS TO PERMI,JORGEI;

GRANT UPDATE ON FRUTAS TO PERMI,JORGEI;

GRANT SELECT ON FRUTAS TO jorgei;

--forma correcta
CREATE TABLE JORGEI.frutas AS SELECT * FROM FRUTAS;
INSERT INTO JORGEI.frutas SELECT * FROM FRUTAS;

SELECT * FROM jorgei.frutas;

INSERT INTO JORGEI.frutas VALUES(4, 'BANANOS');

UPDATE JORGEI.frutas SET FRUTA ='MANGOS' WHERE FRUTA='BANANOS';

create SYNONYM comestibles for jorgei.frutas;

INSERT INTO comestibles VALUES(6, 'MELON');

select * from comestibles;

select * from frutas;
insert into frutas values(5, 'BANANOS');
UPDATE frutas SET FRUTA ='MAMONCILLO' WHERE FRUTA='BANANOS';


