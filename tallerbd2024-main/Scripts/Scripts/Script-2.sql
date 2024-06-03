-- TALLERBD.EESCUELA_PROCEDENCIA definition

CREATE TABLE "EESCUELA_PROCEDENCIA" 
   (	"CVE_ESCUELA" NVARCHAR2(20) NOT NULL ENABLE, 
	"NOMBRE" NVARCHAR2(200), 
	"NIVEL" NUMBER, 
	"TIPO" NUMBER, 
	"ESTADO" NUMBER NOT NULL ENABLE, 
	"MUNICIPIO" NUMBER, 
	"SERVICIO_EDUCATIVO" NVARCHAR2(100), 
	 CONSTRAINT "PKG_ESCUELAPROC" PRIMARY KEY ("CVE_ESCUELA", "ESTADO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TALLERBD"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TALLERBD" ;

COMMENT ON COLUMN EESCUELA_PROCEDENCIA.NOMBRE IS 'Nombre de la escuela';
COMMENT ON COLUMN EESCUELA_PROCEDENCIA.NIVEL IS '109->secundaria, 102-> bachillerato, nivel Educativo';
COMMENT ON COLUMN EESCUELA_PROCEDENCIA.TIPO IS '1->publico, 2->privado';


SELECT *
FROM EESCUELA_PROCEDENCIA ep;

SELECT 
	ep.cve_escuela, ep.nombre
FROM EESCUELA_PROCEDENCIA
WHERE ep.TIPO=1 AND ep.ESTADO=20;

--El orden de la realizacion de las instrucciones es select, from,where y order
SELECT 
	ep.cve_escuela, ep.nombre
FROM EESCUELA_PROCEDENCIA
WHERE ep.ESTADO=20;
ORDER BY ep.Nombre ASC;

--oreder deporci cuenta los datos pero count permite conocer las concurrencias que cumplen la condicion
SELECT
	tipo, count(*) total
FROM EESCUELA_PROCEDENCIA ep
GROUP BY tipo;

SELECT decode(tipo, 1, 'publico', 2, 'privado')tipo,
	   count(*)total
FROM EESCUELA_PROCEDENCIA ep
GROUP BY tipo;

--NO deja realizar esta operacion debido a que no se a realizado la operacion tipoescuela
SELECT decode(tipo, 1, 'publico', 2, 'privado')tipoescuela,
FROM EESCUELA_PROCEDENCIA ep
WHERE tipoescuela=1;

--el uso de uper o lower en la comparacion no afecta el resultado de la busqueda sin embargo el uper o lower en los atributos nos devuelven solo los datos en upper o lower
SELECT*
FROM EESCUELA_PROCEDENCIA ep
WHERE upper(SERVICIO_EDUCATIVO) = 'BACHILLERATO GENERAL';

SELECT servicio_educativo, count(*) AS tota
FROM EESCUELA_PROCEDENCIA ep
GROUP BY SERVICIO_EDUCATIVO

SELECT servicio_educativo, count(*) AS tota
FROM EESCUELA_PROCEDENCIA ep
GROUP BY SERVICIO_EDUCATIVO
HAVING count(*) >=1000;

--siempre que coloquemos una funcion con los atributos detras debemos ponerlos en el group by
SELECT estado, tipo, count(*) AS total
FROM EESCUELA_PROCEDENCIA ep
GROUP BY estado, tipo
ORDER BY ESTADO ASC;

--FUNCIONES DE AGREGADO
count(*)--el unico que opera por filas
sum(expresion)
sum(cantidad* preciounitario)total
min(expresion)
max(expresion)
avg(expresion)
