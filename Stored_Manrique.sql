use Proyecto_cine;-- nombramos la DB 
#STORED PROCEDURES
-- Ordenar por apellido de un cliente ascendentemente
drop procedure  if exists sp_ordenar_apellido_cliente ;
 DELIMITER //
CREATE PROCEDURE sp_ordenar_apellido_cliente (INOUT param_order  VARCHAR(50),INOUT param_asc VARCHAR(4))#parametros
BEGIN
  SET @tabla_cliente =  CONCAT('SELECT * FROM cliente U ORDER BY',' ',param_order ,' ',param_asc);#concatenamos
  PREPARE param FROM @tabla_cliente;
  EXECUTE param;  
  DEALLOCATE PREPARE param;
END //
DELIMITER ;
SET @param_order = 'apellidos'; 
SET @param_asc = 'ASC'; 

CALL sp_ordenar_apellido_cliente (@param_order ,@param_asc);


-- INSERTAR UN ACTOR MEDIANTE UNA CONDICIONAL SIN REPETIR
   drop procedure  if exists  insertar_actor;
   DELIMITER //
   CREATE PROCEDURE insertar_actor(nom VARCHAR(30),f_nac DATE)#parametros
   BEGIN
   DECLARE exite_actor int;
   SET exite_actor =(SELECT COUNT(*) FROM actor where  nombre=nom);
   #condicional
   IF  exite_actor =0  THEN 
   INSERT INTO actor(nombre,fecha_nacimiento) VALUES (nom,f_nac);
   ELSE 
   SELECT 'No permite actores repetidos', NULL FROM DUAL;
   END IF;
   END//;
   );
   DELIMITER ;
   CALL insertar_actor('Angelina Jolie','1960-06-04');
   CALL insertar_actor('Steve Carell','1962-08-16');
   CALL insertar_actor('Emma Stone','1988-11-06');
   select*from actor;
   