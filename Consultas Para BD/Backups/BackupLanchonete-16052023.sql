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


-- Copiando estrutura do banco de dados para lanchonete3si_2023
DROP DATABASE IF EXISTS `lanchonete3si_2023`;
CREATE DATABASE IF NOT EXISTS `lanchonete3si_2023` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `lanchonete3si_2023`;

-- Copiando estrutura para tabela lanchonete3si_2023.auditoria
DROP TABLE IF EXISTS `auditoria`;
CREATE TABLE IF NOT EXISTS `auditoria` (
  `codAuditoria` int(11) NOT NULL AUTO_INCREMENT,
  `acao` varchar(400) DEFAULT NULL,
  `tabela` varchar(50) DEFAULT NULL,
  `dataHora` datetime DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codAuditoria`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='Registra as principais alterações neste BD.';

-- Copiando dados para a tabela lanchonete3si_2023.auditoria: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `auditoria` DISABLE KEYS */;
INSERT INTO `auditoria` (`codAuditoria`, `acao`, `tabela`, `dataHora`, `usuario`) VALUES
	(3, 'Produto [Empada de Palmito] vendido. Quantidade [1]. Venda[2]', 'itemvenda', '2023-05-11 10:45:02', 'root@localhost'),
	(4, 'Produto [Empada de Palmito] devolvido ao estoque. Quantidade [1]. Venda[2]', 'itemvenda', '2023-05-11 10:49:27', 'root@localhost'),
	(6, 'Quantidade aumentada. Removido :[2] unidades do estoque', 'itemvenda', '2023-05-16 10:24:17', 'root@localhost'),
	(7, 'Quantidade reduzida. Aumento de :[2] unidades no estoque', 'itemvenda', '2023-05-16 10:25:50', 'root@localhost'),
	(8, 'Quantidade aumentada. Removido :[1] unidades do estoque', 'itemvenda', '2023-05-16 10:28:18', 'root@localhost'),
	(9, 'Quantidade reduzida. Aumento de :[3] unidades no estoque', 'itemvenda', '2023-05-16 10:28:31', 'root@localhost');
/*!40000 ALTER TABLE `auditoria` ENABLE KEYS */;

-- Copiando estrutura para tabela lanchonete3si_2023.categoria
DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `codCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`codCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela lanchonete3si_2023.categoria: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` (`codCategoria`, `nome`) VALUES
	(1, 'Salgados de fabricação própria'),
	(2, 'Sucos Naturais'),
	(3, 'Sucos industrializados'),
	(4, 'Refrigerantes'),
	(5, 'Bebidas quentes'),
	(6, 'Sobremesas'),
	(7, 'Ticket Alimentação'),
	(8, 'Carlos Silva');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;

-- Copiando estrutura para tabela lanchonete3si_2023.cliente
DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `codCliente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `bairro` varchar(100) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT 'Machado',
  `cep` varchar(20) DEFAULT '37.750-000',
  `uf` char(2) DEFAULT 'MG',
  `dataNascimento` date DEFAULT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`codCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela lanchonete3si_2023.cliente: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`codCliente`, `nome`, `endereco`, `bairro`, `cidade`, `cep`, `uf`, `dataNascimento`, `cpf`, `email`) VALUES
	(1, 'Carlos Telles Silva', NULL, NULL, 'Machado', '37.750-000', 'MG', '1980-09-21', NULL, 'carlos2022@gmail.com'),
	(2, 'Ana Paula Teixeira', NULL, NULL, 'Machado', '37.750-000', 'MG', '1985-11-04', NULL, 'teste@gmail.com'),
	(3, 'João Victor Telles', NULL, NULL, 'Machado', '37.750-000', 'MG', '1974-04-29', NULL, NULL);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Copiando estrutura para tabela lanchonete3si_2023.itemvenda
DROP TABLE IF EXISTS `itemvenda`;
CREATE TABLE IF NOT EXISTS `itemvenda` (
  `VENDA_codVenda` int(11) NOT NULL,
  `PRODUTO_codProduto` int(11) NOT NULL,
  `quantidade` decimal(10,0) NOT NULL,
  PRIMARY KEY (`VENDA_codVenda`,`PRODUTO_codProduto`),
  KEY `fk_PRODUTO_has_VENDA_VENDA1_idx` (`VENDA_codVenda`),
  KEY `fk_PRODUTO_has_VENDA_PRODUTO1_idx` (`PRODUTO_codProduto`),
  CONSTRAINT `fk_PRODUTO_has_VENDA_PRODUTO1` FOREIGN KEY (`PRODUTO_codProduto`) REFERENCES `produto` (`codProduto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PRODUTO_has_VENDA_VENDA1` FOREIGN KEY (`VENDA_codVenda`) REFERENCES `venda` (`codVenda`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela lanchonete3si_2023.itemvenda: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `itemvenda` DISABLE KEYS */;
INSERT INTO `itemvenda` (`VENDA_codVenda`, `PRODUTO_codProduto`, `quantidade`) VALUES
	(1, 1, 2);
/*!40000 ALTER TABLE `itemvenda` ENABLE KEYS */;

-- Copiando estrutura para tabela lanchonete3si_2023.marca
DROP TABLE IF EXISTS `marca`;
CREATE TABLE IF NOT EXISTS `marca` (
  `codMarca` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`codMarca`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela lanchonete3si_2023.marca: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` (`codMarca`, `nome`) VALUES
	(1, 'Nestlé'),
	(2, 'Garoto'),
	(4, 'Dolly'),
	(5, 'Frutty'),
	(6, 'Coetagri');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;

-- Copiando estrutura para view lanchonete3si_2023.nascimentoclientes
DROP VIEW IF EXISTS `nascimentoclientes`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `nascimentoclientes` (
	`nome` VARCHAR(200) NOT NULL COLLATE 'utf8_general_ci',
	`nascimento` VARCHAR(10) NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- Copiando estrutura para procedure lanchonete3si_2023.proc_alteraEmailCliente
DROP PROCEDURE IF EXISTS `proc_alteraEmailCliente`;
DELIMITER //
CREATE PROCEDURE `proc_alteraEmailCliente`(in codClienteAlterado int,
in novoEmail varchar(200))
BEGIN
update cliente set email = novoEmail 
where codCliente = codClienteAlterado;
END//
DELIMITER ;

-- Copiando estrutura para procedure lanchonete3si_2023.proc_alteraMarca
DROP PROCEDURE IF EXISTS `proc_alteraMarca`;
DELIMITER //
CREATE PROCEDURE `proc_alteraMarca`(IN nomeAlterado varchar(100),
IN codigo INT)
BEGIN
	update marca set nome = nomeAlterado where codMarca = codigo;
    /*Se tiver mais de um campo a ser alterado, basta ir separando com vírgula nos parâmetros 
    e na lista de campos após o comando SET*/
END//
DELIMITER ;

-- Copiando estrutura para procedure lanchonete3si_2023.proc_apagaMarca
DROP PROCEDURE IF EXISTS `proc_apagaMarca`;
DELIMITER //
CREATE PROCEDURE `proc_apagaMarca`(IN codigoParaExcluir int)
BEGIN
	delete from marca where codMarca = codigoParaExcluir;
END//
DELIMITER ;

-- Copiando estrutura para procedure lanchonete3si_2023.proc_insereCategoria
DROP PROCEDURE IF EXISTS `proc_insereCategoria`;
DELIMITER //
CREATE PROCEDURE `proc_insereCategoria`(IN novoNome varchar(100))
BEGIN
	insert into categoria(nome) values(novoNome);
    
    /*Se tiver mais de um campo a ser preenchido, basta ir separando com vírgula nos parâmetros 
    e na inserção*/
END//
DELIMITER ;

-- Copiando estrutura para procedure lanchonete3si_2023.proc_insereCliente
DROP PROCEDURE IF EXISTS `proc_insereCliente`;
DELIMITER //
CREATE PROCEDURE `proc_insereCliente`(in nomeCli varchar(200), in dataNascimentoCli date)
BEGIN
insert into cliente(codCliente, nome, dataNascimento)
values (null, nomeCli, dataNascimentoCli);
END//
DELIMITER ;

-- Copiando estrutura para procedure lanchonete3si_2023.proc_insereMarca
DROP PROCEDURE IF EXISTS `proc_insereMarca`;
DELIMITER //
CREATE PROCEDURE `proc_insereMarca`(IN nomeNovo varchar(100))
BEGIN
	insert into marca(nome) values(nomeNovo);
END//
DELIMITER ;

-- Copiando estrutura para tabela lanchonete3si_2023.produto
DROP TABLE IF EXISTS `produto`;
CREATE TABLE IF NOT EXISTS `produto` (
  `codProduto` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `precoCusto` decimal(10,2) NOT NULL,
  `precoVenda` decimal(10,2) NOT NULL,
  `margemLucro` decimal(5,2) DEFAULT NULL,
  `dataValidade` date DEFAULT NULL,
  `quantidadeEstoque` decimal(10,2) DEFAULT NULL,
  `quantidadeMinima` decimal(10,2) DEFAULT NULL,
  `CATEGORIA_codCategoria` int(11) NOT NULL,
  `MARCA_codMarca` int(11) NOT NULL,
  PRIMARY KEY (`codProduto`,`CATEGORIA_codCategoria`,`MARCA_codMarca`),
  KEY `fk_PRODUTO_CATEGORIA_idx` (`CATEGORIA_codCategoria`),
  KEY `fk_PRODUTO_MARCA1_idx` (`MARCA_codMarca`),
  CONSTRAINT `fk_PRODUTO_CATEGORIA` FOREIGN KEY (`CATEGORIA_codCategoria`) REFERENCES `categoria` (`codCategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PRODUTO_MARCA1` FOREIGN KEY (`MARCA_codMarca`) REFERENCES `marca` (`codMarca`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela lanchonete3si_2023.produto: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` (`codProduto`, `nome`, `precoCusto`, `precoVenda`, `margemLucro`, `dataValidade`, `quantidadeEstoque`, `quantidadeMinima`, `CATEGORIA_codCategoria`, `MARCA_codMarca`) VALUES
	(1, 'Empada de Palmito', 1.80, 3.60, 100.00, '2022-11-20', 22.00, 10.00, 1, 6),
	(2, 'Prestigio', 2.00, 2.60, 30.00, '2023-12-11', 50.00, 15.00, 6, 1),
	(3, 'Guaraná 600ml', 2.00, 2.40, 20.00, '2023-05-21', 45.00, 20.00, 4, 5),
	(4, 'Serenata de Amor', 1.50, 3.00, 100.00, '2023-05-16', 40.00, 10.00, 6, 2);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;

-- Copiando estrutura para tabela lanchonete3si_2023.venda
DROP TABLE IF EXISTS `venda`;
CREATE TABLE IF NOT EXISTS `venda` (
  `codVenda` int(11) NOT NULL AUTO_INCREMENT,
  `dataHora` datetime NOT NULL,
  `desconto` decimal(5,2) DEFAULT NULL,
  `tipoVenda` enum('À vista','Cartão Débito','Cartão Crédito','PIX') NOT NULL,
  `CLIENTE_codCliente` int(11) NOT NULL,
  PRIMARY KEY (`codVenda`,`CLIENTE_codCliente`),
  KEY `fk_VENDA_CLIENTE1_idx` (`CLIENTE_codCliente`),
  CONSTRAINT `fk_VENDA_CLIENTE1` FOREIGN KEY (`CLIENTE_codCliente`) REFERENCES `cliente` (`codCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela lanchonete3si_2023.venda: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
INSERT INTO `venda` (`codVenda`, `dataHora`, `desconto`, `tipoVenda`, `CLIENTE_codCliente`) VALUES
	(1, '2022-12-08 07:09:00', 6.00, 'À vista', 3),
	(2, '2023-05-11 10:14:22', NULL, 'PIX', 2);
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;

-- Copiando estrutura para trigger lanchonete3si_2023.tri_atualizaEstoque
DROP TRIGGER IF EXISTS `tri_atualizaEstoque`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tri_atualizaEstoque` AFTER UPDATE ON `itemvenda` FOR EACH ROW BEGIN

	if(NEW.quantidade>OLD.quantidade)
		then UPDATE produto SET quantidadeEstoque = quantidadeEstoque - (NEW.quantidade - OLD.quantidade)
			WHERE codProduto = NEW.PRODUTO_codProduto;
			SET @diferenca = NEW.quantidade - OLD.quantidade;
			SET @mensagem = CONCAT("Quantidade aumentada. Removido :[",@diferenca,"] unidades do estoque");	
	ELSE if(NEW.quantidade<OLD.quantidade)
		then UPDATE produto SET quantidadeEstoque = quantidadeEstoque + (OLD.quantidade - NEW.quantidade)
			WHERE codProduto = NEW.PRODUTO_codProduto;
			SET @diferenca = old.quantidade - new.quantidade;
			SET @mensagem = CONCAT("Quantidade reduzida. Aumento de :[",@diferenca,"] unidades no estoque");	
		END if;
	END if;
	

	
	INSERT INTO auditoria values(NULL, @mensagem, "itemvenda", NOW(),USER());

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger lanchonete3si_2023.tri_atualizaMargemLucro
DROP TRIGGER IF EXISTS `tri_atualizaMargemLucro`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tri_atualizaMargemLucro` BEFORE UPDATE ON `produto` FOR EACH ROW BEGIN

	if(NEW.margemLucro != OLD.margemLucro)
		then SET NEW.precoVenda = NEW.precoCusto + (NEW.precoCusto * NEW.margemLucro/100);
	END if;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger lanchonete3si_2023.tri_baixaEstoque
DROP TRIGGER IF EXISTS `tri_baixaEstoque`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tri_baixaEstoque` BEFORE INSERT ON `itemvenda` FOR EACH ROW BEGIN

	UPDATE produto SET quantidadeEstoque = quantidadeEstoque - (NEW.quantidade) 
	WHERE produto.codProduto = NEW.PRODUTO_codProduto;
	
	SELECT nome INTO @nomeProd FROM produto WHERE codProduto = NEW .PRODUTO_codProduto;
	
	SET @mensagem = CONCAT("Produto [",@nomeProd,"] vendido. Quantidade [",NEW.quantidade,
	"]. Venda[",NEW.VENDA_codVenda,"]");
	
	INSERT INTO auditoria values(NULL, @mensagem, "itemvenda", NOW(),USER());

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger lanchonete3si_2023.tri_calculaPrecoVenda
DROP TRIGGER IF EXISTS `tri_calculaPrecoVenda`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tri_calculaPrecoVenda` BEFORE INSERT ON `produto` FOR EACH ROW BEGIN
	
	if(NEW.margemLucro>0)
		then SET NEW.precoVenda = NEW.precoCusto + (NEW.precoCusto * NEW.margemLucro/100);
	END if;
	
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger lanchonete3si_2023.tri_devolveEstoque
DROP TRIGGER IF EXISTS `tri_devolveEstoque`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tri_devolveEstoque` AFTER DELETE ON `itemvenda` FOR EACH ROW BEGIN

	UPDATE produto SET quantidadeEstoque = quantidadeEstoque + (OLD.quantidade) 
	WHERE produto.codProduto = OLD.PRODUTO_codProduto;
	
	SELECT nome INTO @nomeProd FROM produto WHERE codProduto = OLD .PRODUTO_codProduto;
	
	SET @mensagem = CONCAT("Produto [",@nomeProd,"] devolvido ao estoque. Quantidade [",OLD.quantidade,
	"]. Venda[",OLD.VENDA_codVenda,"]");
	
	INSERT INTO auditoria values(NULL, @mensagem, "itemvenda", NOW(),USER());

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para view lanchonete3si_2023.nascimentoclientes
DROP VIEW IF EXISTS `nascimentoclientes`;
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `nascimentoclientes`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `nascimentoclientes` AS (select `cliente`.`nome` AS `nome`,date_format(`cliente`.`dataNascimento`,'%d/%m/%Y') AS `nascimento` from `cliente`) ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
