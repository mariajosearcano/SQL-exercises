Create or replace procedure P_Ensayo
Is
    Begin
        dbms_output.put_line('Clase de Martes y Jueves, en el poli');
    End;

EXECUTE P_Ensayo;


create or replace procedure rebajaPrecio
as
    begin
        update productos set preciounit=preciounit-(preciounit*0.05);
    end;
    
execute rebajaprecio;
select * from productos;


CREATE OR REPLACE PROCEDURE P_NOMBRE(NOMBRE IN VARCHAR2)
IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Hola, me llamo ' || nombre);
    End;
    
EXECUTE P_NOMBRE('Elsa Pito');


