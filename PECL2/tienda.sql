/* 9 */

alter table "Productos" disable trigger ALL
alter table "Ticket" disable trigger all
alter table "Tienda_Productos" disable trigger all
alter table "Ticket" disable trigger all
alter table "Trabajador" disable trigger all
alter table "Ticket_Productos" disable trigger all

alter table "Productos" enable trigger ALL
alter table "Ticket" enable trigger all
alter table "Tienda_Productos" enable trigger all
alter table "Ticket" enable trigger all
alter table "Trabajador" enable trigger all
alter table "Ticket_Productos" enable trigger all

delete from "Trabajador"
delete from "Productos"
delete from "Ticket"
delete from "Ticket_Productos"
delete from "Tienda"
delete from "Tienda_Productos"

/* 10 */

SELECT pg_stat_reset()
explain(analyze TRUE, buffers TRUE, format TEXT)
select "Trabajador"."Nombre", "Trabajador"."DNI"
from "Trabajador"
	inner join "Ticket" on "Trabajador"."Codigo_trabajador" = "Ticket"."Codigo_trabajador_Trabajador"
	inner join "Ticket_Productos" on "Ticket"."No_de_ticket" = "Ticket_Productos"."No_de_ticket_Ticket"
	inner join "Productos" on "Ticket_Productos"."Codigo_de_barras_Productos" = "Productos"."Codigo_de_barras"
	inner join "Tienda_Productos" on "Productos"."Codigo_de_barras" = "Tienda_Productos"."Codigo_de_barras_Productos"
	inner join "Tienda" on "Tienda_Productos"."ID_Tienda_Tienda" = "Tienda"."ID_Tienda"
where "Ticket"."Fecha" between '01-09-2019' and '31-12-2019'
	and "Ticket_Productos"."Cantidad" > 4
	and "Productos"."Precio" = any (select "Precio"
			 					    from "Productos"
			 					    where "Precio" > 500)
	and "Trabajador"."Salario" > 3000 and "Trabajador"."Salario" < 5000
	and "Tienda"."Provincia" = 'Madrid'
	and "Tienda_Productos"."Stock" = any (select "Stock"
			 from "Tienda_Productos"
			 where "Stock" < 100)
	and "Productos"."Precio" > 400

SELECT pg_stat_reset()
explain(analyze TRUE, buffers TRUE, format TEXT)
select "Trabajador"."Nombre", "Trabajador"."DNI"
from "Tienda"
	inner join "Trabajador" on "Tienda"."ID_Tienda" = "Trabajador"."ID_Tienda_Tienda"
where "Trabajador"."Salario" between 3000 and 5000 
	and "Tienda"."Provincia" = 'Madrid'
	and "Tienda"."ID_Tienda" 
	in 
	(select "Tienda_Productos"."ID_Tienda_Tienda"
	 from "Tienda_Productos"
	 	inner join "Productos" on "Productos"."Codigo_de_barras" = "Tienda_Productos"."Codigo_de_barras_Productos"
	 where "Tienda_Productos"."Stock" < 100 and "Productos"."Precio" > 400)

/* 11 */

VACUUM (VERBOSE, ANALYZE) "Nombre_tabla"
