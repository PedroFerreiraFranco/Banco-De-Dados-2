	SELECT * FROM planos;
	SELECT * FROM fornecedores;
	SELECT * FROM cargos;
BEGIN;
 UPDATE planos SET valor = valor*1.10 WHERE tipoPlano != "";
 UPDATE fornecedores SET endereco = "Rua Gaivota" WHERE codFORNECEDORES = 1;
 UPDATE cargos SET salario  =  salario + 300 WHERE tipo = "Personal";

COMMIT;

  	SELECT * FROM planos;
	SELECT * FROM fornecedores;
	SELECT * FROM cargos;
