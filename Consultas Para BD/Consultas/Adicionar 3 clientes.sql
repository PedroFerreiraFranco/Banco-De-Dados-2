/*adicionar 3 clientes */

SELECT * FROM cliente;
BEGIN;
	INSERT INTO cliente VALUES(NULL, "Neymar Junior","548.457.359-55","RJ 658.564.352","1992-02-05","(98)997253569");	
	INSERT INTO cliente VALUES(NULL, "Fernando Torrres","548.368.958-52","SP 985.356.352","1990-04-18","(98)999602578");	
	INSERT INTO cliente VALUES(NULL, "Messi Aguero","557.339-554","MG 285.564.352","1990-04-18","(98)999602578");
commit;
SELECT * FROM cliente;