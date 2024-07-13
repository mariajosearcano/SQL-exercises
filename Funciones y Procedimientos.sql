--FUNCIONES Y PROCEDIMIENTOS EN ORACLE

CREATE TABLE PRODUCTOS1 AS SELECT * FROM PRODUCTOS;

Create or replace function fn_CalcularPrecio_Promedio (codigoProducto IN number) Return number AS preciopromedio number(18,6);
    BEGIN
        Select avg(preciounit)
        into preciopromedio
        From productos1
        where productoid = codigoproducto;
        RETURN preciopromedio;
    END;
    
select descripcion as Articulo, preciounit as precioActual, fn_calcularprecio_promedio(productoid) as PrecioPromedio from productos;

--PROCEDIMIENTOS

CREATE TABLE PRODUCTOS2 AS SELECT * FROM PRODUCTOS;

CREATE OR REPLACE PROCEDURE Pr_actualizarprecio AS 
    BEGIN 
        UPDATE Productos2 
        Set Preciounit = fn_calcularprecio_promedio(productoid);
    END; 
    
SELECT * FROM PRODUCTOS2;




