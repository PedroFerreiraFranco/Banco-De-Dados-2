SELECT * FROM cliente;
BEGIN;
	UPDATE cliente SET nome = LOWER(nome) WHERE rg IS  NULL;
COMMIT;
	SELECT * FROM cliente;
