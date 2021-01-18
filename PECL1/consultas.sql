/* 3 */

INSERT INTO "MiTabla" VALUES (132444, 'Patricia', 'Cuesta Ruiz', 'Av Ejercito', 7)

/* 4 */

CREATE EXTENSION pg_buffercache

CREATE OR REPLACE VIEW pg_buffercache AS
	SELECT P.* FROM pg_buffercache_pages() AS P
	(bufferid integer, relfilenode oid, reltablespace oid, reldatabase oid,
	 relforknumber int2, relblocknumber int8, isdirty bool, usagecount int2,
	 pinning_backends int4);
	 
SELECT c.relname, count(*) AS buffers
             FROM pg_buffercache b INNER JOIN pg_class c
             ON b.relfilenode = pg_relation_filenode(c.oid) AND
                b.reldatabase IN (0, (SELECT oid FROM pg_database
                                      WHERE datname = current_database()))
             GROUP BY c.relname
             ORDER BY 2 DESC
             LIMIT 10;

/* 5 */

SELECT MAX(LENGTH("nombre"))   
FROM public."MiTabla"   

SELECT MAX(LENGTH("apellidos"))   
FROM public."MiTabla"    

SELECT MAX(LENGTH("direccion"))   
FROM public."MiTabla" 
  
/* 7 */

CREATE EXTENSION pgstattuple

SELECT * FROM pgstattuple('"MiTabla"')

/* 8 */

/*Calcula tb en número de bloques*/ select * from pg_class where relname = 'MiTabla'

SELECT MAX((ctid::text::point)[0]::bigint) as bloque
FROM "MiTabla"

SELECT AVG(bloque)
FROM (SELECT COUNT(*) AS bloque 
	  FROM "MiTabla" 
	  GROUP BY (ctid::text::point)[0]::bigint) AS unzincoporfabor)

/* 9 */

CREATE EXTENSION pageinspect

SELECT * FROM page_header(get_raw_page('"MiTabla"', 159925));

/* 10 */

CREATE INDEX arbol 
ON "MiTabla"(puntos);

/* 11 */

SELECT * FROM bt_page_stats('arbol',209)
SELECT * FROM bt_page_items('arbol',209)

/* 12 */

CREATE INDEX hash_idcliente 
ON mitabla USING HASH (id_cliente);

/* 14 */

INSERT INTO public."MiTabla"(
	id_cliente, nombre, apellidos, direccion, puntos)
	VALUES (69420, 'Alvaro', 'Golbano', 'Calle Horcajo', 0);
	
UPDATE public."MiTabla"
	SET puntos = 69
	WHERE id_cliente = 69420;
	
DELETE FROM public."MiTabla"
	WHERE id_cliente = 69420;

/* 15 */

DELETE FROM "MiTabla" 
WHERE id_cliente IN (SELECT id_cliente
					 FROM "MiTabla"
					 ORDER BY random()
					 LIMIT 2000000)
					 
/* 16 */

VACUUM FULL "MiTabla"

/* 17 */

CREATE TABLE public."MiTabla2"(
    id_cliente integer,
    nombre text,
    apellidos text,
	direccion text,
    puntos integer,
    PRIMARY KEY (id_cliente))
WITH (
    OIDS = FALSE,
    FILLFACTOR = 40
)
TABLESPACE pg_default;

/* 18 */
INSERT INTO public."MiTabla2"(
	id_cliente, nombre, apellidos, direccion, puntos)
	VALUES (2423532, 'Alvaro', 'Golbano', 'Calle Horcajo', 0);
	
UPDATE public."MiTabla2"
	SET puntos = 69
	WHERE id_cliente = 2423532;
	
DELETE FROM public."MiTabla2"
	WHERE id_cliente = 2423532;

/* 20 */

CREATE TABLE "MiTabla3" (
	id_cliente int, 
	nombre text, 
	apellidos text, 
	direccion text, 
	puntos int) PARTITION BY HASH (puntos);
CREATE TABLE "MiTabla3_0" PARTITION OF "MiTabla3" FOR VALUES WITH (MODULUS 10, REMAINDER 0);
CREATE TABLE "MiTabla3_1" PARTITION OF "MiTabla3" FOR VALUES WITH (MODULUS 10, REMAINDER 1);
CREATE TABLE "MiTabla3_2" PARTITION OF "MiTabla3" FOR VALUES WITH (MODULUS 10, REMAINDER 2);
CREATE TABLE "MiTabla3_3" PARTITION OF "MiTabla3" FOR VALUES WITH (MODULUS 10, REMAINDER 3);
CREATE TABLE "MiTabla3_4" PARTITION OF "MiTabla3" FOR VALUES WITH (MODULUS 10, REMAINDER 4);
CREATE TABLE "MiTabla3_5" PARTITION OF "MiTabla3" FOR VALUES WITH (MODULUS 10, REMAINDER 5);
CREATE TABLE "MiTabla3_6" PARTITION OF "MiTabla3" FOR VALUES WITH (MODULUS 10, REMAINDER 6);
CREATE TABLE "MiTabla3_7" PARTITION OF "MiTabla3" FOR VALUES WITH (MODULUS 10, REMAINDER 7);
CREATE TABLE "MiTabla3_8" PARTITION OF "MiTabla3" FOR VALUES WITH (MODULUS 10, REMAINDER 8);
CREATE TABLE "MiTabla3_9" PARTITION OF "MiTabla3" FOR VALUES WITH (MODULUS 10, REMAINDER 9);

/* 22 */

SELECT MAX((ctid::text::point)[0]::bigint) as bloque
FROM "MiTabla3_9"

/* 23 */

CREATE INDEX indice_primario_puntos ON "MiTabla" (puntos ASC);

/* 24 */

CREATE INDEX hash_puntos
ON "MiTabla" USING HASH (puntos);

CREATE INDEX hash_id_cliente
ON "MiTabla" USING HASH (id_cliente);

/* 25 */

SELECT pg_size_pretty (pg_indexes_size(17661))

/* 26 */

SELECT pg_stat_reset()

/*1*/

SELECT pg_stat_reset()
EXPLAIN (ANALYZE TRUE,BUFFERS TRUE,FORMAT text) 
	SELECT *
    FROM "MiTabla"
    WHERE id_cliente = 8101000

/* 2 */
SELECT pg_stat_reset()
EXPLAIN (ANALYZE TRUE,BUFFERS TRUE,FORMAT text) 
	SELECT *
	FROM "MiTabla"
	WHERE id_cliente < 30000

/* 3*/
SELECT pg_stat_reset()
EXPLAIN (ANALYZE TRUE,BUFFERS TRUE,FORMAT text) 
	SELECT COUNT(id_cliente)
	FROM "MiTabla"
	WHERE id_cliente > 8000 AND id_cliente < 100000

/* 4 */
SELECT pg_stat_reset()
EXPLAIN (ANALYZE TRUE,BUFFERS TRUE,FORMAT text) 
SELECT *
FROM "MiTabla"
WHERE id_cliente = 34500 OR id_cliente = 30204000

/* 5 */
SELECT pg_stat_reset()
EXPLAIN (ANALYZE TRUE,BUFFERS TRUE,FORMAT text) 
SELECT *
FROM "MiTabla"
WHERE id_cliente != 3450000

/* 6 */
SELECT pg_stat_reset()
EXPLAIN (ANALYZE TRUE,BUFFERS TRUE,FORMAT text)
SELECT *
FROM "MiTabla"
WHERE nombre = 'nombre3456789'

/* 7 */
SELECT pg_stat_reset()
EXPLAIN (ANALYZE TRUE,BUFFERS TRUE,FORMAT text)
SELECT *
FROM "MiTabla"
WHERE puntos = 650

/* 8 */
SELECT pg_stat_reset()
EXPLAIN (ANALYZE TRUE,BUFFERS TRUE,FORMAT text)
SELECT *
FROM "MiTabla"
WHERE puntos < 200

/* 9 */
SELECT pg_stat_reset()
EXPLAIN (ANALYZE TRUE,BUFFERS TRUE,FORMAT text)
SELECT *
FROM "MiTabla"
WHERE puntos > 30000

/* 10 */
SELECT pg_stat_reset()
EXPLAIN (ANALYZE TRUE,BUFFERS TRUE,FORMAT text)
SELECT *
FROM "MiTabla"
WHERE id_cliente = 90000 OR puntos = 230 

/* 11 */
SELECT pg_stat_reset()
EXPLAIN (ANALYZE TRUE,BUFFERS TRUE,FORMAT text)
SELECT *
FROM "MiTabla"
WHERE id_cliente = 90000 AND puntos = 230 

/* 27 */

CREATE INDEX arbol_multiclave 
ON "MiTabla"(puntos, nombre);

/* 28 */

/*1*/
SELECT pg_stat_reset()
EXPLAIN (ANALYZE TRUE,BUFFERS TRUE,FORMAT text)
SELECT *
FROM "MiTabla"
WHERE puntos = 200 AND nombre = 'nombre3456789'

/*2*/ 
EXPLAIN (ANALYZE TRUE,BUFFERS TRUE,FORMAT text)
SELECT *
FROM "MiTabla"
WHERE puntos = 200 OR nombre = 'nombre3456789'

/*3*/
SELECT pg_stat_reset()
EXPLAIN (ANALYZE TRUE,BUFFERS TRUE,FORMAT text)
SELECT *
FROM "MiTabla"
WHERE puntos = 6000 AND nombre = 'nombre3456789'

/*4*/
SELECT pg_stat_reset()
EXPLAIN (ANALYZE TRUE,BUFFERS TRUE,FORMAT text)
SELECT *
FROM "MiTabla"
WHERE puntos = 6000 OR nombre = 'nombre3456789'

/* 29 */

/*1*/
SELECT pg_stat_reset()
EXPLAIN (ANALYZE TRUE,BUFFERS TRUE,FORMAT text)
SELECT *
FROM "MiTabla3"
WHERE puntos = 200

/*2*/
SELECT pg_stat_reset()
EXPLAIN (ANALYZE TRUE,BUFFERS TRUE,FORMAT text)
SELECT *
FROM "MiTabla3"
WHERE puntos = 200 OR puntos = 300 

/*3*/
SELECT pg_stat_reset()
EXPLAIN (ANALYZE TRUE,BUFFERS TRUE,FORMAT text)
SELECT *
FROM "MiTabla3"
WHERE puntos = 200 OR puntos = 202 

/*4*/
SELECT pg_stat_reset()
EXPLAIN (ANALYZE TRUE,BUFFERS TRUE,FORMAT text)
SELECT *
FROM "MiTabla3"
WHERE puntos > 500

/*5*/
SELECT pg_stat_reset()
EXPLAIN (ANALYZE TRUE,BUFFERS TRUE,FORMAT text)
SELECT *
FROM "MiTabla3"
WHERE puntos > 500 AND puntos < 550

/*6*/
SELECT pg_stat_reset()
EXPLAIN (ANALYZE TRUE,BUFFERS TRUE,FORMAT text)
SELECT *
FROM "MiTabla3"
WHERE puntos = 800



