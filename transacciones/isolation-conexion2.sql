use banco;

set session transaction isolation level READ UNCOMMITTED; -- VALORES: REPEATABLE READ // READ COMMITTED // READ UNCOMMITTED // SERIALIZABLE

select @@SESSION.transaction_isolation;

start transaction;

select * from cuentas; -- consulta 1

-- en este punto ejecuta el commit en la transacción 1

select * from cuentas; -- consulta 2

update cuentas set deposito = deposito - 100 where iban="AAAAAAAA";

update cuentas set deposito = deposito + 100 where iban="BBBBBBBB";

update cuentas set deposito = deposito + 100 where iban="CCCCCCCC";

commit;

select * from cuentas; -- consulta 3



