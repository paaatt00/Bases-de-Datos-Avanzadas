select pg_reload_conf();

/* 1 */
create extension postgres_fdw

create server server2 
	foreign data wrapper postgres_fdw 
	options (host '83.46.104.201', port '5432', dbname 'PROMOTORA2');
	
create user mapping for postgres 
	server server2
	options(user 'postgres', password 'postgres');
	
import foreign schema public from server server2 into "PECL4";