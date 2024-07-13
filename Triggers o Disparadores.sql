CREATE TABLE aud_docentes (
    Id varchar2(10),
    Acción varchar2(40),
    Fecha date,
    Usuario varchar2(30)
);

CREATE TABLE Docentes (
    Doc varchar2(10),
    Nom varchar2(40),
    Mat varchar2(30)
);

insert into DOCENTES (DOC, NOM, MAT) values (1, 'Tyna','NEGOCIACION');
insert into DOCENTES (DOC, NOM, MAT) values (2, 'Cintia', 'PHYTON');
insert into DOCENTES (DOC, NOM, MAT) values (3, 'Valery', '');
insert into DOCENTES (DOC, NOM, MAT) values (4, 'Elsa', 'PHYTON');
insert into DOCENTES (DOC, NOM, MAT) values (5, 'Marleny', 'JAVA');
insert into DOCENTES (DOC, NOM, MAT) values (6, 'Clara', 'ALGEBRA');
insert into DOCENTES (DOC, NOM, MAT) values (7, 'Yoshi', 'ALGEBRA');
insert into DOCENTES (DOC, NOM, MAT) values (8, 'Mercedes','ALGEBRA');
insert into DOCENTES (DOC, NOM, MAT) values (9, 'Gabriel','ALGEBRA');
insert into DOCENTES (DOC, NOM, MAT) values (10, 'Eugenio', 'BD');
insert into DOCENTES (DOC, NOM, MAT) values (11, 'Dario', '');
insert into DOCENTES (DOC, NOM, MAT) values (12, 'Maryori','PHYTON');
insert into DOCENTES (DOC, NOM, MAT) values (13, 'Rosalba', 'BD');
insert into DOCENTES (DOC, NOM, MAT) values (14, 'Ruben','PHYTON');
insert into DOCENTES (DOC, NOM, MAT) values (15, 'Blanca', 'JAVA');

create or replace trigger seguimiento_docentes
after insert on DOCENTES
for each row
declare
v_username varchar2(40);
v_fecha date;
    begin
        select user into v_username from dual;
        select SYSDATE into V_fecha from dual;
        insert into aud_docentes (id,acción, fecha, usuario)values ('I-'||:new.doc,'Se agrego un nuevo Docente '||:new.nom,v_fecha,v_username);
    end;
    
INSERT INTO DOCENTES (DOC,NOM,MAT) VALUES(9999, 'ALAM BRITO', 'NEGOCIACION DE TECNOLOGIA');

create or replace trigger Borrar_docentes
before DELETE on DOCENTES
for each row
declare
v_username varchar2(40);
v_fecha date;
    begin
        select user into v_username from dual;
        select SYSDATE into V_fecha from dual;
        insert into aud_docentes (id,acción, fecha, usuario)values ('D-'||:old.doc,'Se borro un Docente '||:old.nom,v_fecha,v_username);
    end;
    
delete from docentes where mat='BD';

create or replace trigger Actualiza_docentes
before update on DOCENTES
for each row
    begin
        insert into aud_docentes(usuario, fecha) values(user, sysdate);
    end Actualiza_docentes;
    
update docentes set mat='instalacion' where mat='ALGEBRA';

CREATE TABLE PRODUCTOS3 AS SELECT * FROM PRODUCTOS WHERE 1=0;
CREATE TABLE CATEGORIAS1 AS SELECT * FROM CATEGORIAS WHERE 1=0;

CREATE OR REPLACE TRIGGER PRACTICA
BEFORE INSERT OR UPDATE OR DELETE ON PRODUCTOS3
FOR EACH ROW
    BEGIN
        IF INSERTING THEN
            
        ELSIF UPDATING THEN
        
        ELSIF DELETING THEN
        
        END IF;
    END;


