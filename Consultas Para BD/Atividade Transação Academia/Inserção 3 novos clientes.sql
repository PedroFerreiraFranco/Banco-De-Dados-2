	SELECT * FROM clientes;
BEGIN;
	INSERT INTO clientes VALUES(NULL, "Neymar","548.457.359-55","1992-02-05","(98)997253569","neymar@gmail.com","Vila Belmiro","Santos",5);	
	INSERT INTO clientes VALUES(NULL, "Fernando","548.368.958-52","1990-04-18","(98)999602578","fernando@outlook.com","Rua italia","Roma",7);	
	INSERT INTO clientes VALUES(NULL, "Messi","557.339-554","1990-04-18","(98)999602578","messi@barcelona.com","Rua espanha","Bueno Brandão",9);
commit;
SELECT * FROM clientes;