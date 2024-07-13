CREATE TABLE casillero (
    codigo_casillero NUMBER(7) NOT NULL,
    stock            NUMBER(2) NOT NULL
);

ALTER TABLE casillero ADD CONSTRAINT casillero_pk PRIMARY KEY ( codigo_casillero );

CREATE TABLE devoluciones (
    pedido_codigo_pedido      NUMBER(7) NOT NULL,
    pedido_empleados_cedula   NUMBER(10) NOT NULL,
    empleados_cedula          NUMBER(10) NOT NULL,
    tipo_devolucion           VARCHAR2(70 CHAR) NOT NULL,
    cantidad_prendas_devolver NUMBER(2) NOT NULL,
    fecha_devolucion          DATE NOT NULL,
    codigo_devolucion         NUMBER(7) NOT NULL
);

ALTER TABLE devoluciones
    ADD CONSTRAINT devoluciones_pk PRIMARY KEY ( pedido_codigo_pedido,
                                                 pedido_empleados_cedula,
                                                 empleados_cedula,
                                                 codigo_devolucion );

CREATE TABLE empleados (
    jornada VARCHAR2(8 CHAR) NOT NULL,
    cedula  NUMBER(10) NOT NULL
);

ALTER TABLE empleados ADD CONSTRAINT empleados_pk PRIMARY KEY ( cedula );

CREATE TABLE genero (
    id_genero NUMBER(1) NOT NULL,
    genero    VARCHAR2(10) NOT NULL
);

ALTER TABLE genero ADD CONSTRAINT genero_pk PRIMARY KEY ( id_genero );

CREATE TABLE pedido (
    cantidad         NUMBER(3) NOT NULL,
    codigo_pedido    NUMBER(7) NOT NULL,
    fecha_pedido     DATE NOT NULL,
    empleados_cedula NUMBER(10) NOT NULL,
    fecha_entrega    DATE NOT NULL
);

ALTER TABLE pedido ADD CONSTRAINT pedido_pk PRIMARY KEY ( codigo_pedido,
                                                          empleados_cedula );

CREATE TABLE persona (
    primer_nombre    VARCHAR2(40 CHAR) NOT NULL,
    direccion        VARCHAR2(60 CHAR),
    telefono         NUMBER(9) NOT NULL,
    cedula           NUMBER(10) NOT NULL,
    segundo_nombre   VARCHAR2(40 CHAR) NOT NULL,
    primer_apellido  VARCHAR2(40 CHAR) NOT NULL,
    segundo_apellido VARCHAR2(40 CHAR) NOT NULL
);

ALTER TABLE persona ADD CONSTRAINT persona_pk PRIMARY KEY ( cedula );

CREATE TABLE prenda (
    id_prenda                NUMBER(5) NOT NULL,
    tipo_prenda              VARCHAR2(20) NOT NULL,
    genero_id_genero         NUMBER(1) NOT NULL,
    talla_id_talla           NUMBER(2) NOT NULL,
    producto_codigo_producto NUMBER(5) NOT NULL
);

CREATE UNIQUE INDEX prenda__idx ON
    prenda (
        producto_codigo_producto
    ASC );

ALTER TABLE prenda
    ADD CONSTRAINT prenda_pk PRIMARY KEY ( id_prenda,
                                           genero_id_genero,
                                           talla_id_talla );

CREATE TABLE producto (
    pedido_codigo_pedido       NUMBER(7) NOT NULL,
    color                      VARCHAR2(25) NOT NULL,
    precio                     NUMBER(8) NOT NULL,
    pedido_empleados_cedula    NUMBER(10) NOT NULL,
    marca                      VARCHAR2(60 CHAR) NOT NULL,
    casillero_codigo_casillero NUMBER(7) NOT NULL,
    codigo_producto            NUMBER(5) NOT NULL
);

ALTER TABLE producto ADD CONSTRAINT producto_pk PRIMARY KEY ( codigo_producto );

CREATE TABLE proveedor (
    empresa_vinculacion VARCHAR2(65 CHAR) NOT NULL,
    cedula              NUMBER(10) NOT NULL
);

ALTER TABLE proveedor ADD CONSTRAINT proveedor_pk PRIMARY KEY ( cedula );

-- Error - Unique Constraint PROVEEDOR.PROVEEDOR_PKv1 doesn't have columns

CREATE TABLE talla (
    id_talla NUMBER(2) NOT NULL,
    talla    NUMBER(2) NOT NULL
);

ALTER TABLE talla ADD CONSTRAINT talla_pk PRIMARY KEY ( id_talla );

CREATE TABLE telefono (
    codigo_telefono NUMBER(5) NOT NULL,
    numero_telefono NUMBER(10) NOT NULL,
    persona_cedula  NUMBER(10) NOT NULL
);

ALTER TABLE telefono ADD CONSTRAINT telefono_pk PRIMARY KEY ( codigo_telefono );

ALTER TABLE devoluciones
    ADD CONSTRAINT devoluciones_empleados_fk FOREIGN KEY ( empleados_cedula )
        REFERENCES empleados ( cedula );

ALTER TABLE devoluciones
    ADD CONSTRAINT devoluciones_pedido_fk FOREIGN KEY ( pedido_codigo_pedido,
                                                        pedido_empleados_cedula )
        REFERENCES pedido ( codigo_pedido,
                            empleados_cedula );

ALTER TABLE empleados
    ADD CONSTRAINT empleados_persona_fk FOREIGN KEY ( cedula )
        REFERENCES persona ( cedula );

ALTER TABLE pedido
    ADD CONSTRAINT pedido_empleados_fk FOREIGN KEY ( empleados_cedula )
        REFERENCES empleados ( cedula );

-- Error - Foreign Key PEDIDO_PROVEEDOR_FK has no columns

ALTER TABLE prenda
    ADD CONSTRAINT prenda_genero_fk FOREIGN KEY ( genero_id_genero )
        REFERENCES genero ( id_genero );

ALTER TABLE prenda
    ADD CONSTRAINT prenda_producto_fk FOREIGN KEY ( producto_codigo_producto )
        REFERENCES producto ( codigo_producto );

ALTER TABLE prenda
    ADD CONSTRAINT prenda_talla_fk FOREIGN KEY ( talla_id_talla )
        REFERENCES talla ( id_talla );

ALTER TABLE producto
    ADD CONSTRAINT producto_casillero_fk FOREIGN KEY ( casillero_codigo_casillero )
        REFERENCES casillero ( codigo_casillero );

ALTER TABLE producto
    ADD CONSTRAINT producto_pedido_fk FOREIGN KEY ( pedido_codigo_pedido,
                                                    pedido_empleados_cedula )
        REFERENCES pedido ( codigo_pedido,
                            empleados_cedula );

ALTER TABLE proveedor
    ADD CONSTRAINT proveedor_persona_fk FOREIGN KEY ( cedula )
        REFERENCES persona ( cedula );

ALTER TABLE telefono
    ADD CONSTRAINT telefono_persona_fk FOREIGN KEY ( persona_cedula )
        REFERENCES persona ( cedula );
        
insert into casillero (codigo_casillero, stock) values (2891427, 67);
insert into casillero (codigo_casillero, stock) values (9519651, 48);
insert into casillero (codigo_casillero, stock) values (2479376, 90);
insert into casillero (codigo_casillero, stock) values (5037533, 68);
insert into casillero (codigo_casillero, stock) values (4775595, 13);
insert into casillero (codigo_casillero, stock) values (5091161, 99);
insert into casillero (codigo_casillero, stock) values (2668844, 24);
insert into casillero (codigo_casillero, stock) values (7116589, 54);
insert into casillero (codigo_casillero, stock) values (1582740, 19);
insert into casillero (codigo_casillero, stock) values (7564680, 41);

insert into persona (primer_nombre, direccion, telefono, cedula, segundo_nombre, primer_apellido, segundo_apellido) values ('Levy', 'Apt 1103', 342937932, 4019283850, 'Farica', 'Genner', 'Lewer');
insert into persona (primer_nombre, direccion, telefono, cedula, segundo_nombre, primer_apellido, segundo_apellido) values ('Elene', 'Room 239', 797186508, 7376530416, 'Deane', 'Estcourt', 'Mangeney');
insert into persona (primer_nombre, direccion, telefono, cedula, segundo_nombre, primer_apellido, segundo_apellido) values ('Willabella', 'Suite 30', 260378627, 1282494621, 'Bobbie', 'Maulden', 'Bennison');
insert into persona (primer_nombre, direccion, telefono, cedula, segundo_nombre, primer_apellido, segundo_apellido) values ('Barbabra', '19th Floor', 938267773, 9636980157, 'Tan', 'McKeaney', 'Randalson');
insert into persona (primer_nombre, direccion, telefono, cedula, segundo_nombre, primer_apellido, segundo_apellido) values ('Robena', 'Apt 205', 831711055, 9906519741, 'Galvan', 'Lie', 'Birkenhead');
insert into persona (primer_nombre, direccion, telefono, cedula, segundo_nombre, primer_apellido, segundo_apellido) values ('Hilarius', 'Suite 84', 257079256, 6902789745, 'Jacquette', 'Flucks', 'Aronov');
insert into persona (primer_nombre, direccion, telefono, cedula, segundo_nombre, primer_apellido, segundo_apellido) values ('Reed', 'Suite 77', 348111583, 1020240212, 'Orlan', 'Ortes', 'Ericsson');
insert into persona (primer_nombre, direccion, telefono, cedula, segundo_nombre, primer_apellido, segundo_apellido) values ('Hazel', '6th Floor', 253873301, 3463882468, 'Phebe', 'O''Keenan', 'Neward');
insert into persona (primer_nombre, direccion, telefono, cedula, segundo_nombre, primer_apellido, segundo_apellido) values ('Peterus', 'Room 261', 520990357, 7605619195, 'Anetta', 'Lages', 'McIvor');
insert into persona (primer_nombre, direccion, telefono, cedula, segundo_nombre, primer_apellido, segundo_apellido) values ('Lion', 'Apt 1730', 553188330, 3328655854, 'Fania', 'Paxforde', 'Lavell');

insert into proveedor (empresa_vinculacion, cedula) values ('Dabshots', 4019283850);
insert into proveedor (empresa_vinculacion, cedula) values ('Zoomdog', 7376530416);
insert into proveedor (empresa_vinculacion, cedula) values ('Vitz', 1282494621);
insert into proveedor (empresa_vinculacion, cedula) values ('Quatz', 9636980157);
insert into proveedor (empresa_vinculacion, cedula) values ('Edgeclub', 9906519741);
insert into proveedor (empresa_vinculacion, cedula) values ('Gabspot', 6902789745);
insert into proveedor (empresa_vinculacion, cedula) values ('Realmix', 1020240212);
insert into proveedor (empresa_vinculacion, cedula) values ('Gabcube', 3463882468);
insert into proveedor (empresa_vinculacion, cedula) values ('Skyvu', 7605619195);
insert into proveedor (empresa_vinculacion, cedula) values ('Flipopia', 3328655854);

insert into talla (id_talla, talla) values (10, 10);
insert into talla (id_talla, talla) values (3, 3);
insert into talla (id_talla, talla) values (1, 1);
insert into talla (id_talla, talla) values (7, 7);
insert into talla (id_talla, talla) values (5, 5);
insert into talla (id_talla, talla) values (2, 2);
insert into talla (id_talla, talla) values (9, 9);
insert into talla (id_talla, talla) values (4, 4);
insert into talla (id_talla, talla) values (12, 12);
insert into talla (id_talla, talla) values (6, 6);

insert into telefono (codigo_telefono, numero_telefono, persona_cedula) values (47606, '342937932', '4019283850');
insert into telefono (codigo_telefono, numero_telefono, persona_cedula) values (24116, '797186508', '7376530416');
insert into telefono (codigo_telefono, numero_telefono, persona_cedula) values (30382, '260378627', '1282494621');
insert into telefono (codigo_telefono, numero_telefono, persona_cedula) values (48754, '938267773', '9636980157');
insert into telefono (codigo_telefono, numero_telefono, persona_cedula) values (54157, '831711055', '9906519741');
insert into telefono (codigo_telefono, numero_telefono, persona_cedula) values (86067, '257079256', '6902789745');
insert into telefono (codigo_telefono, numero_telefono, persona_cedula) values (39409, '348111583', '1020240212');
insert into telefono (codigo_telefono, numero_telefono, persona_cedula) values (58549, '253873301', '3463882468');
insert into telefono (codigo_telefono, numero_telefono, persona_cedula) values (92522, '520990357', '7605619195');
insert into telefono (codigo_telefono, numero_telefono, persona_cedula) values (2797, '553188330', '3328655854');

insert into empleados (jornada, cedula) values ('Mañana', '4019283850');
insert into empleados (jornada, cedula) values ('Tarde', '7376530416');
insert into empleados (jornada, cedula) values ('Noche', '1282494621');
insert into empleados (jornada, cedula) values ('Tarde', '9636980157');
insert into empleados (jornada, cedula) values ('Mañana', '9906519741');
insert into empleados (jornada, cedula) values ('Mañana', '6902789745');
insert into empleados (jornada, cedula) values ('Mañana', '1020240212');
insert into empleados (jornada, cedula) values ('Mañana', '3463882468');
insert into empleados (jornada, cedula) values ('Mañana', '7605619195');
insert into empleados (jornada, cedula) values ('Mañana', '3328655854');

insert into genero (id_genero, genero) values (3, 'Unisex');
insert into genero (id_genero, genero) values (2, 'Mujer');
insert into genero (id_genero, genero) values (1, 'Hombre');

insert into pedido (cantidad, codigo_pedido, fecha_pedido, empleados_cedula, fecha_entrega) values (857, 3998862, '5/5/2023', '4019283850', '19/9/2023');
insert into pedido (cantidad, codigo_pedido, fecha_pedido, empleados_cedula, fecha_entrega) values (465, 1324827, '24/9/2023', '7376530416', '7/8/2023');
insert into pedido (cantidad, codigo_pedido, fecha_pedido, empleados_cedula, fecha_entrega) values (371, 7694713, '16/10/2023', '1282494621', '9/9/2023');
insert into pedido (cantidad, codigo_pedido, fecha_pedido, empleados_cedula, fecha_entrega) values (543, 2602613, '13/7/2023', '9636980157', '10/8/2023');
insert into pedido (cantidad, codigo_pedido, fecha_pedido, empleados_cedula, fecha_entrega) values (49, 1037936, '24/6/2023', '9906519741', '7/10/2023');
insert into pedido (cantidad, codigo_pedido, fecha_pedido, empleados_cedula, fecha_entrega) values (706, 2139759, '2/2/2023', '6902789745', '23/12/2022');
insert into pedido (cantidad, codigo_pedido, fecha_pedido, empleados_cedula, fecha_entrega) values (667, 7077427, '10/12/2022', '1020240212', '28/2/2023');
insert into pedido (cantidad, codigo_pedido, fecha_pedido, empleados_cedula, fecha_entrega) values (87, 1192516, '3/9/2023', '3463882468', '9/10/2023');
insert into pedido (cantidad, codigo_pedido, fecha_pedido, empleados_cedula, fecha_entrega) values (941, 2095530, '22/8/2023', '7605619195', '2/5/2023');
insert into pedido (cantidad, codigo_pedido, fecha_pedido, empleados_cedula, fecha_entrega) values (184, 4962962, '26/8/2023', '3328655854', '11/9/2023');
insert into pedido (cantidad, codigo_pedido, fecha_pedido, empleados_cedula, fecha_entrega) values (194, 4968792, '26/8/2023', '3328655854', '11/9/2023');
insert into pedido (cantidad, codigo_pedido, fecha_pedido, empleados_cedula, fecha_entrega) values (18, 7658231, '26/8/2023', '3328655854', '11/9/2023');

insert into producto (pedido_codigo_pedido, color, precio, pedido_empleados_cedula, marca, casillero_codigo_casillero, codigo_producto) values ('1324827', 'Celeste', 9014491, '4019283850', 'Diesel', '2891427', 425);
insert into producto (pedido_codigo_pedido, color, precio, pedido_empleados_cedula, marca, casillero_codigo_casillero, codigo_producto) values ('3998862', 'Rojo', 6719887, '7376530416', 'Diesel', '9519651', 63521);
insert into producto (pedido_codigo_pedido, color, precio, pedido_empleados_cedula, marca, casillero_codigo_casillero, codigo_producto) values ('7694713', 'Fucsia', 8671342, '1282494621', 'Polo', '2479376', 15186);
insert into producto (pedido_codigo_pedido, color, precio, pedido_empleados_cedula, marca, casillero_codigo_casillero, codigo_producto) values ('2602613', 'Cafe', 9502785, '9636980157', 'Diesel', '5037533', 6149);
insert into producto (pedido_codigo_pedido, color, precio, pedido_empleados_cedula, marca, casillero_codigo_casillero, codigo_producto) values ('1037936', 'Marron', 7238594, '9906519741', 'Nike', '4775595', 25711);
insert into producto (pedido_codigo_pedido, color, precio, pedido_empleados_cedula, marca, casillero_codigo_casillero, codigo_producto) values ('2139759', 'Amarillo', 5264763, '6902789745', 'Adidas', '5091161', 12460);
insert into producto (pedido_codigo_pedido, color, precio, pedido_empleados_cedula, marca, casillero_codigo_casillero, codigo_producto) values ('7077427', 'Marron', 4609060, '1020240212', 'Polo', '2668844', 62349);
insert into producto (pedido_codigo_pedido, color, precio, pedido_empleados_cedula, marca, casillero_codigo_casillero, codigo_producto) values ('1192516', 'Morado', 302221, '3463882468', 'Polo', '7116589', 97514);
insert into producto (pedido_codigo_pedido, color, precio, pedido_empleados_cedula, marca, casillero_codigo_casillero, codigo_producto) values ('2095530', 'Rojo', 4356738, '7605619195', 'Adidas', '1582740', 30923);
insert into producto (pedido_codigo_pedido, color, precio, pedido_empleados_cedula, marca, casillero_codigo_casillero, codigo_producto) values ('4962962', 'Fucsia', 2285046, '3328655854', 'Adidas', '7564680', 45382);

insert into devoluciones (pedido_codigo_pedido, pedido_empleados_cedula, empleados_cedula, tipo_devolucion, cantidad_prendas_devolver, fecha_devolucion, codigo_devolucion) values ('1324827', '4019283850', 4019283850, 'Roto', 16, '11/3/2023', 3002897);
insert into devoluciones (pedido_codigo_pedido, pedido_empleados_cedula, empleados_cedula, tipo_devolucion, cantidad_prendas_devolver, fecha_devolucion, codigo_devolucion) values ('3998862', '7376530416', 7376530416, 'Color incorrecto', 59, '11/2/2023', 1270830);
insert into devoluciones (pedido_codigo_pedido, pedido_empleados_cedula, empleados_cedula, tipo_devolucion, cantidad_prendas_devolver, fecha_devolucion, codigo_devolucion) values ('7694713', '1282494621', 1282494621, 'Roto', 74, '9/10/2023', 7940929);
insert into devoluciones (pedido_codigo_pedido, pedido_empleados_cedula, empleados_cedula, tipo_devolucion, cantidad_prendas_devolver, fecha_devolucion, codigo_devolucion) values ('2602613', '9636980157', 9636980157, 'Roto', 66, '6/10/2023', 70103);
insert into devoluciones (pedido_codigo_pedido, pedido_empleados_cedula, empleados_cedula, tipo_devolucion, cantidad_prendas_devolver, fecha_devolucion, codigo_devolucion) values ('1037936', '9906519741', 9906519741, 'Talla incorrecta', 32, '11/12/2022', 4303087);
insert into devoluciones (pedido_codigo_pedido, pedido_empleados_cedula, empleados_cedula, tipo_devolucion, cantidad_prendas_devolver, fecha_devolucion, codigo_devolucion) values ('2139759', '6902789745', 6902789745, 'Talla incorrecta', 76, '14/2/2023', 7902176);

/*Info. de productos a los que se les han hecho devolucion porque estan rotos*/
SELECT * FROM devoluciones WHERE tipo_devolucion = 'Roto';

/*Mostrar el codigo de los casilleros que tengan mas de 50 en stock*/
SELECT codigo_casillero FROM casillero WHERE stock > 50;

/*Contar el numero de empleados por jornada*/
SELECT COUNT(cedula), jornada FROM empleados GROUP BY jornada;

/*Contar el numero de productos por cada marca*/
SELECT COUNT(codigo_producto), marca FROM producto GROUP BY marca;

/*Mostrar el precio mas alto entre todos los productos*/
SELECT MAX(precio) FROM producto;

/*Mostrar cedula, cantidad de pedido y codigo del pedido donde coincidan las cedulas en ambas tablas*/
select e.cedula, p.cantidad, p.codigo_pedido FROM pedido p INNER JOIN empleados e ON p.empleados_cedula = e.cedula;

/*Mostrar el codigo del pedido, el codigo de devolucion, fecha de entrega y de devolucion para comparar ambas*/
select p.codigo_pedido, p.fecha_entrega, d.fecha_devolucion, d.codigo_devolucion FROM pedido p INNER JOIN devoluciones d ON p.codigo_pedido = d.pedido_codigo_pedido;

/*Mostrar el primer nombre, la empresa de vinculacion y la cedula de los proveedores que estan registrados como persona*/
select pe.primer_nombre ,pr.empresa_vinculacion, pr.cedula FROM persona pe INNER JOIN proveedor pr ON pe.cedula = pr.cedula;