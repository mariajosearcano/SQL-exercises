--VISTAS EN SQL

create or replace view vis_clientes as select * from clientes;

CREATE OR REPLACE VIEW vis_productos_ordenes_empleados AS SELECT P.EXISTENCIA, P.DESCRIPCION, P.PRECIOUNIT, O.ORDENID, E.EMPLEADOID FROM PRODUCTOS P JOIN DETALLE_ORDENES D ON P.PRODUCTOID = D.PRODUCTOID JOIN ORDENES O ON D.ORDENID = O.ORDENID JOIN EMPLEADOS E ON O.EMPLEADOID = E.EMPLEADOID;

SELECT P.EXISTENCIA, P.DESCRIPCION, P.PRECIOUNIT, O.ORDENID, E.EMPLEADOID FROM PRODUCTOS P JOIN DETALLE_ORDENES D ON P.PRODUCTOID = D.PRODUCTOID JOIN ORDENES O ON D.ORDENID = O.ORDENID JOIN EMPLEADOS E ON O.EMPLEADOID = E.EMPLEADOID;

SELECT * FROM vis_productos_ordenes_empleados WHERE EMPLEADOID <= 3 ORDER BY ORDENID DESC, EMPLEADOID DESC;

--INDICES

Create table propietario(
    Doc number constraint propietario_doc_pk primary key,
    Placa varchar(6) constraint propietario_pla_uk unique,
    Nombre varchar2 (30) not null
);

Select * from user_indexes where (table_name)='PROPIETARIO';

Alter table propietario add Apellido varchar2 (30) ;
Create index propietario_nombre_idx on propietario (nombre, apellido);

Select * from user_indexes where (table_name)='PROPIETARIO';

Insert into propietario (Doc, placa,Nombre,Apellido) values (1,'chk123','Alam','Brito');
Insert into propietario (Doc, placa,Nombre,Apellido) values (2,'chk123','Ali','Kate');--Esto no funciona

--VALORES POR DEFECTO PARA UN CAMPO - DEFAULT

Create table Confecciones (
    Empresa varchar2(30) not null,
    Operaria varchar2(30) default 'Sin Identificar',
    Prenda varchar2(40) not null,
    Precio number (5),
    Cantidad number (4) default 0
);

Insert into Confecciones values('La Puntadita', 'Rosa Lindo','Camisas',3000,200);
Insert into Confecciones values('La Puntadita','Maria Lionza','Camisas',3000,default);
--INSERT INTO Confecciones (Empresa, Operaria, Prenda, Precio) VALUES ('La Puntadita', 'Maria Lionza', 'Camisas', 3000);
Insert into Confecciones values('El Limpiador', 'Orlando Trejos','Camisas',300,400);
Insert into Confecciones values('La Maquina', default,'Camisas',3000,default);
Insert into Confecciones values('La Puntadita', ,'Camisas',3000,);--Esto NO Funciona

--SECUENCIAS

Select Sec_IdEstudiante.nextval from dual; --Con esta instrucción se inicia la secuencia.

Create table Estudiante(
    IdEstudiante int not null primary key,
    Nombre Varchar2(40) not null,
    Apellido Varchar2(40) not null,
    Documento number(10)
);

insert into estudiante values (SEC_IDESTUDIANTE.CURRval,'JORGE','SÁNCHEZ',1020304050);
insert into estudiante values (SEC_IDESTUDIANTE.nextval,'JULIO','VERNE',1020304060);

SELECT * FROM ESTUDIANTE;

DROP SEQUENCE SEC_IDESTUDIANTE;

Create sequence SEC_IDESTUDIANTE 
Start with 1
Increment by 1
Maxvalue 9999
Minvalue 1
Cycle;


