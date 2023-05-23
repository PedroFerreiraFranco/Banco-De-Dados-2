#relatorio consolidado para mostrar todas as vendas determinando cliente

SELECT v.codVenda,DATE_FORMAT(v.dataHora,"%d/%m/%Y %H:%i:%s") AS dataHora, c.nome AS "cliente"
FROM venda AS v INNER JOIN cliente AS c ON v.CLIENTE_codCliente = c.codCliente