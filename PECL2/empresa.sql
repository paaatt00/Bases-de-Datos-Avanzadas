/* 4 */

select pg_stat_reset()
explain (analyze TRUE, BUFFERS TRUE,FORMAT text)
	select count(numero_empleado)
	from trabaja_proyecto

/* 6 */

select pg_stat_reset()
explain (analyze TRUE, COSTS TRUE, BUFFERS TRUE, FORMAT text)
	select *
	from empleado
	where salario > 96000

/* 7 */

select pg_stat_reset()
explain (analyze TRUE, COSTS TRUE, BUFFERS TRUE, FORMAT text)
	select proyecto.*
	from trabaja_proyecto
		inner join proyecto on trabaja_proyecto.numero_proyecto = proyecto.numero_proyecto
	where horas = 8

/* 8 */
select *
from trabaja_proyecto
where horas <2

select pg_stat_reset()
explain (analyze TRUE, COSTS TRUE, BUFFERS TRUE, FORMAT text)
	select proyecto.*
	from trabaja_proyecto 
		inner join proyecto on proyecto.numero_proyecto = trabaja_proyecto.numero_proyecto
		inner join empleado on trabaja_proyecto.numero_empleado = empleado.numero_empleado
	where coste > 15000 and salario = 24000 and horas < 2
	
