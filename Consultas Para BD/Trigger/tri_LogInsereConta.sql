/*Proposta: Criar um trigger que registre no log de auditoria a inserção de uma conta com 
seus respectivos dados: idConta, tipo e saldo*/

delimiter $
CREATE TRIGGER tri_LogInsereConta
AFTER INSERT  
ON conta
FOR EACH ROW
BEGIN	
		SET @mensagem = CONCAT("Conta iserida: ",NEW.idCONTA,". Com tipo: ",NEW.tipo, ". Saldo de: ",NEW.saldo);
		INSERT INTO auditoria VALUES(NULL, @mensagem, "conta", NOW(),USER());
		
END$
delimiter ; 