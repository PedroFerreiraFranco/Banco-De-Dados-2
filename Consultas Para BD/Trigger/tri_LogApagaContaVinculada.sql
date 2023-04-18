/*Proposta: criar um trigger (tri_LogApagaContaVinculada)
que registre na Auditoiria a exclusão
de uma conta cinculada*/

delimiter $
CREATE TRIGGER tri_LogApagaContaVinculada
AFTER DELETE 
ON contavinculada
FOR EACH ROW
BEGIN
	SELECT nome INTO @nomeCliente FROM cliente
	WHERE idCliente = OLD.CLIENTE_idCLIENTE;
	
	SET @mensagem = CONCAT("Exclusão de conta do cliente: ",@nomeCliente);
	
	INSERT INTO auditoria 
	VALUES(NULL, @mensagem, "contavinculada", NOW(),USER());
END$
delimiter ; 
