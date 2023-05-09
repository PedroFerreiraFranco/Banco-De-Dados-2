#calculo de idade dos clientes
SELECT * FROM cliente;

SELECT nome, dataNascimento,
FLOOR(DATEDIFF(CURDATE(),dataNascimento)/365) AS idade
FROM cliente;