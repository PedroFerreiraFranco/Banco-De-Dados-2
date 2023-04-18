SELECT codCLIENTES,
nome, 
cpf,
DATE_FORMAT(dataNascimento, "%d/%m/%Y")AS "data de anscimento", 
telefone 
FROM clientes WHERE telefone !=("");

CREATE VIEW v_clientesTelefoneOK 
AS (SELECT codCLIENTES,
nome, 
cpf,
DATE_FORMAT(dataNascimento, "%d/%m/%Y")AS "data de anscimento", 
telefone 
FROM clientes WHERE telefone !=(""));

SELECT * FROM v_clientestelefoneok;

/*-------------------------------------------------------------------------------------------*/

SELECT * FROM cargos order BY salario DESC;  

CREATE VIEW v_salarioCargoDesc 
AS(SELECT * FROM cargos order BY salario DESC); 

SELECT * FROM v_salariocargodesc;

/*-------------------------------------------------------------------------------------------*/

SELECT nome,date_FORMAT(dataNascimento,"%d/%m/%Y")AS "Data de nascimento " 
from clientes ORDER BY nome ASC;

CREATE VIEW v_clientesNomeOrdemAlfabetica
AS(SELECT nome,date_FORMAT(dataNascimento,"%d/%m/%Y")AS "Data de nascimento" 
from clientes ORDER BY nome ASC); 

SELECT * FROM v_clientesnomeordemalfabetica;

