/* 7 */

select 'ALTER TABLE' || table_name || 'ENABLE TRIGGER ALL;' FROM information_schema.tables where table_schema = 'public';

select 'ALTER TABLE' || table_name || 'DISABLE TRIGGER ALL;' FROM information_schema.tables where table_schema = 'public'; 

/* 8 */

explain analyze
select distinct "Musicos"."nombre", "Musicos"."instrumentos"
from "Musicos" 
	inner join "Grupos" on "Musicos"."codigo_grupo_Grupos" = "Grupos"."codigo_grupo"
	inner join "Discos" on "Grupos"."codigo_grupo" = "Discos"."codigo_grupo_Grupos" 
	inner join "Canciones" on "Discos"."codigo_disco" = "Canciones"."codigo_disco_Discos"
	inner join "Grupos_Tocan_Conciertos" on "Grupos"."codigo_grupo" = "Grupos_Tocan_Conciertos"."codigo_grupo_Grupos"
	inner join "Conciertos" on "Grupos_Tocan_Conciertos"."codigo_concierto_Conciertos" = "Conciertos"."codigo_concierto"
	inner join "Entradas" on "Conciertos"."codigo_concierto" = "Entradas"."codigo_concierto_Conciertos"
	inner join (select "Canciones"."codigo_disco_Discos", count("Canciones"."codigo_disco_Discos") as "num_canciones"
				from "Canciones"
				group by "Canciones"."codigo_disco_Discos") as "canciones_query" 
				on "Canciones"."codigo_disco_Discos" = "canciones_query"."codigo_disco_Discos"
where "Conciertos"."pais" = 'España' 
	and ("Discos"."genero" = 'rock' or "Discos"."genero" = 'pop')
	and "Canciones"."duracion" >= '00:03:00' 
	and "canciones_query"."num_canciones" >= 3
	and "Entradas"."precio" > '50'
	
/* 9 */

create index hash_pais on "Conciertos" using hash(pais);
create index hash_genero on "Discos" using hash(genero);
create index hash_duracion on "Canciones" using hash(duracion);
create index arbolb_precio on "Entradas"(precio);

/* 10 */

alter table "Musicos" drop constraint "Grupos_fk";
alter table "Discos" drop constraint "Grupos_fk";
alter table "Grupos_Tocan_Conciertos" drop constraint "Grupos_fk";

delete from "Grupos" where "Grupos"."codigo_grupo" in (select "Grupos"."codigo_grupo"
													   from "Grupos"
													   order by random()
													   limit 100000)

alter table "Musicos" add constraint "Grupos_fk" foreign key ("codigo_grupo_Grupos")
references "Grupos" ("codigo_grupo") match full on delete cascade on update cascade;
alter table "Discos" add constraint "Grupos_fk" foreign key ("codigo_grupo_Grupos")
references "Grupos" ("codigo_grupo") match full on delete cascade on update cascade;
alter table "Grupos_Tocan_Conciertos" add constraint "Grupos_fk" foreign key ("codigo_grupo_Grupos")
references "Grupos" ("codigo_grupo") match full on delete cascade on update cascade;

/* 12 */
create index arbolb_grupospk on "Grupos"(codigo_grupo);

vacuum full "Grupos";
analyze "Grupos";
reindex table "Grupos";
cluster "Grupos" using arbolb_grupospk;