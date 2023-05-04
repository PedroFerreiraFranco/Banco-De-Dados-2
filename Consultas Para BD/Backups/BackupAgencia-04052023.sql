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


-- Copiando estrutura do banco de dados para agencia3si2023
DROP DATABASE IF EXISTS `agencia3si2023`;
CREATE DATABASE IF NOT EXISTS `agencia3si2023` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `agencia3si2023`;

-- Copiando estrutura para tabela agencia3si2023.auditoria
DROP TABLE IF EXISTS `auditoria`;
CREATE TABLE IF NOT EXISTS `auditoria` (
  `codAuditoria` int(11) NOT NULL AUTO_INCREMENT,
  `acao` varchar(400) DEFAULT NULL,
  `tabela` varchar(50) DEFAULT NULL,
  `dataHora` datetime DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codAuditoria`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='Registra as principais alterações neste BD.';

-- Copiando dados para a tabela agencia3si2023.auditoria: ~34 rows (aproximadamente)
/*!40000 ALTER TABLE `auditoria` DISABLE KEYS */;
INSERT INTO `auditoria` (`codAuditoria`, `acao`, `tabela`, `dataHora`, `usuario`) VALUES
	(1, 'Exclusão de Registro', 'contavinculada', '2023-04-18 10:37:00', 'root@localhost'),
	(2, 'Exclusão de conta do cliente: NEYMAR JUNIOR', 'contavinculada', '2023-04-18 10:47:17', 'root@localhost'),
	(3, 'Exclusão de conta do cliente: FERNANDO TORRRES', 'contavinculada', '2023-04-19 07:44:32', 'root@localhost'),
	(4, 'Exclusão de conta do cliente: FABIANA SILVA CGE', 'contavinculada', '2023-04-19 07:45:12', 'root@localhost'),
	(5, 'CPF do cliente: NEYMAR JUNIORfoi alterado para 548.457.359-24', 'cliente', '2023-04-19 08:05:29', 'root@localhost'),
	(6, 'CPF do cliente: tales Brigagão foi alterado para 212.235.235.95', 'cliente', '2023-04-19 08:06:25', 'root@localhost'),
	(8, 'Conta iserida: 6. Com tipo: Poupança. Saldo de: 18523.00', 'conta', '2023-04-19 08:20:09', 'root@localhost'),
	(9, 'Nome do cliente: SALOMAO foi alterado para maiusculo', 'cliente', '2023-04-25 10:30:57', 'root@localhost'),
	(10, 'CPF do cliente: TELMA ALMEIDA foi alterado para 123.456.789-10', 'cliente', '2023-04-25 10:36:10', 'root@localhost'),
	(11, 'CPF do cliente: ROBERTO SILVA foi alterado para 035.888.888-24', 'cliente', '2023-04-25 10:36:10', 'root@localhost'),
	(12, 'CPF do cliente: AMANDA CARVALHO foi alterado para 036.036.036-66', 'cliente', '2023-04-25 10:36:10', 'root@localhost'),
	(13, 'CPF do cliente: PEDRO AUGUSTO TELLES foi alterado para 999.036.036-66', 'cliente', '2023-04-25 10:36:10', 'root@localhost'),
	(14, 'CPF do cliente: ROSÁLIA PEREIRA foi alterado para 777.036.036-77', 'cliente', '2023-04-25 10:36:10', 'root@localhost'),
	(15, 'CPF do cliente: LÚCIA SILVIANO foi alterado para 444.036.444-77', 'cliente', '2023-04-25 10:36:10', 'root@localhost'),
	(16, 'CPF do cliente: ROSÂNGELA ALVES foi alterado para 777.777.777-77', 'cliente', '2023-04-25 10:36:10', 'root@localhost'),
	(17, 'CPF do cliente: ROSÂNGELA SILVA foi alterado para 777.777.777-88', 'cliente', '2023-04-25 10:36:10', 'root@localhost'),
	(18, 'CPF do cliente: FELIPE GUIMARÃES foi alterado para 123.123.123-12', 'cliente', '2023-04-25 10:36:10', 'root@localhost'),
	(19, 'CPF do cliente: FLÁVIA GUIMARÃES foi alterado para 123.123.999-12', 'cliente', '2023-04-25 10:36:10', 'root@localhost'),
	(20, 'CPF do cliente: FABIANA SILVA CGE foi alterado para 999.999.999-99', 'cliente', '2023-04-25 10:36:10', 'root@localhost'),
	(21, 'CPF do cliente: TALES BRIGAGÃO foi alterado para 212.235.235.95', 'cliente', '2023-04-25 10:36:10', 'root@localhost'),
	(22, 'CPF do cliente: FLÁVIO ALMEIDA foi alterado para 456.456.456-56', 'cliente', '2023-04-25 10:36:10', 'root@localhost'),
	(23, 'CPF do cliente: NEYMAR JUNIOR foi alterado para 548.457.359-24', 'cliente', '2023-04-25 10:36:10', 'root@localhost'),
	(24, 'CPF do cliente: FERNANDO TORRRES foi alterado para 548.368.958-52', 'cliente', '2023-04-25 10:36:10', 'root@localhost'),
	(25, 'CPF do cliente: MESSI AGUERO foi alterado para 557.339-554', 'cliente', '2023-04-25 10:36:10', 'root@localhost'),
	(26, 'CPF do cliente: GUSTAVO foi alterado para 254.235.965-87', 'cliente', '2023-04-25 10:36:10', 'root@localhost'),
	(27, 'CPF do cliente: SALOMAO foi alterado para 571.356.215-65', 'cliente', '2023-04-25 10:36:10', 'root@localhost'),
	(28, 'Conta iserida: 7. Com tipo: Poupança. Saldo de: 0.00', 'conta', '2023-04-27 09:56:01', 'root@localhost'),
	(41, 'Nome do cliente: PEDRO\r\n foi alterado para maiusculo', 'cliente', '2023-04-27 10:14:56', 'root@localhost'),
	(42, 'Conta iserida: 8. Com tipo: Poupança. Saldo de: 0.01', 'conta', '2023-04-27 10:14:56', 'root@localhost'),
	(43, 'Nome do cliente: PEDRO GUSTAVO foi alterado para maiusculo', 'cliente', '2023-04-27 10:15:15', 'root@localhost'),
	(44, 'Conta iserida: 9. Com tipo: Poupança. Saldo de: 0.01', 'conta', '2023-04-27 10:15:15', 'root@localhost'),
	(47, 'CPF do cliente: PEDRO GUSTAVO foi alterado para 1', 'cliente', '2023-04-27 10:47:11', 'root@localhost'),
	(48, 'CPF do cliente: ROSÁLIA PEREIRA foi alterado para 777.036.036-78', 'cliente', '2023-04-27 10:47:25', 'root@localhost'),
	(49, 'Conta iserida: 10. Com tipo: Poupança. Saldo de: 1000.00', 'conta', '2023-05-04 10:13:22', 'root@localhost'),
	(52, 'Conta removida: 10', 'conta', '2023-05-04 10:57:07', 'root@localhost');
/*!40000 ALTER TABLE `auditoria` ENABLE KEYS */;

-- Copiando estrutura para tabela agencia3si2023.cliente
DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `idCLIENTE` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `cpf` varchar(45) NOT NULL,
  `rg` varchar(45) DEFAULT NULL,
  `dataNascimento` date NOT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCLIENTE`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela agencia3si2023.cliente: ~20 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`idCLIENTE`, `nome`, `cpf`, `rg`, `dataNascimento`, `telefone`) VALUES
	(1, 'TELMA ALMEIDA', '123.456.789-10', 'MG 999.999-99', '1980-11-25', '(35)3295-9700'),
	(2, 'ROBERTO SILVA', '035.888.888-24', 'MG 10.100.777', '1975-05-21', '(35)3295-1234'),
	(3, 'AMANDA CARVALHO', '036.036.036-66', NULL, '1980-06-23', NULL),
	(4, 'PEDRO AUGUSTO TELLES', '999.036.036-66', NULL, '1956-12-23', NULL),
	(5, 'ROSÁLIA PEREIRA', '777.036.036-78', NULL, '1977-07-12', NULL),
	(6, 'LÚCIA SILVIANO', '444.036.444-77', NULL, '1974-04-24', NULL),
	(7, 'ROSÂNGELA ALVES', '777.777.777-77', 'SP 10.100.100', '1978-12-02', '(35)98811-1234'),
	(8, 'ROSÂNGELA SILVA', '777.777.777-88', 'SP 10.100.900', '1978-11-02', '(35)98822-4444'),
	(20, 'FELIPE GUIMARÃES', '123.123.123-12', NULL, '1969-05-20', NULL),
	(21, 'FLÁVIA GUIMARÃES', '123.123.999-12', NULL, '1969-05-25', NULL),
	(22, 'FABIANA SILVA CGE', '999.999.999-99', NULL, '1970-12-02', NULL),
	(23, 'TALES BRIGAGÃO', '212.235.235.95', NULL, '1975-12-02', NULL),
	(28, 'FLÁVIO ALMEIDA', '456.456.456-56', NULL, '1985-03-28', NULL),
	(29, 'NEYMAR JUNIOR', '548.457.359-24', 'RJ 658.564.352', '1992-02-05', '(98)997253569'),
	(30, 'FERNANDO TORRRES', '548.368.958-52', 'SP 985.356.352', '1990-04-18', '(98)999602578'),
	(31, 'MESSI AGUERO', '557.339-554', 'MG 285.564.352', '1990-04-18', '(98)997248578'),
	(32, 'GUSTAVO', '254.235.965-87', '', '2004-05-18', NULL),
	(33, 'SALOMAO', '571.356.215-65', NULL, '2003-04-25', NULL),
	(46, 'PEDRO\r\n', '232', NULL, '2004-04-27', '32123'),
	(47, 'PEDRO GUSTAVO', '1', NULL, '2000-04-27', NULL);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Copiando estrutura para tabela agencia3si2023.conta
DROP TABLE IF EXISTS `conta`;
CREATE TABLE IF NOT EXISTS `conta` (
  `idCONTA` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` enum('Salário','Corrente','Poupança') NOT NULL,
  `saldo` float(10,2) NOT NULL,
  `senha` char(8) NOT NULL,
  PRIMARY KEY (`idCONTA`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela agencia3si2023.conta: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `conta` DISABLE KEYS */;
INSERT INTO `conta` (`idCONTA`, `tipo`, `saldo`, `senha`) VALUES
	(1, 'Salário', 805.50, 'abc123'),
	(2, 'Poupança', 1375.00, '104418PO'),
	(4, 'Corrente', 125.10, '*23AB*'),
	(5, 'Corrente', 6500.00, 'cr321'),
	(6, 'Poupança', 18523.00, 'gugu'),
	(7, 'Poupança', 0.01, 'abc'),
	(8, 'Poupança', 0.01, 'abc'),
	(9, 'Poupança', 0.01, 'abc');
/*!40000 ALTER TABLE `conta` ENABLE KEYS */;

-- Copiando estrutura para tabela agencia3si2023.contavinculada
DROP TABLE IF EXISTS `contavinculada`;
CREATE TABLE IF NOT EXISTS `contavinculada` (
  `CLIENTE_idCLIENTE` int(11) NOT NULL,
  `CONTA_idCONTA` int(11) NOT NULL,
  `dataAbertura` date NOT NULL,
  PRIMARY KEY (`CLIENTE_idCLIENTE`,`CONTA_idCONTA`),
  KEY `fk_CLIENTE_has_CONTA_CONTA1_idx` (`CONTA_idCONTA`),
  KEY `fk_CLIENTE_has_CONTA_CLIENTE_idx` (`CLIENTE_idCLIENTE`),
  CONSTRAINT `fk_CLIENTE_has_CONTA_CLIENTE` FOREIGN KEY (`CLIENTE_idCLIENTE`) REFERENCES `cliente` (`idCLIENTE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CLIENTE_has_CONTA_CONTA1` FOREIGN KEY (`CONTA_idCONTA`) REFERENCES `conta` (`idCONTA`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela agencia3si2023.contavinculada: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `contavinculada` DISABLE KEYS */;
INSERT INTO `contavinculada` (`CLIENTE_idCLIENTE`, `CONTA_idCONTA`, `dataAbertura`) VALUES
	(1, 1, '2022-12-20'),
	(3, 1, '2023-04-19'),
	(4, 4, '2023-04-19'),
	(5, 2, '2023-04-27'),
	(46, 8, '2023-04-27'),
	(47, 9, '2023-04-27');
/*!40000 ALTER TABLE `contavinculada` ENABLE KEYS */;

-- Copiando estrutura para view agencia3si2023.v_agenda1
DROP VIEW IF EXISTS `v_agenda1`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `v_agenda1` (
	`idCLIENTE` INT(11) NOT NULL,
	`nome` VARCHAR(150) NOT NULL COLLATE 'utf8_general_ci',
	`telefone` VARCHAR(45) NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Copiando estrutura para view agencia3si2023.v_clientesordemcrescente
DROP VIEW IF EXISTS `v_clientesordemcrescente`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `v_clientesordemcrescente` (
	`nome` VARCHAR(150) NOT NULL COLLATE 'utf8_general_ci',
	`cpf` VARCHAR(45) NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Copiando estrutura para view agencia3si2023.v_contasclientes
DROP VIEW IF EXISTS `v_contasclientes`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `v_contasclientes` (
	`nome` VARCHAR(150) NOT NULL COLLATE 'utf8_general_ci',
	`tipo` ENUM('Salário','Corrente','Poupança') NOT NULL COLLATE 'utf8_general_ci',
	`saldo` FLOAT(10,2) NOT NULL
) ENGINE=MyISAM;

-- Copiando estrutura para view agencia3si2023.v_totalfinanceiro
DROP VIEW IF EXISTS `v_totalfinanceiro`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `v_totalfinanceiro` (
	`SUM(saldo)` DOUBLE(19,2) NULL
) ENGINE=MyISAM;

-- Copiando estrutura para trigger agencia3si2023.tri_alteraDataAberturaConta
DROP TRIGGER IF EXISTS `tri_alteraDataAberturaConta`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tri_alteraDataAberturaConta` AFTER UPDATE ON `cliente` FOR EACH ROW BEGIN
	IF NEW.cpf <> OLD.cpf THEN
   	   UPDATE contaVinculada
    		SET dataAbertura = CURRENT_TIME()
    		WHERE cliente_idCLIENTE = OLD.idCLIENTE;
  END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger agencia3si2023.tri_atualizaSenhaSaldo
DROP TRIGGER IF EXISTS `tri_atualizaSenhaSaldo`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tri_atualizaSenhaSaldo` BEFORE UPDATE ON `conta` FOR EACH ROW BEGIN
	
	/* if(NEW.senha != OLD.senha )
		then if(NEW.tipo = "Poupança")
			then SET NEW.saldo = OLD.saldo + 0.10;
			END if;
	END if;	*/
	
		if(NEW.tipo = "Poupança" AND NEW.senha != OLD.senha AND NEW.senha != "")
		then SET NEW.saldo = OLD.saldo + 0.10;
		END if;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger agencia3si2023.tri_FormataNomeCliente
DROP TRIGGER IF EXISTS `tri_FormataNomeCliente`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tri_FormataNomeCliente` BEFORE INSERT ON `cliente` FOR EACH ROW #formata o nome do novo cliente para letras maiusculas
BEGIN

	SET NEW.nome = UPPER(NEW.nome);
	
	SET @mensagem = CONCAT("Nome do cliente: ",NEW.nome, " foi alterado para maiusculo");	
	INSERT INTO auditoria VALUES(NULL, @mensagem, "cliente", NOW(),USER());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger agencia3si2023.tri_insereClientePoupanca
DROP TRIGGER IF EXISTS `tri_insereClientePoupanca`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tri_insereClientePoupanca` AFTER INSERT ON `cliente` FOR EACH ROW BEGIN
	INSERT INTO conta VALUES(NULL, "Poupança", 0.01, "abc");
	SELECT idCLIENTE INTO @novoCliente from cliente ORDER BY idCLIENTE DESC LIMIT 1;
	SELECT idCONTA INTO @novaConta from conta ORDER BY idCONTA DESC LIMIT 1;
	INSERT INTO contavinculada VALUES(@novoCliente, @novaConta, NOW());	
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger agencia3si2023.tri_logApagaConta
DROP TRIGGER IF EXISTS `tri_logApagaConta`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tri_logApagaConta` AFTER DELETE ON `conta` FOR EACH ROW BEGIN
	set @mensagem=concat("Conta removida: ", old.idConta);
	insert into auditoria values(null, @mensagem, "conta", now(), user());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger agencia3si2023.tri_LogApagaContaVinculada
DROP TRIGGER IF EXISTS `tri_LogApagaContaVinculada`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tri_LogApagaContaVinculada` AFTER DELETE ON `contavinculada` FOR EACH ROW BEGIN
	SELECT nome INTO @nomeCliente FROM cliente
	WHERE idCliente = OLD.CLIENTE_idCLIENTE;
	
	SET @mensagem = CONCAT("Exclusão de conta do cliente: ",UPPER(@nomeCliente));
	
	INSERT INTO auditoria 
	VALUES(NULL, @mensagem, "contavinculada", NOW(),USER());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger agencia3si2023.tri_LogApagaVinculoConta
DROP TRIGGER IF EXISTS `tri_LogApagaVinculoConta`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tri_LogApagaVinculoConta` BEFORE DELETE ON `conta` FOR EACH ROW #
BEGIN

	DELETE FROM contavinculada WHERE contavinculada.CONTA_idCONTA = OLD.idCONTA;

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger agencia3si2023.tri_LogFiscalizaCPF
DROP TRIGGER IF EXISTS `tri_LogFiscalizaCPF`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tri_LogFiscalizaCPF` AFTER UPDATE ON `cliente` FOR EACH ROW BEGIN

	SET @mensagem = CONCAT("CPF do cliente: ",NEW.nome, " foi alterado para ", NEW.cpf);	
	INSERT INTO auditoria VALUES(NULL, @mensagem, "cliente", NOW(),USER());
	
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger agencia3si2023.tri_LogInsereConta
DROP TRIGGER IF EXISTS `tri_LogInsereConta`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tri_LogInsereConta` AFTER INSERT ON `conta` FOR EACH ROW BEGIN	
		SET @mensagem = CONCAT("Conta iserida: ",NEW.idCONTA,". Com tipo: ",NEW.tipo, ". Saldo de: ",NEW.saldo);
		INSERT INTO auditoria VALUES(NULL, @mensagem, "conta", NOW(),USER());
		
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para view agencia3si2023.v_agenda1
DROP VIEW IF EXISTS `v_agenda1`;
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `v_agenda1`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_agenda1` AS (SELECT idCLIENTE, nome, telefone FROM cliente WHERE telefone IS NOT NULL) ;

-- Copiando estrutura para view agencia3si2023.v_clientesordemcrescente
DROP VIEW IF EXISTS `v_clientesordemcrescente`;
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `v_clientesordemcrescente`;
CREATE ALGORITHM=MERGE SQL SECURITY DEFINER VIEW `v_clientesordemcrescente` AS (select `cliente`.`nome` AS `nome`,`cliente`.`cpf` AS `cpf` from `cliente` order by `cliente`.`nome`) ;

-- Copiando estrutura para view agencia3si2023.v_contasclientes
DROP VIEW IF EXISTS `v_contasclientes`;
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `v_contasclientes`;
CREATE ALGORITHM=MERGE SQL SECURITY DEFINER VIEW `v_contasclientes` AS select `cli`.`nome` AS `nome`,`con`.`tipo` AS `tipo`,`con`.`saldo` AS `saldo` from ((`cliente` `cli` join `conta` `con`) join `contavinculada` `cv` on(((`cli`.`idCLIENTE` = `cv`.`CLIENTE_idCLIENTE`) and (`con`.`idCONTA` = `cv`.`CONTA_idCONTA`)))) ;

-- Copiando estrutura para view agencia3si2023.v_totalfinanceiro
DROP VIEW IF EXISTS `v_totalfinanceiro`;
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `v_totalfinanceiro`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_totalfinanceiro` AS (select sum(`conta`.`saldo`) AS `SUM(saldo)` from `conta`) ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
