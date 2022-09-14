use Proyecto_cine;-- nombramos la DB 
#FUNCIONES
#FUNCION BENEFICIO DE LA EMPRESA POR SALARIO SEGUN EL CARGO
DROP FUNCTION IF EXISTS  salario_beneficio;
DELIMITER &&
CREATE FUNCTION salario_beneficio(salario int,cargo1 varchar(30))
RETURNS INT UNSIGNED DETERMINISTIC 
BEGIN
DECLARE Salario_beneficio INT;
case
when cargo1='Atención al cliente' then 
SET Salario_beneficio=(salario*0.10)+salario;
when cargo1='Administración' then 
SET Salario_beneficio=(salario*0.15)+salario;
when cargo1='Contabilidad' then 
SET Salario_beneficio=(salario*0.20)+salario;
when cargo1='RR.HH' then 
SET Salario_beneficio=(salario*0.25)+salario;
when cargo1='Markting' then 
SET Salario_beneficio=(salario*0.30)+salario;
end case;
RETURN Salario_beneficio;
 END&&
DELIMITER ;
 SELECT Salario_beneficio(2000,'Administración')
 AS salario_como_beneficio_de_la_empresa;
 

 #FUNCION CONTAR POR CARGO
drop function if exists fn_total_empleado_cargo ;
DELIMITER &&
CREATE FUNCTION fn_total_empleado_cargo (cargo1 varchar(30))
RETURNS INT DETERMINISTIC
BEGIN DECLARE TOTAL_CARGO INT;

SET TOTAL_CARGO= (select count(*) from empleado
  where cargo=cargo1);
  
RETURN TOTAL_CARGO;
END&&
DELIMITER ;
SELECT fn_total_empleado_cargo('Marketing');