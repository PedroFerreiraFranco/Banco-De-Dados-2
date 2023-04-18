/*Transação que apague determinado vinculo de conta e a respectiva conta*/
SELECT * FROM contavinculada;
SELECT * FROM conta;
BEGIN;
	DELETE FROM contavinculada WHERE CONTA_idCONTA = 3;
	DELETE FROM conta WHERE idCONTA = 3;
commit;
SELECT * FROM conta;
SELECT * FROM contavinculada;