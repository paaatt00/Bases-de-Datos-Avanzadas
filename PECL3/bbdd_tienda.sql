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

-- object: public."Tienda" | type: TABLE --
-- DROP TABLE IF EXISTS public."Tienda" CASCADE;
CREATE TABLE public."Tienda"(
	"ID_Tienda" integer NOT NULL,
	"Nombre" text,
	"Ciudad" text,
	"Barrio" text,
	"Provincia" text,
	CONSTRAINT "Tienda_pk" PRIMARY KEY ("ID_Tienda")

);
-- ddl-end --
ALTER TABLE public."Tienda" OWNER TO postgres;
-- ddl-end --

-- object: public."Trabajador" | type: TABLE --
-- DROP TABLE IF EXISTS public."Trabajador" CASCADE;
CREATE TABLE public."Trabajador"(
	"Codigo_trabajador" integer NOT NULL,
	"DNI" varchar(9),
	"Nombre" varchar,
	"Apellidos" varchar,
	"Puesto" varchar,
	"Salario" integer,
	"ID_Tienda_Tienda" integer NOT NULL,
	CONSTRAINT "Trabajador_pk" PRIMARY KEY ("Codigo_trabajador"),
	CONSTRAINT "DNI_UNIQUE" UNIQUE ("DNI")

);
-- ddl-end --
ALTER TABLE public."Trabajador" OWNER TO postgres;
-- ddl-end --

-- object: "Tienda_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Trabajador" DROP CONSTRAINT IF EXISTS "Tienda_fk" CASCADE;
ALTER TABLE public."Trabajador" ADD CONSTRAINT "Tienda_fk" FOREIGN KEY ("ID_Tienda_Tienda")
REFERENCES public."Tienda" ("ID_Tienda") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."Ticket" | type: TABLE --
-- DROP TABLE IF EXISTS public."Ticket" CASCADE;
CREATE TABLE public."Ticket"(
	"No_de_tickect" integer NOT NULL,
	"Importe" integer,
	"Fecha" date,
	"Codigo_trabajador_Trabajador" integer,
	CONSTRAINT "Ticket_pk" PRIMARY KEY ("No_de_tickect")

);
-- ddl-end --
ALTER TABLE public."Ticket" OWNER TO postgres;
-- ddl-end --

-- object: "Trabajador_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Ticket" DROP CONSTRAINT IF EXISTS "Trabajador_fk" CASCADE;
ALTER TABLE public."Ticket" ADD CONSTRAINT "Trabajador_fk" FOREIGN KEY ("Codigo_trabajador_Trabajador")
REFERENCES public."Trabajador" ("Codigo_trabajador") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public."Productos" | type: TABLE --
-- DROP TABLE IF EXISTS public."Productos" CASCADE;
CREATE TABLE public."Productos"(
	"Codigo_de_barras" varchar NOT NULL,
	"Nombre" text,
	"Tipo" varchar,
	"Descripcion" text,
	"Precio" integer,
	CONSTRAINT "Productos_pk" PRIMARY KEY ("Codigo_de_barras")

);
-- ddl-end --
ALTER TABLE public."Productos" OWNER TO postgres;
-- ddl-end --

-- object: public."Ticket_Productos" | type: TABLE --
-- DROP TABLE IF EXISTS public."Ticket_Productos" CASCADE;
CREATE TABLE public."Ticket_Productos"(
	"Cantidad" smallint,
	"No_de_tickect_Ticket" integer NOT NULL,
	"Codigo_de_barras_Productos" varchar NOT NULL,
	CONSTRAINT "Ticket_Productos_pk" PRIMARY KEY ("Codigo_de_barras_Productos","No_de_tickect_Ticket")

);
-- ddl-end --

-- object: "Ticket_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Ticket_Productos" DROP CONSTRAINT IF EXISTS "Ticket_fk" CASCADE;
ALTER TABLE public."Ticket_Productos" ADD CONSTRAINT "Ticket_fk" FOREIGN KEY ("No_de_tickect_Ticket")
REFERENCES public."Ticket" ("No_de_tickect") MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: "Productos_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Ticket_Productos" DROP CONSTRAINT IF EXISTS "Productos_fk" CASCADE;
ALTER TABLE public."Ticket_Productos" ADD CONSTRAINT "Productos_fk" FOREIGN KEY ("Codigo_de_barras_Productos")
REFERENCES public."Productos" ("Codigo_de_barras") MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: public."Tienda_Productos" | type: TABLE --
-- DROP TABLE IF EXISTS public."Tienda_Productos" CASCADE;
CREATE TABLE public."Tienda_Productos"(
	"Stock" smallint,
	"Codigo_de_barras_Productos" varchar NOT NULL,
	"ID_Tienda_Tienda" integer NOT NULL,
	CONSTRAINT "Tienda_Productos_pk" PRIMARY KEY ("ID_Tienda_Tienda","Codigo_de_barras_Productos")

);
-- ddl-end --

-- object: "Tienda_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Tienda_Productos" DROP CONSTRAINT IF EXISTS "Tienda_fk" CASCADE;
ALTER TABLE public."Tienda_Productos" ADD CONSTRAINT "Tienda_fk" FOREIGN KEY ("ID_Tienda_Tienda")
REFERENCES public."Tienda" ("ID_Tienda") MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: "Productos_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Tienda_Productos" DROP CONSTRAINT IF EXISTS "Productos_fk" CASCADE;
ALTER TABLE public."Tienda_Productos" ADD CONSTRAINT "Productos_fk" FOREIGN KEY ("Codigo_de_barras_Productos")
REFERENCES public."Productos" ("Codigo_de_barras") MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --


