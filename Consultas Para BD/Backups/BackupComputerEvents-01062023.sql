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


-- Copiando estrutura do banco de dados para computerevents3si
DROP DATABASE IF EXISTS `computerevents3si`;
CREATE DATABASE IF NOT EXISTS `computerevents3si` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `computerevents3si`;

-- Copiando estrutura para tabela computerevents3si.atividade
DROP TABLE IF EXISTS `atividade`;
CREATE TABLE IF NOT EXISTS `atividade` (
  `codATIVIDADE` int(11) NOT NULL AUTO_INCREMENT,
  `tema` varchar(200) NOT NULL,
  `local` varchar(200) NOT NULL,
  `dataHoraInicio` datetime NOT NULL,
  `dataHoraTermino` datetime NOT NULL,
  `numVagas` int(11) NOT NULL,
  `tipo` enum('Palestra Presencial','Palestra on-line','Oficina','Minicurso','Roda de Conversa') NOT NULL,
  `palestrante` varchar(200) NOT NULL,
  `cpfPalestrante` varchar(200) NOT NULL,
  `EVENTO_codEVENTO` int(11) NOT NULL,
  PRIMARY KEY (`codATIVIDADE`,`EVENTO_codEVENTO`),
  KEY `fk_ATIVIDADE_EVENTO1_idx` (`EVENTO_codEVENTO`),
  CONSTRAINT `fk_ATIVIDADE_EVENTO1` FOREIGN KEY (`EVENTO_codEVENTO`) REFERENCES `evento` (`codEVENTO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela computerevents3si.atividade: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `atividade` DISABLE KEYS */;
INSERT INTO `atividade` (`codATIVIDADE`, `tema`, `local`, `dataHoraInicio`, `dataHoraTermino`, `numVagas`, `tipo`, `palestrante`, `cpfPalestrante`, `EVENTO_codEVENTO`) VALUES
	(1, 'Contrução de Software', 'Auditório', '2023-06-13 09:00:00', '2023-06-13 11:00:00', 400, 'Palestra Presencial', 'Matheus', '999.999.999-99', 1);
/*!40000 ALTER TABLE `atividade` ENABLE KEYS */;

-- Copiando estrutura para tabela computerevents3si.evento
DROP TABLE IF EXISTS `evento`;
CREATE TABLE IF NOT EXISTS `evento` (
  `codEVENTO` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `dataInicio` date NOT NULL,
  `dataTermino` date NOT NULL,
  PRIMARY KEY (`codEVENTO`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela computerevents3si.evento: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
INSERT INTO `evento` (`codEVENTO`, `nome`, `dataInicio`, `dataTermino`) VALUES
	(1, 'VII Computer Day', '2023-06-13', '2023-06-13');
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;

-- Copiando estrutura para tabela computerevents3si.inscricao
DROP TABLE IF EXISTS `inscricao`;
CREATE TABLE IF NOT EXISTS `inscricao` (
  `ATIVIDADE_codATIVIDADE` int(11) NOT NULL,
  `PARTICIPANTES_codPARTICIPANTES` int(11) NOT NULL,
  `checkin` datetime DEFAULT NULL,
  PRIMARY KEY (`ATIVIDADE_codATIVIDADE`,`PARTICIPANTES_codPARTICIPANTES`),
  KEY `fk_ATIVIDADE_has_PARTICIPANTES_PARTICIPANTES1_idx` (`PARTICIPANTES_codPARTICIPANTES`),
  KEY `fk_ATIVIDADE_has_PARTICIPANTES_ATIVIDADE1_idx` (`ATIVIDADE_codATIVIDADE`),
  CONSTRAINT `fk_ATIVIDADE_has_PARTICIPANTES_ATIVIDADE1` FOREIGN KEY (`ATIVIDADE_codATIVIDADE`) REFERENCES `atividade` (`codATIVIDADE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ATIVIDADE_has_PARTICIPANTES_PARTICIPANTES1` FOREIGN KEY (`PARTICIPANTES_codPARTICIPANTES`) REFERENCES `participantes` (`codPARTICIPANTES`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela computerevents3si.inscricao: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `inscricao` DISABLE KEYS */;
/*!40000 ALTER TABLE `inscricao` ENABLE KEYS */;

-- Copiando estrutura para tabela computerevents3si.participantes
DROP TABLE IF EXISTS `participantes`;
CREATE TABLE IF NOT EXISTS `participantes` (
  `codPARTICIPANTES` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `sobrenome` varchar(200) NOT NULL,
  `cpf` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `TURMA_codTURMA` int(11) NOT NULL,
  PRIMARY KEY (`codPARTICIPANTES`,`TURMA_codTURMA`),
  KEY `fk_PARTICIPANTES_TURMA_idx` (`TURMA_codTURMA`),
  CONSTRAINT `fk_PARTICIPANTES_TURMA` FOREIGN KEY (`TURMA_codTURMA`) REFERENCES `turma` (`codTURMA`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela computerevents3si.participantes: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `participantes` DISABLE KEYS */;
INSERT INTO `participantes` (`codPARTICIPANTES`, `nome`, `sobrenome`, `cpf`, `email`, `TURMA_codTURMA`) VALUES
	(1, 'Pedro', 'Franco', '111.111.111-11', 'pedro@email.com', 3),
	(2, 'Salomão', 'Junior', '222.222.222-22', 'salomao@email.com', 4);
/*!40000 ALTER TABLE `participantes` ENABLE KEYS */;

-- Copiando estrutura para tabela computerevents3si.turma
DROP TABLE IF EXISTS `turma`;
CREATE TABLE IF NOT EXISTS `turma` (
  `codTURMA` int(11) NOT NULL AUTO_INCREMENT,
  `sigla` varchar(200) NOT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`codTURMA`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela computerevents3si.turma: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `turma` DISABLE KEYS */;
INSERT INTO `turma` (`codTURMA`, `sigla`, `descricao`) VALUES
	(1, '1SI', '1º Sistemas de Informação'),
	(2, '2SI', '2º Sistemas de Informação'),
	(3, '3SI', '3º Sistemas de Informação'),
	(4, '4SI', '4º Sistemas de Informação'),
	(5, '5SI', '5º Sistemas de Informação'),
	(6, '6SI', '6º Sistemas de Informação'),
	(7, '7SI', '7º Sistemas de Informação'),
	(8, '8SI', '8º Sistemas de Informação'),
	(9, '1INFO', '1º ano do Técnico em Informática Integrado ao Ensino Médio'),
	(10, '2INFO', '2º ano do Técnico em Informática Integrado ao Ensino Médio'),
	(11, '3INFO', '3º ano do Técnico em Informática Integrado ao Ensino Médio');
/*!40000 ALTER TABLE `turma` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
