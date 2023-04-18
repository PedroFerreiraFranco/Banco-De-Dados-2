	SELECT * FROM conta;
BEGIN;
	UPDATE conta SET senha = CONCAT(REPLACE(TIME(NOW()), ':', ''), 'PO')
	WHERE tipo = 'Poupança';
COMMIT;
	SELECT * FROM conta;