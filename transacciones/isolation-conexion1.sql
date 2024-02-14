select * from performance_schema.events_transactions_current where state = "ACTIVE";

set session transaction isolation level READ UNCOMMITTED; -- VALORES: REPEATABLE READ // READ COMMITTED // READ UNCOMMITTED // SERIALIZABLE

select @@SESSION.transaction_isolation;

start transaction;

update cuentas set deposito = deposito - 100 where iban="BBBBBBBB";

delete from cuentas where iban = "CCCCCCCC";

insert into cuentas (iban, nif, deposito) values ("CCCCCCCC", "11111111", 500.0);

commit;


