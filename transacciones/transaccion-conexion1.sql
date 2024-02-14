select * from cuentas;

start transaction;

select * from performance_schema.events_transactions_current where state = "ACTIVE";

start transaction;

select * from performance_schema.events_transactions_current where state = "ACTIVE";

update cuentas set deposito = deposito - 100 where iban="AAAAAAAA";

commit;

select * from cuentas;

update cuentas set deposito = deposito + 100 where iban="BBBBBBBB";

select * from cuentas;

rollback;

select * from cuentas;

