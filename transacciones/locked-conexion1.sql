-- recuerda finalizar todas las transacciones activas
select * from performance_schema.events_transactions_current where state = "ACTIVE";

start transaction;
select * from cuentas where iban = "AAAAAAAA" for update;

select * from performance_schema.data_locks;

rollback;

