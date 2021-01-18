/* 2 */ 

/* 3 */

/* 4 */
explain analyze
select *
from automovil
where codigo_automovil = 8134468

/* 5 */
explain analyze
select precio
from automovil inner join concesionario on automovil.codigo_concesionario = concesionario.codigo_concesionario
where marca = 'marca600'

select count(distinct(marca))
from concesionario

/* 6 */
explain analyze
select codigo_automovil, matricula, precio, automovil.codigo_concesionario
from automovil inner join concesionario on automovil.codigo_concesionario = concesionario.codigo_concesionario
where marca = 'marca600' and precio > 16000

select max(precio)
from automovil

