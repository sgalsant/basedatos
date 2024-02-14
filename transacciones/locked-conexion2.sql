start transaction;

select * from cuentas where iban="BBBBBBBB" for update;  -- consulta 1

select * from cuentas;  -- consulta 2

select * from cuentas for update nowait; -- consulta 3

select * from cuentas for update nowait; -- consulta 4

select * from cuentas for update skip locked; -- consulta 5

update cuentas set deposito = deposito + 100 where iban="BBBBBBBB";

update cuentas set deposito = deposito - 100 where iban="AAAAAAAA";

rollback;

