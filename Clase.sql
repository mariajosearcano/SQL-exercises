alter session set "_ORACLE_SCRIPT"=TRUE;

create user profepoli23 -- Crear el usuario
identified by 1111 -- Se le asigna una clave de usuario
default tablespace SYSTEM
temporary tablespace TEMP--Se asigna un tableSpace, un area de trabajo
QUOTA UNLIMITED ON profepoli23;-- Se asigna un espacion de trabajo o almacenamiento, que puede ser en megas o gigas, en este caso es ilimitado.
-- Igual se asigna el espacio temporar de trabajo

create user profepoli23 -- Crear el usuario
identified by 1111 -- Se le asigna una clave de usuario
default tablespace SYSTEM
temporary tablespace TEMP--Se asigna un tableSpace, un area de trabajo
QUOTA UNLIMITED ON SYSTEM;

SELECT USERNAME FROM DBA_USERS;

CREATE ROLE PROFESOR;
GRANT "CONNECT" TO PROFEPOLI23;

GRANT "CONNECT" TO PROFESOR;

GRANT CREATE SESSION, CREATE TABLE, ALTER ANY TABLE,
DROP ANY TABLE, INSERT ANY TABLE,
UPDATE ANY TABLE, DELETE ANY TABLE, SELECT ANY TABLE TO
profesor;
GRANT ALTER TABLESPACE TO PROFEPOLI23;
GRANT EXECUTE ANY PROCEDURE TO PROFEPOLI23;

SHOW USER;
SELECT TABLESPACE_NAME FROM DBA_TABLESPACES;-- Permite ver todos los tablespace

Select privilege from dba_sys_privs where grantee ='PROFESOR';

GRANT PROFESOR TO PROFEPOLI23;

SELECT USERNAME, GRANTED_ROLE FROM USER_ROLE_PRIVS;





