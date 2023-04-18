#mostrar nome dos clientes e data de nascimento no formato brasileiro

SELECT nome,DATE_FORMAT(dataNascimento, "%d/%m/%y")AS "data de anscimento" FROM cliente;

CREATE VIEW nascimentoClientes 
AS(select nome, DATE_FORMAT(dataNascimento, "%d/%m/%y")
AS "data de anscimento" FROM cliente);

SELECT * FROM nascimentoCLientes;