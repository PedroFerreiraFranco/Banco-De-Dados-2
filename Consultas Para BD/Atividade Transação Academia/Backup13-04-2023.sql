-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.20-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para academia
DROP DATABASE IF EXISTS `academia`;
CREATE DATABASE IF NOT EXISTS `academia` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `academia`;

-- Copiando estrutura para tabela academia.cargos
DROP TABLE IF EXISTS `cargos`;
CREATE TABLE IF NOT EXISTS `cargos` (
  `codCARGO` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) NOT NULL,
  `salario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`codCARGO`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela academia.cargos: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `cargos` DISABLE KEYS */;
INSERT INTO `cargos` (`codCARGO`, `tipo`, `salario`) VALUES
	(2, 'Personal', 2799.99),
	(3, 'Recepcionista', 1500.00),
	(4, 'Faxineira', 1100.00),
	(6, 'Avaliador Físico', 2300.00);
/*!40000 ALTER TABLE `cargos` ENABLE KEYS */;

-- Copiando estrutura para tabela academia.clientes
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `codCLIENTES` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(45) NOT NULL,
  `dataNascimento` date NOT NULL,
  `telefone` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `PLANOS_codPLANOS` int(11) NOT NULL,
  PRIMARY KEY (`codCLIENTES`,`PLANOS_codPLANOS`),
  KEY `fk_CLIENTES_PLANOS1_idx` (`PLANOS_codPLANOS`),
  CONSTRAINT `fk_CLIENTES_PLANOS1` FOREIGN KEY (`PLANOS_codPLANOS`) REFERENCES `planos` (`codPLANOS`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela academia.clientes: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` (`codCLIENTES`, `nome`, `cpf`, `dataNascimento`, `telefone`, `email`, `endereco`, `cidade`, `PLANOS_codPLANOS`) VALUES
	(1, 'Fabio', '000-000-000-99', '1980-05-15', '(35)998602715', 'fabio@gmail.com', 'Sítio Shekinah', 'Machado', 6),
	(6, 'Pedro', '768-564-872-09', '2003-12-27', '', '', '', 'Machado', 9),
	(7, 'Gustavo', '546-779-865-88', '2004-05-14', '', 'gustavo@hotmail.com', 'Rua Ferraz Leite, 259', 'Paraguaçu', 7),
	(8, 'Gabriel', '143-987-675-45', '2000-08-11', '(35)988765423', '', 'Rua Barão Diniz, 89', 'Alfenas', 5),
	(10, 'André', '598-547-256-36', '2004-04-04', '(35)988264587', 'andre@yahoo.com', 'Vila Centenária', 'Machado', 9),
	(23, 'Neymar', '548.457.359-55', '1992-02-05', '(98)997253569', 'neymar@gmail.com', 'Vila Belmiro', 'Santos', 5),
	(24, 'Fernando', '548.368.958-52', '1990-04-18', '(98)999602578', 'fernando@outlook.com', 'Rua italia', 'Roma', 7),
	(25, 'Messi', '557.339-554', '1990-04-18', '(98)999602578', 'messi@barcelona.com', 'Rua espanha', 'Bueno Brandão', 9);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;

-- Copiando estrutura para tabela academia.equipamentos
DROP TABLE IF EXISTS `equipamentos`;
CREATE TABLE IF NOT EXISTS `equipamentos` (
  `codEQUIPAMENTOS` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descricao` varchar(300) DEFAULT NULL,
  `FORNECEDORES_codFORNECEDORES` int(11) NOT NULL,
  PRIMARY KEY (`codEQUIPAMENTOS`,`FORNECEDORES_codFORNECEDORES`),
  KEY `fk_EQUIPAMENTOS_FORNECEDORES1_idx` (`FORNECEDORES_codFORNECEDORES`),
  CONSTRAINT `fk_EQUIPAMENTOS_FORNECEDORES1` FOREIGN KEY (`FORNECEDORES_codFORNECEDORES`) REFERENCES `fornecedores` (`codFORNECEDORES`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela academia.equipamentos: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `equipamentos` DISABLE KEYS */;
INSERT INTO `equipamentos` (`codEQUIPAMENTOS`, `nome`, `descricao`, `FORNECEDORES_codFORNECEDORES`) VALUES
	(1, 'Esteira', 'Equipamento usado para caminhada ou corrida', 1),
	(2, 'Cadeira Flexora', 'A Cadeira extensora e flexora é um aparelho da linha Biodelta com sistema de alavancas e pesos livres que permite os dois movimentos básicos do joelho. Na extensão ativa de forma completa os quatro feixes do quadríceps. Na flexão, ativa os posteriores da coxa.', 2);
/*!40000 ALTER TABLE `equipamentos` ENABLE KEYS */;

-- Copiando estrutura para tabela academia.fornecedores
DROP TABLE IF EXISTS `fornecedores`;
CREATE TABLE IF NOT EXISTS `fornecedores` (
  `codFORNECEDORES` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cnpj` varchar(45) NOT NULL,
  `telefone` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  PRIMARY KEY (`codFORNECEDORES`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela academia.fornecedores: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `fornecedores` DISABLE KEYS */;
INSERT INTO `fornecedores` (`codFORNECEDORES`, `nome`, `cnpj`, `telefone`, `email`, `endereco`) VALUES
	(1, 'Lyon', '12345678901234', '32955674', 'lyon@gmail.com', 'Rua Gaivota'),
	(2, 'Tonnus Fitness', '7894561230321', '1934419693', 'sac@tonusfitness.com.br', 'Rua Leopoldina Ribeiro Moreira Cezar, 86 - Jd. São Paulo - Limeira-SP'),
	(3, 'Bold', '014702580369', '99995555', 'contato@boldsnacks.com.br', 'Avenida Artur Bernardes, 657. Centro - Machado - MG');
/*!40000 ALTER TABLE `fornecedores` ENABLE KEYS */;

-- Copiando estrutura para tabela academia.funcionarios
DROP TABLE IF EXISTS `funcionarios`;
CREATE TABLE IF NOT EXISTS `funcionarios` (
  `codFUNCIONARIOS` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(45) NOT NULL,
  `dataNascimento` date NOT NULL,
  `telefone` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `carteiraTrabalho` varchar(45) NOT NULL,
  `dataAdmissao` date NOT NULL,
  `dataDemissao` date DEFAULT NULL,
  `CARGO_codCARGO` int(11) NOT NULL,
  PRIMARY KEY (`codFUNCIONARIOS`,`CARGO_codCARGO`),
  KEY `fk_FUNCIONARIOS_CARGO1_idx` (`CARGO_codCARGO`),
  CONSTRAINT `fk_FUNCIONARIOS_CARGO1` FOREIGN KEY (`CARGO_codCARGO`) REFERENCES `cargos` (`codCARGO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela academia.funcionarios: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `funcionarios` DISABLE KEYS */;
INSERT INTO `funcionarios` (`codFUNCIONARIOS`, `nome`, `cpf`, `dataNascimento`, `telefone`, `email`, `endereco`, `cidade`, `carteiraTrabalho`, `dataAdmissao`, `dataDemissao`, `CARGO_codCARGO`) VALUES
	(1, 'Fernado Souza', '45321456789', '1998-04-16', '988763454', 'fernando@gmail.com', 'Rua Barao Diniz, 233', 'Machado', '564545644', '2022-10-31', '0000-00-00', 2);
/*!40000 ALTER TABLE `funcionarios` ENABLE KEYS */;

-- Copiando estrutura para tabela academia.itemvenda
DROP TABLE IF EXISTS `itemvenda`;
CREATE TABLE IF NOT EXISTS `itemvenda` (
  `PRODUTOS_codPRODUTOS` int(11) NOT NULL,
  `VENDAS_codVENDA` int(11) NOT NULL,
  `quantidade` decimal(10,0) NOT NULL,
  PRIMARY KEY (`PRODUTOS_codPRODUTOS`,`VENDAS_codVENDA`),
  KEY `fk_PRODUTOS_has_VENDAS_VENDAS1_idx` (`VENDAS_codVENDA`),
  KEY `fk_PRODUTOS_has_VENDAS_PRODUTOS1_idx` (`PRODUTOS_codPRODUTOS`),
  CONSTRAINT `fk_PRODUTOS_has_VENDAS_PRODUTOS1` FOREIGN KEY (`PRODUTOS_codPRODUTOS`) REFERENCES `produtos` (`codPRODUTOS`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PRODUTOS_has_VENDAS_VENDAS1` FOREIGN KEY (`VENDAS_codVENDA`) REFERENCES `vendas` (`codVENDA`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela academia.itemvenda: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `itemvenda` DISABLE KEYS */;
/*!40000 ALTER TABLE `itemvenda` ENABLE KEYS */;

-- Copiando estrutura para tabela academia.planos
DROP TABLE IF EXISTS `planos`;
CREATE TABLE IF NOT EXISTS `planos` (
  `codPLANOS` int(11) NOT NULL AUTO_INCREMENT,
  `dataInicio` date NOT NULL,
  `dataVencimento` date DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `tipoPlano` varchar(45) NOT NULL,
  PRIMARY KEY (`codPLANOS`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela academia.planos: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `planos` DISABLE KEYS */;
INSERT INTO `planos` (`codPLANOS`, `dataInicio`, `dataVencimento`, `valor`, `tipoPlano`) VALUES
	(5, '0000-00-00', '0000-00-00', 77.00, 'Anual'),
	(6, '0000-00-00', '0000-00-00', 121.00, 'Mensal'),
	(7, '0000-00-00', '0000-00-00', 99.00, 'Semestral'),
	(9, '0000-00-00', '0000-00-00', 93.50, 'Bimestral');
/*!40000 ALTER TABLE `planos` ENABLE KEYS */;

-- Copiando estrutura para procedure academia.proc_alteraCargos
DROP PROCEDURE IF EXISTS `proc_alteraCargos`;
DELIMITER //
CREATE PROCEDURE `proc_alteraCargos`(in codigoCargos int, in novoNomeCargo varchar(45), in novoSalarioCargo decimal(10,2))
BEGIN
update cargos set  tipo = novoNomeCargo, salario = novoSalarioCargo  where codCargo = codigoCargos;
END//
DELIMITER ;

-- Copiando estrutura para procedure academia.proc_alteraClientes
DROP PROCEDURE IF EXISTS `proc_alteraClientes`;
DELIMITER //
CREATE PROCEDURE `proc_alteraClientes`(in codigoClientes int, in nomeCliente varchar(100), in cpfCliente varchar(45), in dataNascimentoCliente date, in telCliente varchar(100), 
in emailCliente varchar(100), in  enderecoCliente varchar(100), in cidadeCliente varchar(100), in codigoPlano int)
BEGIN
update clientes set  nome = nomeCliente, cpf = cpfCliente, dataNascimento = dataNascimentoCliente,  
telefone = telCliente, email = emailCliente, endereco = enderecoCliente, cidade = cidadeCliente, PLANOS_codPLANOS = codigoPlano
where codCLIENTES = codigoClientes;
END//
DELIMITER ;

-- Copiando estrutura para procedure academia.proc_alteraEquipamentos
DROP PROCEDURE IF EXISTS `proc_alteraEquipamentos`;
DELIMITER //
CREATE PROCEDURE `proc_alteraEquipamentos`(in codigoEquipamento int, in nomeEquipamento varchar(100), in descricaoEquipamento varchar(300), in codigoFornecedor int)
BEGIN
update equipamentos set nome = nomeEquipamento, descricao = descricaoEquipamento, FORNECEDORES_codFORNECEDORES = codigoFornecedor where codEQUIPAMENTOS = codigoEquipamento;
END//
DELIMITER ;

-- Copiando estrutura para procedure academia.proc_alteraFornecedores
DROP PROCEDURE IF EXISTS `proc_alteraFornecedores`;
DELIMITER //
CREATE PROCEDURE `proc_alteraFornecedores`(in codigoFornecedores int, in novoNomeFornecedor varchar(100), in novoCnpjFornecedor varchar(45), in novoTelefoneFornecedor varchar(45),
in novoEmailFornecedor varchar(100), in novoEnderecoFornecedor varchar(100))
BEGIN
update fornecedores set nome = novoNomeFornecedor, cnpj = novoCnpjFornecedor, telefone = novoTelefoneFornecedor,
email = novoEmailFornecedor, endereco = novoEnderecoFornecedor where codFornecedores = codigoFornecedores;
END//
DELIMITER ;

-- Copiando estrutura para procedure academia.proc_alteraFuncionarios
DROP PROCEDURE IF EXISTS `proc_alteraFuncionarios`;
DELIMITER //
CREATE PROCEDURE `proc_alteraFuncionarios`(in codigoFuncionarios int, in nomeFuncionario varchar(100), in cpfFuncionario varchar(45), in dataNascimentoFuncionario date, in telefoneFuncionario varchar(45),
in emailFuncionario varchar(100), in enderecoFuncionario varchar(100), in cidadeFuncionario varchar(100), carteiraTrabalhoFuncionario varchar(45), in dataAdmissaoFuncionario date, in dataDemissaoFuncionario date, in codigoCargo int)
BEGIN
update funcionarios set nome = nomeFuncionario, cpf = cpfFuncionario, dataNascimento = dataNascimentoFuncionario, telefone = telefoneFuncionario, 
email = emailFuncionario, endereco = enderecoFuncionario, cidade = cidadeFuncionario, carteiraTrabalho = carteiraTrabalhoFuncionario,
dataAdmissao = dataAdmissaoFuncionario, dataDemissao = dataDemissaoFuncionario, CARGO_codCARGO = codigoCargo where codFUNCIONARIOS = codigoFuncionarios;
END//
DELIMITER ;

-- Copiando estrutura para procedure academia.proc_alteraPlanos
DROP PROCEDURE IF EXISTS `proc_alteraPlanos`;
DELIMITER //
CREATE PROCEDURE `proc_alteraPlanos`(in codigoPlanos int, in dataInicioPlano date, in dataVencimentoPlano date, in valorPlano decimal (10,2), in novoTipoPlano varchar(45))
BEGIN
update planos set dataInicio = dataInicioPlano, dataVencimento = dataVencimentoPlano, valor = valorPlano,
tipoPlano = novoTipoPlano where codPLANOS = codigoPlanos;
END//
DELIMITER ;

-- Copiando estrutura para procedure academia.proc_alteraProdutos
DROP PROCEDURE IF EXISTS `proc_alteraProdutos`;
DELIMITER //
CREATE PROCEDURE `proc_alteraProdutos`(in codigoProdutos int, in nomeProduto varchar(100), in precoCustoProduto decimal(10,2), in precoVendaProduto decimal(10,2),
in margemLucroProduto decimal(5,2), in dataValidadeProduto date, in quantidadeEstoqueProduto decimal(10,2), in codigoFornecedor int)
BEGIN
update produtos set nome = nomeProduto, precoCusto = precoCustoProduto, precoVenda = precoVendaProduto, margemLucro = margemLucroProduto, 
dataValidade = dataValidadeProduto, quantidadeEstoque = quantidadeEstoqueProduto, FORNECEDORES_codFORNECEDORES = codigoFornecedor where codPRODUTOS = codigoProdutos;
END//
DELIMITER ;

-- Copiando estrutura para procedure academia.proc_alteraVendas
DROP PROCEDURE IF EXISTS `proc_alteraVendas`;
DELIMITER //
CREATE PROCEDURE `proc_alteraVendas`(in codigo int, in dataDaVenda datetime, in descontoDavenda decimal(5,2),in tipoDaVenda ENUM('À vista', 'Cartão Débito', 'Cartão Crédito', 'PIX'), 
in codigoDoCliente int, in codigoDoPlano int, in codigoDoFuncionario int)
BEGIN
update vendas set dataHora = dataDaVenda, desconto = descontoDavenda, tipoVenda = tipoDaVenda, CLIENTES_codCLIENTES = codigoDoCliente, CLIENTES_PLANOS_codPLANOS = codigoDoPlano, 
FUNCIONARIOS_codFUNCIONARIOS = codigoDoFuncionario where codVENDA = codigo;
END//
DELIMITER ;

-- Copiando estrutura para procedure academia.proc_deleteCargos
DROP PROCEDURE IF EXISTS `proc_deleteCargos`;
DELIMITER //
CREATE PROCEDURE `proc_deleteCargos`(in codigoCargo int)
BEGIN
delete from cargos where codCargo = codigoCargo;
END//
DELIMITER ;

-- Copiando estrutura para procedure academia.proc_deleteClientes
DROP PROCEDURE IF EXISTS `proc_deleteClientes`;
DELIMITER //
CREATE PROCEDURE `proc_deleteClientes`(in codigoClientes int)
BEGIN
delete from clientes where codCLIENTES = codigoClientes;
END//
DELIMITER ;

-- Copiando estrutura para procedure academia.proc_deleteEquipamentos
DROP PROCEDURE IF EXISTS `proc_deleteEquipamentos`;
DELIMITER //
CREATE PROCEDURE `proc_deleteEquipamentos`(in codigoEquipamentos int)
BEGIN
delete from equipamentos where codEQUIPAMENTOS = codigoEquipamentos;
END//
DELIMITER ;

-- Copiando estrutura para procedure academia.proc_deleteFornecedores
DROP PROCEDURE IF EXISTS `proc_deleteFornecedores`;
DELIMITER //
CREATE PROCEDURE `proc_deleteFornecedores`(in codigoFornecedor int)
BEGIN
delete from fornecedores where codFORNECEDORES = codigoFornecedor;
END//
DELIMITER ;

-- Copiando estrutura para procedure academia.proc_deleteFuncionarios
DROP PROCEDURE IF EXISTS `proc_deleteFuncionarios`;
DELIMITER //
CREATE PROCEDURE `proc_deleteFuncionarios`(in codigoFuncionarios int)
BEGIN
delete from funcionarios where codFUNCIONARIOS = codigoFuncionarios;
END//
DELIMITER ;

-- Copiando estrutura para procedure academia.proc_deletePlanos
DROP PROCEDURE IF EXISTS `proc_deletePlanos`;
DELIMITER //
CREATE PROCEDURE `proc_deletePlanos`(in codigoPlanos int)
BEGIN
delete from planos where codPLANOS = codigoPlanos;
END//
DELIMITER ;

-- Copiando estrutura para procedure academia.proc_deleteProdutos
DROP PROCEDURE IF EXISTS `proc_deleteProdutos`;
DELIMITER //
CREATE PROCEDURE `proc_deleteProdutos`(in codigoProdutos int)
BEGIN
delete from produtos where codPRODUTOS = codigoProdutos;
END//
DELIMITER ;

-- Copiando estrutura para procedure academia.proc_deleteVendas
DROP PROCEDURE IF EXISTS `proc_deleteVendas`;
DELIMITER //
CREATE PROCEDURE `proc_deleteVendas`(in codigo int)
BEGIN
delete from vendas where codVENDA = codigo;
END//
DELIMITER ;

-- Copiando estrutura para procedure academia.proc_insereCargos
DROP PROCEDURE IF EXISTS `proc_insereCargos`;
DELIMITER //
CREATE PROCEDURE `proc_insereCargos`(in nomeTipoCargo varchar(45),in salarioTipoCargo decimal(10,2))
BEGIN
insert into cargos values(null, nomeTipoCargo, salarioTipoCargo);
END//
DELIMITER ;

-- Copiando estrutura para procedure academia.proc_insereClientes
DROP PROCEDURE IF EXISTS `proc_insereClientes`;
DELIMITER //
CREATE PROCEDURE `proc_insereClientes`( in nomeCliente varchar(100), in cpfCliente varchar(45), in dataNascimentoCliente date, in telCliente varchar(100), 
in emailCliente varchar(100), in  enderecoCliente varchar(100), in cidadeCliente varchar(100), in codigoPlano int)
BEGIN
insert into clientes values(null,nomeCliente,cpfCliente,dataNascimentoCliente,telCliente,emailCliente,enderecoCliente,cidadeCliente, codigoPlano);
END//
DELIMITER ;

-- Copiando estrutura para procedure academia.proc_insereEquipamentos
DROP PROCEDURE IF EXISTS `proc_insereEquipamentos`;
DELIMITER //
CREATE PROCEDURE `proc_insereEquipamentos`(in nomeDoEquipamento varchar(100), in descricaoEquipamento varchar(300), in codigoFornecedor int)
BEGIN
insert into equipamentos(codEQUIPAMENTOS, nome, descricao, FORNECEDORES_codFORNECEDORES) values (null, nomeDoEquipamento,  descricaoEquipamento, codigoFornecedor);
END//
DELIMITER ;

-- Copiando estrutura para procedure academia.proc_insereFornecedores
DROP PROCEDURE IF EXISTS `proc_insereFornecedores`;
DELIMITER //
CREATE PROCEDURE `proc_insereFornecedores`(in nomeFornecedor varchar(100), in cnpjFornecedor varchar(45), in telefoneFornecedor varchar(45), in emailFornecedor varchar(100), in enderecoFornecedor varchar(100))
BEGIN
insert into fornecedores values(null, nomeFornecedor, cnpjFornecedor, telefoneFornecedor, emailFornecedor, enderecoFornecedor);
END//
DELIMITER ;

-- Copiando estrutura para procedure academia.proc_insereFuncionarios
DROP PROCEDURE IF EXISTS `proc_insereFuncionarios`;
DELIMITER //
CREATE PROCEDURE `proc_insereFuncionarios`(in nomeFuncionario varchar(100), in cpfFuncionario varchar(45), in dataNascimentoFuncionario date, in telFuncionario varchar(100), 
in emailFuncionario varchar(100), in  enderecoFuncionario varchar(100), in cidadeFuncionario varchar(100), in carteiraTrabalhoFuncionario varchar(45),in dataAdmissaoFuncionario date, in dataDemissaoFuncionario date, in codigoCargo int)
BEGIN
insert into funcionarios(codFUNCIONARIOS, nome, cpf, dataNascimento, telefone, email, endereco, cidade, carteiraTrabalho, dataAdmissao, dataDemissao, CARGO_codCargo) values(null,nomeFuncionario, cpfFuncionario, 
dataNascimentoFuncionario, telFuncionario, emailFuncionario, enderecoFuncionario, cidadeFuncionario, carteiraTrabalhoFuncionario, dataAdmissaoFuncionario, dataDemissaoFuncionario, codigoCargo);
END//
DELIMITER ;

-- Copiando estrutura para procedure academia.proc_insereProdutos
DROP PROCEDURE IF EXISTS `proc_insereProdutos`;
DELIMITER //
CREATE PROCEDURE `proc_insereProdutos`(in nomeProduto varchar(100), in precoCustoProduto decimal(10,2), in precoVendaProduto decimal(10,2), in valorLucro decimal(5,2), in dataValidadeProduto date, 
in quatidadeProdutosEmEstoque decimal(10,2), in codigoFornecedor int)
BEGIN
insert into produtos(codPRODUTOS, nome, precoCusto, precoVenda, FORNECEDORES_codFORNECEDORES) values(null, nomeProduto, precoCustoProduto, precoVendaProduto, codigoFornecedor); 
END//
DELIMITER ;

-- Copiando estrutura para procedure academia.proc_inserirPlanos
DROP PROCEDURE IF EXISTS `proc_inserirPlanos`;
DELIMITER //
CREATE PROCEDURE `proc_inserirPlanos`(in dataInicioPlano date, in dataFimPlano date, in valorPlano decimal(10,2), in tipoPlanoCliente varchar(45))
BEGIN
insert into planos values(null,dataInicioPlano,dataFimPlano,valorPlano,tipoPlanoCliente);
END//
DELIMITER ;

-- Copiando estrutura para procedure academia.proc_insertVendas
DROP PROCEDURE IF EXISTS `proc_insertVendas`;
DELIMITER //
CREATE PROCEDURE `proc_insertVendas`(in dataDaVenda datetime, in descontoDavenda decimal(5,2),in tipoDaVenda ENUM('À vista', 'Cartão Débito', 'Cartão Crédito', 'PIX'), 
in codigoDoCliente int, in codigoDoPlano int, in codigoDoFuncionario int)
BEGIN
insert into vendas(codVENDA,dataHora,desconto,tipoVenda,CLIENTES_codCLIENTES,CLIENTES_PLANOS_codPLANOS,FUNCIONARIOS_codFUNCIONARIOS) values (null,dataDaVenda,descontoDavenda,tipoDaVenda,codigoDoCliente,codigoDoPlano,codigoDoFuncionario);
END//
DELIMITER ;

-- Copiando estrutura para tabela academia.produtos
DROP TABLE IF EXISTS `produtos`;
CREATE TABLE IF NOT EXISTS `produtos` (
  `codPRODUTOS` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `precoCusto` decimal(10,2) NOT NULL,
  `precoVenda` decimal(10,2) NOT NULL,
  `margemLucro` decimal(5,2) DEFAULT NULL,
  `dataValidade` date DEFAULT NULL,
  `quantidadeEstoque` decimal(10,2) DEFAULT NULL,
  `FORNECEDORES_codFORNECEDORES` int(11) NOT NULL,
  PRIMARY KEY (`codPRODUTOS`,`FORNECEDORES_codFORNECEDORES`),
  KEY `fk_PRODUTOS_FORNECEDORES1_idx` (`FORNECEDORES_codFORNECEDORES`),
  CONSTRAINT `fk_PRODUTOS_FORNECEDORES1` FOREIGN KEY (`FORNECEDORES_codFORNECEDORES`) REFERENCES `fornecedores` (`codFORNECEDORES`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela academia.produtos: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` (`codPRODUTOS`, `nome`, `precoCusto`, `precoVenda`, `margemLucro`, `dataValidade`, `quantidadeEstoque`, `FORNECEDORES_codFORNECEDORES`) VALUES
	(1, 'Creatina', 65.00, 100.00, 0.00, '2024-12-05', 30.00, 3);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;

-- Copiando estrutura para tabela academia.vendas
DROP TABLE IF EXISTS `vendas`;
CREATE TABLE IF NOT EXISTS `vendas` (
  `codVENDA` int(11) NOT NULL AUTO_INCREMENT,
  `dataHora` datetime NOT NULL,
  `desconto` decimal(5,2) DEFAULT NULL,
  `tipoVenda` enum('À vista','Cartão Débito','Cartão Crédito','PIX') NOT NULL,
  `CLIENTES_codCLIENTES` int(11) NOT NULL,
  `CLIENTES_PLANOS_codPLANOS` int(11) NOT NULL,
  `FUNCIONARIOS_codFUNCIONARIOS` int(11) NOT NULL,
  PRIMARY KEY (`codVENDA`,`CLIENTES_codCLIENTES`,`CLIENTES_PLANOS_codPLANOS`,`FUNCIONARIOS_codFUNCIONARIOS`),
  KEY `fk_VENDAS_CLIENTES1_idx` (`CLIENTES_codCLIENTES`,`CLIENTES_PLANOS_codPLANOS`),
  KEY `fk_VENDAS_FUNCIONARIOS1_idx` (`FUNCIONARIOS_codFUNCIONARIOS`),
  CONSTRAINT `fk_VENDAS_CLIENTES1` FOREIGN KEY (`CLIENTES_codCLIENTES`) REFERENCES `clientes` (`codCLIENTES`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_VENDAS_FUNCIONARIOS1` FOREIGN KEY (`FUNCIONARIOS_codFUNCIONARIOS`) REFERENCES `funcionarios` (`codFUNCIONARIOS`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela academia.vendas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vendas` DISABLE KEYS */;
INSERT INTO `vendas` (`codVENDA`, `dataHora`, `desconto`, `tipoVenda`, `CLIENTES_codCLIENTES`, `CLIENTES_PLANOS_codPLANOS`, `FUNCIONARIOS_codFUNCIONARIOS`) VALUES
	(2, '2022-05-19 18:30:00', 5.00, 'Cartão Débito', 1, 5, 1);
/*!40000 ALTER TABLE `vendas` ENABLE KEYS */;

-- Copiando estrutura para view academia.v_clientesnomeordemalfabetica
DROP VIEW IF EXISTS `v_clientesnomeordemalfabetica`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `v_clientesnomeordemalfabetica` (
	`nome` VARCHAR(100) NOT NULL COLLATE 'utf8_general_ci',
	`Data de nascimento` VARCHAR(10) NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- Copiando estrutura para view academia.v_clientestelefoneok
DROP VIEW IF EXISTS `v_clientestelefoneok`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `v_clientestelefoneok` (
	`codCLIENTES` INT(11) NOT NULL,
	`nome` VARCHAR(100) NOT NULL COLLATE 'utf8_general_ci',
	`cpf` VARCHAR(45) NOT NULL COLLATE 'utf8_general_ci',
	`data de anscimento` VARCHAR(10) NULL COLLATE 'utf8mb4_general_ci',
	`telefone` VARCHAR(100) NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Copiando estrutura para view academia.v_salariocargodesc
DROP VIEW IF EXISTS `v_salariocargodesc`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `v_salariocargodesc` (
	`codCARGO` INT(11) NOT NULL,
	`tipo` VARCHAR(45) NOT NULL COLLATE 'utf8_general_ci',
	`salario` DECIMAL(10,2) NOT NULL
) ENGINE=MyISAM;

-- Copiando estrutura para view academia.v_clientesnomeordemalfabetica
DROP VIEW IF EXISTS `v_clientesnomeordemalfabetica`;
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `v_clientesnomeordemalfabetica`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_clientesnomeordemalfabetica` AS (SELECT nome,date_FORMAT(dataNascimento,"%d/%m/%Y")AS "Data de nascimento" 
from clientes ORDER BY nome ASC) ;

-- Copiando estrutura para view academia.v_clientestelefoneok
DROP VIEW IF EXISTS `v_clientestelefoneok`;
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `v_clientestelefoneok`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_clientestelefoneok` AS (SELECT codCLIENTES,
nome, 
cpf,
DATE_FORMAT(dataNascimento, "%d/%m/%Y")AS "data de anscimento", 
telefone 
FROM clientes WHERE telefone !=("")) ;

-- Copiando estrutura para view academia.v_salariocargodesc
DROP VIEW IF EXISTS `v_salariocargodesc`;
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `v_salariocargodesc`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_salariocargodesc` AS (SELECT * FROM cargos order BY salario DESC) ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
