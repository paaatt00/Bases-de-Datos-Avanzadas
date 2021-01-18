-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.1
-- PostgreSQL version: 10.0
-- Project Site: pgmodeler.io
-- Model Author: ---


-- Database creation must be done outside a multicommand file.
-- These commands were put in this file only as a convenience.
-- -- object: new_database | type: DATABASE --
-- -- DROP DATABASE IF EXISTS new_database;
-- CREATE DATABASE new_database;
-- -- ddl-end --
-- 

-- object: public."Musicos" | type: TABLE --
-- DROP TABLE IF EXISTS public."Musicos" CASCADE;
CREATE TABLE public."Musicos"(
	codigo_musico integer NOT NULL,
	dni char(10) NOT NULL,
	nombre text NOT NULL,
	direccion text NOT NULL,
	codigo_postal integer NOT NULL,
	ciudad text NOT NULL,
	provincia text NOT NULL,
	telefono integer NOT NULL,
	instrumentos text NOT NULL,
	"codigo_grupo_Grupos" integer NOT NULL,
	CONSTRAINT "Musicos_pk" PRIMARY KEY (codigo_musico),
	CONSTRAINT "Unique_DNI" UNIQUE (dni)

);
-- ddl-end --
ALTER TABLE public."Musicos" OWNER TO postgres;
-- ddl-end --

-- object: public."Grupos" | type: TABLE --
-- DROP TABLE IF EXISTS public."Grupos" CASCADE;
CREATE TABLE public."Grupos"(
	codigo_grupo integer NOT NULL,
	nombre text NOT NULL,
	genero_musical text NOT NULL,
	pais text NOT NULL,
	sitio_web text NOT NULL,
	CONSTRAINT "Grupo_pk" PRIMARY KEY (codigo_grupo)

);
-- ddl-end --
ALTER TABLE public."Grupos" OWNER TO postgres;
-- ddl-end --

-- object: public."Conciertos" | type: TABLE --
-- DROP TABLE IF EXISTS public."Conciertos" CASCADE;
CREATE TABLE public."Conciertos"(
	codigo_concierto integer NOT NULL,
	fecha_realizacion date NOT NULL,
	pais text NOT NULL,
	ciudad text NOT NULL,
	recinto text NOT NULL,
	CONSTRAINT "Conciertos_pk" PRIMARY KEY (codigo_concierto)

);
-- ddl-end --
ALTER TABLE public."Conciertos" OWNER TO postgres;
-- ddl-end --

-- object: public."Grupos_Tocan_Conciertos" | type: TABLE --
-- DROP TABLE IF EXISTS public."Grupos_Tocan_Conciertos" CASCADE;
CREATE TABLE public."Grupos_Tocan_Conciertos"(
	"codigo_grupo_Grupos" integer NOT NULL,
	"codigo_concierto_Conciertos" integer NOT NULL,
	CONSTRAINT "Grupos_Tocan_Conciertos_pk" PRIMARY KEY ("codigo_grupo_Grupos","codigo_concierto_Conciertos")

);
-- ddl-end --

-- object: "Grupos_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Grupos_Tocan_Conciertos" DROP CONSTRAINT IF EXISTS "Grupos_fk" CASCADE;
ALTER TABLE public."Grupos_Tocan_Conciertos" ADD CONSTRAINT "Grupos_fk" FOREIGN KEY ("codigo_grupo_Grupos")
REFERENCES public."Grupos" (codigo_grupo) MATCH FULL
ON DELETE RESTRICT ON UPDATE RESTRICT;
-- ddl-end --

-- object: "Conciertos_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Grupos_Tocan_Conciertos" DROP CONSTRAINT IF EXISTS "Conciertos_fk" CASCADE;
ALTER TABLE public."Grupos_Tocan_Conciertos" ADD CONSTRAINT "Conciertos_fk" FOREIGN KEY ("codigo_concierto_Conciertos")
REFERENCES public."Conciertos" (codigo_concierto) MATCH FULL
ON DELETE RESTRICT ON UPDATE RESTRICT;
-- ddl-end --

-- object: public."Discos" | type: TABLE --
-- DROP TABLE IF EXISTS public."Discos" CASCADE;
CREATE TABLE public."Discos"(
	codigo_disco integer NOT NULL,
	titulo text NOT NULL,
	fecha_edicion date NOT NULL,
	genero text NOT NULL,
	formato text NOT NULL,
	"codigo_grupo_Grupos" integer NOT NULL,
	CONSTRAINT "Discos_pk" PRIMARY KEY (codigo_disco)

);
-- ddl-end --
ALTER TABLE public."Discos" OWNER TO postgres;
-- ddl-end --

-- object: "Grupos_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Discos" DROP CONSTRAINT IF EXISTS "Grupos_fk" CASCADE;
ALTER TABLE public."Discos" ADD CONSTRAINT "Grupos_fk" FOREIGN KEY ("codigo_grupo_Grupos")
REFERENCES public."Grupos" (codigo_grupo) MATCH FULL
ON DELETE RESTRICT ON UPDATE RESTRICT;
-- ddl-end --

-- object: public."Canciones" | type: TABLE --
-- DROP TABLE IF EXISTS public."Canciones" CASCADE;
CREATE TABLE public."Canciones"(
	codigo_cancion integer NOT NULL,
	nombre text NOT NULL,
	compositor text NOT NULL,
	fecha_grabacion date NOT NULL,
	duracion time NOT NULL,
	"codigo_disco_Discos" integer NOT NULL,
	CONSTRAINT "Canciones_pk" PRIMARY KEY (codigo_cancion)

);
-- ddl-end --
ALTER TABLE public."Canciones" OWNER TO postgres;
-- ddl-end --

-- object: "Discos_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Canciones" DROP CONSTRAINT IF EXISTS "Discos_fk" CASCADE;
ALTER TABLE public."Canciones" ADD CONSTRAINT "Discos_fk" FOREIGN KEY ("codigo_disco_Discos")
REFERENCES public."Discos" (codigo_disco) MATCH FULL
ON DELETE RESTRICT ON UPDATE RESTRICT;
-- ddl-end --

-- object: public."Entradas" | type: TABLE --
-- DROP TABLE IF EXISTS public."Entradas" CASCADE;
CREATE TABLE public."Entradas"(
	codigo_entrada integer NOT NULL,
	localidad text NOT NULL,
	precio money NOT NULL,
	usuario text NOT NULL,
	"codigo_concierto_Conciertos" integer NOT NULL,
	CONSTRAINT "Entradas_pk" PRIMARY KEY (codigo_entrada)

);
-- ddl-end --
ALTER TABLE public."Entradas" OWNER TO postgres;
-- ddl-end --

-- object: "Conciertos_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Entradas" DROP CONSTRAINT IF EXISTS "Conciertos_fk" CASCADE;
ALTER TABLE public."Entradas" ADD CONSTRAINT "Conciertos_fk" FOREIGN KEY ("codigo_concierto_Conciertos")
REFERENCES public."Conciertos" (codigo_concierto) MATCH FULL
ON DELETE RESTRICT ON UPDATE RESTRICT;
-- ddl-end --

-- object: "Grupos_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Musicos" DROP CONSTRAINT IF EXISTS "Grupos_fk" CASCADE;
ALTER TABLE public."Musicos" ADD CONSTRAINT "Grupos_fk" FOREIGN KEY ("codigo_grupo_Grupos")
REFERENCES public."Grupos" (codigo_grupo) MATCH FULL
ON DELETE RESTRICT ON UPDATE RESTRICT;
-- ddl-end --


