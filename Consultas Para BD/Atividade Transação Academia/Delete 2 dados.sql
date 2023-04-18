SELECT * FROM fornecedores;
SELECT * FROM produtos;
BEGIN;
	DELETE FROM produtos WHERE FORNECEDORES_codFornecedores = 4;
	DELETE FROM fornecedores WHERE codFORNECEDORES = 4;
COMMIT;
SELECT * FROM fornecedores;
SELECT * FROM produtos;	
