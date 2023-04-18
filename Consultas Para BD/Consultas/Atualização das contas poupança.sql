/*Transação para atualização do slado das contas do tipo Poupança em 10% */
SELECT * FROM conta;
BEGIN;
	UPDATE conta SET saldo = saldo * 1.10
	WHERE tipo = "Poupança";
commit;
SELECT * FROM conta;