GRANT CONNECT, RESOURCE TO profepoli23;

CREATE TABLE empleados ( 
    id_empleado NUMBER(10) PRIMARY KEY, 
    nombre VARCHAR2(50) NOT NULL, 
    salario NUMBER(10,2) NOT NULL, 
    departamento VARCHAR2(20) NOT NULL 
);
CREATE TABLE clientes ( 
    id_cliente NUMBER(10) PRIMARY KEY, 
    nombre VARCHAR2(50) NOT NULL, 
    direccion VARCHAR2(100) NOT NULL, 
    telefono VARCHAR2(15) NOT NULL 
);
CREATE TABLE productos ( 
    id_producto NUMBER(10) PRIMARY KEY, 
    nombre VARCHAR2(50) NOT NULL, 
    precio NUMBER(10,2) NOT NULL, 
    stock NUMBER(10) NOT NULL 
);
CREATE TABLE pedidos ( 
    id_pedido NUMBER(10) PRIMARY KEY, 
    id_cliente NUMBER(10) NOT NULL, 
    id_producto NUMBER(10) NOT NULL, 
    cantidad NUMBER(10) NOT NULL
);

CREATE VIEW vista_pedidos AS
SELECT p.id_pedido, c.nombre AS nombre_cliente, pr.nombre AS nombre_producto, p.cantidad
FROM pedidos p
JOIN clientes c ON p.id_cliente = c.id_cliente
JOIN productos pr ON p.id_producto = pr.id_producto;

GRANT SELECT ON vista_pedidos TO profepoli23;