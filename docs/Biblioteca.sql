-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: 02/11/2012 às 23h20min
-- Versão do Servidor: 5.5.24
-- Versão do PHP: 5.3.10-1ubuntu3.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `Biblioteca`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `autor`
--

CREATE TABLE IF NOT EXISTS `autor` (
  `idAutor` int(11) NOT NULL AUTO_INCREMENT,
  `nomeAutor` varchar(200) NOT NULL,
  `idExclusao` char(1) NOT NULL,
  `cdUser` varchar(50) NOT NULL,
  `dtUser` varchar(10) NOT NULL,
  `hmUser` varchar(10) NOT NULL,
  `cdUserA` varchar(50) NOT NULL,
  `dtUserA` varchar(10) NOT NULL,
  `hmUserA` varchar(10) NOT NULL,
  `cdUserE` varchar(50) NOT NULL,
  `dtUserE` varchar(10) NOT NULL,
  `hmUserE` varchar(10) NOT NULL,
  PRIMARY KEY (`idAutor`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Extraindo dados da tabela `autor`
--

INSERT INTO `autor` (`idAutor`, `nomeAutor`, `idExclusao`, `cdUser`, `dtUser`, `hmUser`, `cdUserA`, `dtUserA`, `hmUserA`, `cdUserE`, `dtUserE`, `hmUserE`) VALUES
(1, ' Machado de Assis', '', 'Ricardo', '22072012', '2008', '', '', '', '', '', ''),
(2, 'Ricardo Alexandre', '', 'Ricardo', '280712', '012455', '', '', '', '', '', ''),
(3, 'Francisco Viturino', '', 'Ricardo', '28072012', '012615', '', '', '', '', '', ''),
(4, 'Pedro Alvares Cabral', '', 'Ricardo', '02082012', '205515', '', '', '', '', '', ''),
(5, 'Andre', '', 'Ricardo', '02082012', '231233', '1', '18/09/2012', '234954', '', '', ''),
(6, 'Ana Beatriz', 'E', '', '', '', '1', '18/09/2012', '234825', '1', '18/09/2012', '234836'),
(7, 'Fulano de Tal', 'E', '1', '11/09/2012', '072452', '', '15/09/2012', '164759', '1', '24/09/2012', '194044');

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
  `idCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `NomeCategoria` varchar(200) NOT NULL,
  `idExclusao` char(1) NOT NULL,
  `cdUser` varchar(50) NOT NULL,
  `dtUser` varchar(10) NOT NULL,
  `hmUser` varchar(10) NOT NULL,
  `cdUserA` varchar(50) NOT NULL,
  `dtUserA` varchar(10) NOT NULL,
  `hmUserA` varchar(10) NOT NULL,
  `cdUserE` varchar(50) NOT NULL,
  `dtUserE` varchar(10) NOT NULL,
  `hmUserE` varchar(10) NOT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`idCategoria`, `NomeCategoria`, `idExclusao`, `cdUser`, `dtUser`, `hmUser`, `cdUserA`, `dtUserA`, `hmUserA`, `cdUserE`, `dtUserE`, `hmUserE`) VALUES
(1, 'Livro', '', 'Ricardo', '23072012', '221245', '', '', '', '', '', ''),
(2, 'CD', '', 'Ricardo', '23072012', '221255', '', '', '', '', '', ''),
(3, 'revista', '', 'Ricardo', '04082012', '201025', '', '20/09/2012', '222335', '', '', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

CREATE TABLE IF NOT EXISTS `categorias` (
  `idcategorias` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) DEFAULT NULL,
  `descricao` text,
  `datainclusao` datetime DEFAULT NULL,
  `userinclusao` int(10) unsigned DEFAULT NULL,
  `ativo` char(1) DEFAULT 'S',
  PRIMARY KEY (`idcategorias`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `categorias`
--

INSERT INTO `categorias` (`idcategorias`, `nome`, `descricao`, `datainclusao`, `userinclusao`, `ativo`) VALUES
(1, 'Biblioteca', '																Tem como objetivo...														', NULL, NULL, 'S'),
(2, 'EstÃ©tica', 'EstÃ©tica Ã© o estudo da medicina que cuida da aparÃªncia externa.													', NULL, NULL, 'S'),
(3, 'AlimentaÃ§Ã£o', 'Tem como objetivo o ....															', NULL, NULL, 'S'),
(4, 'Medicina AvanÃ§ada', 'Medicina capaz de mudar os habitos', NULL, NULL, 'S');

-- --------------------------------------------------------

--
-- Estrutura da tabela `devolucao_item`
--

CREATE TABLE IF NOT EXISTS `devolucao_item` (
  `idDevolucao` int(11) NOT NULL AUTO_INCREMENT,
  `idEmprestimo` int(11) NOT NULL,
  `dataDevolucao` varchar(10) NOT NULL,
  `horaDevolucao` varchar(10) NOT NULL,
  `cdUser` varchar(10) NOT NULL,
  `dtUser` varchar(10) NOT NULL,
  `hmUser` varchar(10) NOT NULL,
  PRIMARY KEY (`idDevolucao`),
  KEY `idEmprestimo` (`idEmprestimo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `editora`
--

CREATE TABLE IF NOT EXISTS `editora` (
  `idEditora` int(11) NOT NULL AUTO_INCREMENT,
  `nomeEditora` varchar(200) NOT NULL,
  `idExclusao` char(1) NOT NULL,
  `cdUser` varchar(50) NOT NULL,
  `dtUser` varchar(10) NOT NULL,
  `hmUser` varchar(10) NOT NULL,
  `cdUserA` varchar(50) NOT NULL,
  `dtUserA` varchar(10) NOT NULL,
  `hmUserA` varchar(10) NOT NULL,
  `cdUserE` varchar(50) NOT NULL,
  `dtUserE` varchar(10) NOT NULL,
  `hmUserE` varchar(10) NOT NULL,
  PRIMARY KEY (`idEditora`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `editora`
--

INSERT INTO `editora` (`idEditora`, `nomeEditora`, `idExclusao`, `cdUser`, `dtUser`, `hmUser`, `cdUserA`, `dtUserA`, `hmUserA`, `cdUserE`, `dtUserE`, `hmUserE`) VALUES
(1, 'Novatec', '', 'Ricardo', '23072012', '215718', '', '', '', '', '', ''),
(2, 'Teste Ed', '', 'Ricardo', '06082012', '224050', '', '', '', '', '', ''),
(3, 'Teste Edccc', '', 'Ricardo', '06082012', '224100', '', '19/09/2012', '000828', '', '', ''),
(4, 'Zamboia', '', '', '', '', '', '', '', '', '', ''),
(5, 'teste34', '', '', '19/09/2012', '002137', '', '19/09/2012', '002429', '', '', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `emprestimo`
--

CREATE TABLE IF NOT EXISTS `emprestimo` (
  `idEmprestimo` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(10) unsigned NOT NULL,
  `idItem` int(11) NOT NULL,
  `dataEmprestimo` varchar(10) NOT NULL,
  `horaEmprestimo` varchar(10) NOT NULL,
  `dataPrevistaEntrega` varchar(10) NOT NULL,
  `horaPrevistaEntrega` varchar(10) NOT NULL,
  PRIMARY KEY (`idEmprestimo`),
  KEY `idUsuario` (`idUsuario`),
  KEY `idItem` (`idItem`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `item`
--

CREATE TABLE IF NOT EXISTS `item` (
  `idItem` int(11) NOT NULL AUTO_INCREMENT,
  `idAutor` int(11) NOT NULL,
  `idEditora` int(11) NOT NULL,
  `idCategoria` int(11) NOT NULL,
  `idSegmento` int(11) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `nmItem` varchar(200) NOT NULL,
  `ano` varchar(10) NOT NULL,
  `ISBN` varchar(20) NOT NULL,
  `edicao` int(11) NOT NULL,
  `dtEdicao` varchar(15) NOT NULL,
  `nrPaginas` int(11) NOT NULL,
  `status` int(2) NOT NULL,
  `idExclusao` char(1) NOT NULL,
  `cdUser` varchar(50) NOT NULL,
  `dtUser` varchar(10) NOT NULL,
  `hmUser` varchar(10) NOT NULL,
  `cdUserA` varchar(50) NOT NULL,
  `dtUserA` varchar(10) NOT NULL,
  `hmUserA` varchar(10) NOT NULL,
  `cdUserE` varchar(50) NOT NULL,
  `dtUserE` varchar(10) NOT NULL,
  `hmUserE` varchar(10) NOT NULL,
  PRIMARY KEY (`idItem`),
  KEY `idAutor` (`idAutor`),
  KEY `idEditora` (`idEditora`),
  KEY `idCategoria` (`idCategoria`),
  KEY `idSegmento` (`idSegmento`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Extraindo dados da tabela `item`
--

INSERT INTO `item` (`idItem`, `idAutor`, `idEditora`, `idCategoria`, `idSegmento`, `cidade`, `nmItem`, `ano`, `ISBN`, `edicao`, `dtEdicao`, `nrPaginas`, `status`, `idExclusao`, `cdUser`, `dtUser`, `hmUser`, `cdUserA`, `dtUserA`, `hmUserA`, `cdUserE`, `dtUserE`, `hmUserE`) VALUES
(1, 4, 1, 1, 1, '0', 'A Cabana', '2012', '234-25-4568-789-9', 1, '13/08/2012', 201, 0, '', '1', '020812', '220105', '1', '080812', '204000', '', '', ''),
(2, 6, 2, 1, 3, 'Sao Paulo', 'Estudando PHP', '2012', '781-92-6413-241-3', 2, '21/08/2012', 500, 0, '', '1', '020812', '220342', '1', '18/09/2012', '234307', '', '', ''),
(3, 2, 1, 1, 2, '0', 'Estudando PHP', '2012', '781-92-6413-241-3', 2, '21/08/2012', 500, 0, '', '1', '020812', '220426', '', '', '', '', '', ''),
(4, 3, 1, 1, 2, 'Rio de Janeiro', 'Estudando PHP', '2012', '781-92-6413-241-3', 2, '21/08/2012', 500, 0, '', '1', '020812', '220431', '1', '18/09/2012', '234120', '', '', ''),
(5, 2, 1, 1, 2, '0', 'Estudando PHP', '2012', '781-92-6413-241-3', 2, '21/08/2012', 500, 0, '', 'Ricardo', '020812', '220620', '', '', '', '', '', ''),
(6, 2, 1, 1, 2, '0', 'Estudando Java', '2012', '758-20-5018-515-5', 2, '06/08/2012', 201, 0, '', 'Ricardo', '020812', '220740', '', '', '', '', '', ''),
(7, 2, 1, 1, 2, '0', 'Estudando C#', '2012', '758-20-5018-515-5', 3, '06/08/2012', 200, 0, '', 'Ricardo', '020812', '220753', '', '', '', '', '', ''),
(8, 2, 1, 1, 2, '0', 'Estudando C#', '2012', '758-20-5018-515-5', 3, '06/08/2012', 200, 0, '', 'Ricardo', '070812', '232735', '', '', '', '', '', ''),
(9, 2, 1, 1, 2, '0', 'Estudando C#', '2012', '758-20-5018-515-5', 3, '06/08/2012', 201, 0, '', 'Ricardo', '080812', '195923', 'Ricardo', '080812', '203904', '', '', ''),
(10, 7, 1, 2, 3, 'Brasilia', 'teste', '2012', '123123123123', 1, '01/03/2012', 0, 1, '', '1', '232606', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `multa`
--

CREATE TABLE IF NOT EXISTS `multa` (
  `idMulta` int(11) NOT NULL AUTO_INCREMENT,
  `idDevolucao` int(11) NOT NULL,
  `valor` int(15) NOT NULL,
  `cdUser` varchar(10) NOT NULL,
  `dtUser` varchar(10) NOT NULL,
  `hmUser` varchar(10) NOT NULL,
  PRIMARY KEY (`idMulta`),
  KEY `idDevolucao` (`idDevolucao`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `newsletters`
--

CREATE TABLE IF NOT EXISTS `newsletters` (
  `idnewsletters` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `datainclusao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dataalteracao` datetime DEFAULT NULL,
  `ativo` char(1) DEFAULT 'S',
  PRIMARY KEY (`idnewsletters`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `paginas`
--

CREATE TABLE IF NOT EXISTS `paginas` (
  `idpaginas` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usuarios_idusuarios` int(10) unsigned NOT NULL,
  `status_registro_idstatus_registro` int(10) unsigned NOT NULL,
  `titulo` varchar(50) DEFAULT NULL,
  `conteudo` text,
  `datainclusao` timestamp NULL DEFAULT NULL,
  `userinclusao` int(10) unsigned NOT NULL,
  `dataalteracao` datetime DEFAULT NULL,
  `useralteracao` int(10) unsigned DEFAULT NULL,
  `contadorvisitas` int(10) unsigned DEFAULT NULL,
  `ativo` char(1) DEFAULT 'S',
  PRIMARY KEY (`idpaginas`),
  KEY `paginas_FKIndex1` (`status_registro_idstatus_registro`),
  KEY `paginas_FKIndex2` (`usuarios_idusuarios`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Extraindo dados da tabela `paginas`
--

INSERT INTO `paginas` (`idpaginas`, `usuarios_idusuarios`, `status_registro_idstatus_registro`, `titulo`, `conteudo`, `datainclusao`, `userinclusao`, `dataalteracao`, `useralteracao`, `contadorvisitas`, `ativo`) VALUES
(1, 1, 1, 'Sobre a Empresa', '<p style="text-align: justify;">\r\n	<strong>Miss&atilde;o da Biblioteca Central da Universidade de Bras&iacute;lia</strong></p>\r\n<p style="text-align: justify;">\r\n	Promover e garantir para a&nbsp;comunidade universit&aacute;ria o acesso &agrave; informa&ccedil;&atilde;o e o compartilhamento&nbsp;no &acirc;mbito do Sistemas de Bibliotecas da UnB contemplando o ensino, a pesquisa e a extens&atilde;o.</p>\r\n<p style="text-align: justify;">\r\n	<strong>Hist&oacute;rico</strong></p>\r\n<p style="text-align: justify;">\r\n	Institu&iacute;da sob o impulso de renova&ccedil;&atilde;o do ensino superior no Brasil, a UnB apresenta-se desde seus prim&oacute;rdios como uma universidade integrada e, coerente com essa proposta, implantou no pa&iacute;s o conceito de biblioteca universit&aacute;ria com centraliza&ccedil;&atilde;o total.</p>\r\n<p style="text-align: justify;">\r\n	A Biblioteca Central da Universidade de Bras&iacute;lia foi criada, em 1962, opondo-se &agrave; tradi&ccedil;&atilde;o inadequada de m&uacute;ltiplas bibliotecas dispersas nas v&aacute;rias unidades de ensino das universidades &ndash; um sistema oneroso que gerava duplica&ccedil;&otilde;es desnecess&aacute;rias de acervo e de processos t&eacute;cnicos e administrativos. Desde ent&atilde;o, percorreu uma trajet&oacute;ria &iacute;mpar de mudan&ccedil;as, recuos e avan&ccedil;os.</p>\r\n<p style="text-align: justify;">\r\n	<strong>A BCE na Esplanada dos Minist&eacute;rios</strong></p>\r\n<p style="text-align: justify;">\r\n	A Universidade de Bras&iacute;lia tem suas primeiras instala&ccedil;&otilde;es no edif&iacute;cio do Minist&eacute;rio da Educa&ccedil;&atilde;o e Cultura, no bloco 1 da Esplanada dos Minist&eacute;rios, onde ocupava dois andares. &Eacute; neste local que, em mar&ccedil;o de 1962, a Universidade abriu seus primeiros cursos experimentais em Direito, Economia, Administra&ccedil;&atilde;o e Arquitetura e Urbanismo, tendo como reitor o professor Darcy Ribeiro. A Biblioteca Central da UnB &eacute; ent&atilde;o instalada no sexto andar do mesmo pr&eacute;dio com um acervo bibliogr&aacute;fico de emerg&ecirc;ncia, composto por dicion&aacute;rios, enciclop&eacute;dias e alguns peri&oacute;dicos, constitu&iacute;do-se basicamente em uma cole&ccedil;&atilde;o de refer&ecirc;ncia.</p>\r\n<p style="text-align: justify;">\r\n	<strong>A BCE na Sala de Papiros</strong></p>\r\n<p style="text-align: justify;">\r\n	Em julho de 1962, a Biblioteca Central foi transferida para a Sala dos Papiros, localizada em um dos primeiros edif&iacute;cios constru&iacute;dos no campus da UnB, atualmente ocupado pela Faculdade de Educa&ccedil;&atilde;o. Neste per&iacute;odo, a Biblioteca contava com um incipiente servi&ccedil;o de refer&ecirc;ncia, aquisi&ccedil;&atilde;o, cataloga&ccedil;&atilde;o e registro de peri&oacute;dicos. Foi solicitado &agrave; Funda&ccedil;&atilde;o Ford aux&iacute;lio para o desenvolvimento do acervo, o que resultou na vinda ao Brasil de dois de seus consultores. Firmou-se ent&atilde;o um conv&ecirc;nio para um programa q&uuml;inq&uuml;enal, iniciado no primeiro semestre de 1963 e conclu&iacute;do em outubro de 1968, que previa, entre outros benef&iacute;cios, o pagamento de assessoria especializada para elabora&ccedil;&atilde;o de um programa de especifica&ccedil;&otilde;es destinadas a orientar o planejamento do pr&eacute;dio definitivo da Biblioteca.</p>\r\n<p style="text-align: justify;">\r\n	<strong>A BCE no Ed&iacute;ficio SG-12</strong></p>\r\n<p style="text-align: justify;">\r\n	Devido ao crescimento do acervo, a BCE ocupa, a partir de janeiro de 1964, o t&eacute;rreo e o subsolo do Edif&iacute;cio SG-12, onde disp&ocirc;s de uma m&aacute;quina de x&eacute;rox, uma cantina e uma roleta de controle de entrada de usu&aacute;rios. O hor&aacute;rio de funcionamento passou a ser de 24 horas.</p>\r\n<p style="text-align: justify;">\r\n	<strong>A BCE e a Ditadura Militar</strong></p>\r\n<p style="text-align: justify;">\r\n	Considerado um centro de subvers&atilde;o, em 9 de abril de 1964, o campus da UnB foi invadido pela Pol&iacute;cia Militar do Estado de Minas Gerais. Todo material pass&iacute;vel de investiga&ccedil;&atilde;o foi coletado e armazenado na Biblioteca Central, a qual foi interditada e permaneceu fechada mesmo ap&oacute;s a libera&ccedil;&atilde;o do restante do campus.</p>\r\n<p style="text-align: justify;">\r\n	Alguns jornais noticiaram a destrui&ccedil;&atilde;o de documentos, entretanto n&atilde;o h&aacute; registros desse fato, acredita-se que por causa da forte repress&atilde;o pol&iacute;tica.</p>\r\n<p style="text-align: justify;">\r\n	<strong>A Biblioteca Volante</strong></p>\r\n<p style="text-align: justify;">\r\n	Criada em 23 de maio de 1966 por um acordo entre o Instituto Nacional do Livro, a Prefeitura do Distrito Federal e a Universidade de Bras&iacute;lia, a Biblioteca Volante foi uma atividade de extens&atilde;o cultural que recebeu grande simpatia por parte da comunidade. Embora audaciosa em seu projeto original, contou com poucos recursos. Trabalharam na Biblioteca Volante somente a Sr&ordf; Ana Rosa Simpl&iacute;cio, auxiliar de biblioteca, e um motorista. Em uma Kombi levavam &agrave;s localidades menos privilegiadas do Distrito Federal um acervo de 2000 livros nas categorias: did&aacute;ticos, infantis, juvenis e adultos.</p>\r\n<p style="text-align: justify;">\r\n	A Sr&ordf; Ana Rosa costumava levar doces para atrair as crian&ccedil;as, promovia sess&otilde;es de leitura de est&oacute;rias, ensinava a pesquisa aos estudantes, garantindo assim a boa movimenta&ccedil;&atilde;o de empr&eacute;stimos.</p>\r\n<p style="text-align: justify;">\r\n	Reflexo da crise que a Universidade vinha atravessando, a Biblioteca Volante teve seu fim em 01 de abril de 1967.</p>\r\n<p style="text-align: justify;">\r\n	<strong>Planejamento do Pr&eacute;dio Definitivo</strong></p>\r\n<p style="text-align: justify;">\r\n	Em mar&ccedil;o de 1967, com os recursos da Funda&ccedil;&atilde;o Ford, o Dr&ordm; Frazer G. Poole, especialista em arquitetura de bibliotecas, foi convidado a auxiliar no planejamento definitivo da BCE. Um detalhado programa de especifica&ccedil;&otilde;es t&eacute;cnicas foi elaborado. Atrav&eacute;s do Programa para Desenvolvimento do Ensino Superior no Brasil, estabelecido entre o Minist&eacute;rio da Educa&ccedil;&atilde;o e Cultura e o BID (Banco Interamericano de Desenvolvimento), obteve-se o financiamento para a constru&ccedil;&atilde;o do edif&iacute;cio.</p>\r\n', '2012-10-14 03:00:00', 1, NULL, NULL, NULL, 'S'),
(2, 1, 1, 'Normas Gerais', '', '2012-09-11 03:00:00', 0, NULL, NULL, NULL, 'S'),
(3, 1, 1, 'ISBN', '<p style="text-align: center;">\r\n	<span style="font-size:24px;"><strong>ISBN</strong></span></p>\r\n<p style="text-align: center;">\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;&nbsp; Criado em 1967 e oficializado como norma internacional em 1972, o ISBN - International Standard Book Number - &eacute; um sistema que identifica numericamente os livros segundo o t&iacute;tulo, o autor, o pa&iacute;s e a editora, individualizando-os inclusive por edi&ccedil;&atilde;o.</p>\r\n<p>\r\n	&nbsp;&nbsp; O sistema &eacute; controlado pela Ag&ecirc;ncia Internacional do ISBN, que orienta e delega poderes &agrave;s ag&ecirc;ncias nacionais. No Brasil, a Funda&ccedil;&atilde;o Biblioteca Nacional representa a Ag&ecirc;ncia Brasileira desde 1978, com a fun&ccedil;&atilde;o de atribuir o n&uacute;mero de identifica&ccedil;&atilde;o aos livros editados no pa&iacute;s.</p>\r\n<p>\r\n	&nbsp;&nbsp; A partir de 1&ordm; de janeiro de 2007, o ISBN passou de dez para 13 d&iacute;gitos, com a ado&ccedil;&atilde;o do prefixo 978. O objetivo foi aumentar a capacidade do sistema, devido ao crescente n&uacute;mero de publica&ccedil;&otilde;es, com suas edi&ccedil;&otilde;es e formatos.</p>\r\n<p>\r\n	&nbsp;&nbsp; Para cumprir a miss&atilde;o de informar e atender aos editores, livreiros, bibliotecas e distribuidores brasileiros, a Funda&ccedil;&atilde;o Biblioteca Nacional re&uacute;ne todas as informa&ccedil;&otilde;es referentes ao sistema ISBN no pa&iacute;s.</p>\r\n<p>\r\n	<strong>Apresenta&ccedil;&atilde;o do ISBN</strong></p>\r\n<p>\r\n	&nbsp;&nbsp; O ISBN deve ser escrito ou impresso, precedido pela sigla ISBN, a cada segmento separado por h&iacute;fen.<br />\r\n	<br />\r\n	<img align="middle" height="168" src="http://www.isbn.bn.br/static/img/ex_isbn.jpg" width="351" /></p>\r\n<p>\r\n	<strong>Impress&atilde;o do n&uacute;mero do ISBN</strong></p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1 - No verso da folha de rosto</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2 - No p&eacute; da 4&ordf; capa, do lado direito junto a lombada</p>\r\n<p>\r\n	&nbsp;&nbsp; Atribui&ccedil;&atilde;o do n&uacute;mero de identifica&ccedil;&atilde;o do editor &eacute; compet&ecirc;ncia exclusiva da Ag&ecirc;ncia local, no caso do Brasil, a Funda&ccedil;&atilde;o Biblioteca Nacional.</p>\r\n', '2012-10-06 03:00:00', 0, NULL, NULL, NULL, 'S'),
(10, 1, 4, 'teste', '<p>\r\n	aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>\r\n', '2012-05-09 03:00:00', 10, NULL, NULL, NULL, 'N'),
(11, 1, 4, 'Teste de menu', '<p>\r\n	Testando menu</p>\r\n', '2012-05-08 03:00:00', 10, NULL, NULL, NULL, 'N'),
(12, 1, 1, 'Posts', '<p>\r\n	Esta pagina trata-se de um modelo de postagem de transa&ccedil;&otilde;es ocorridas no territ&oacute;rio nacional, abaixo ver&atilde;o como s&atilde;o interessantes estes quesitos.</p>\r\n<p>\r\n	<br />\r\n	<img alt="" src="http://www.magnopires.com.br/wp-content/uploads/2012/01/Medicina-3.jpg" style="width: 200px; height: 178px;" /></p>\r\n<p>\r\n	<br />\r\n	Estes s&atilde;o demonstra&ccedil;&otilde;es de orienta&ccedil;&atilde;o m&eacute;dica de todos os tempos, sendo assim todos os leitores poder&atilde;o ver estas informa&ccedil;&otilde;es.</p>\r\n', NULL, 0, NULL, NULL, NULL, 'S'),
(13, 1, 1, 'Multas', '<p style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt;">\r\n	A devolu&ccedil;&atilde;o de material fora do prazo estipulado implica em pagamento de multa, calculada por dia de atraso para cada obra ou servi&ccedil;o:&nbsp;</p>\r\n<p style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt;">\r\n	&nbsp;</p>\r\n<p style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt;">\r\n	<b>Livro/Dia - R$ 0,90&nbsp;</b></p>\r\n<p style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt;">\r\n	<b>Peri&oacute;dicos/Dia - R$ 0,90&nbsp;</b></p>\r\n<p style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt;">\r\n	<b>Multimeios - R$ 1,50&nbsp;</b></p>\r\n<p style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt;">\r\n	<b>Livros de Sala de Reserva/Hora - R$ 1,00&nbsp;</b></p>\r\n<p style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt;">\r\n	&nbsp;</p>\r\n<p style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt;">\r\n	<span class="Apple-style-span" style="color: rgb(0, 128, 0);"><span class="Apple-style-span" style="color: rgb(0, 0, 0);">O pagamento de multas devidas &agrave; BCE &eacute; realizado por via banc&aacute;ria e o usu&aacute;rio deve proceder da seguinte maneira:&nbsp;</span></span></p>\r\n<p style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt;">\r\n	&nbsp;</p>\r\n<p style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt;">\r\n	<span class="Apple-style-span" style="color: rgb(0, 128, 0);"><span class="Apple-style-span" style="color: rgb(0, 0, 0);">1 - Realizar a devolu&ccedil;&atilde;o do material no Setor de Empr&eacute;stimos da BCE, onde ser&aacute; emitido o extrato da multa.&nbsp;</span></span></p>\r\n<p style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt;">\r\n	&nbsp;</p>\r\n<p style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt;">\r\n	<span class="Apple-style-span" style="color: rgb(0, 128, 0);"><span class="Apple-style-span" style="color: rgb(0, 0, 0);">2 - Caso seja correntista do Banco do Brasil, efetuar o pagamento da multa via Transfer&ecirc;ncia Banc&aacute;ria atrav&eacute;s da internet no s&iacute;tio do&nbsp;<a href="http://www.bb.com.br">Banco do Brasil</a>&nbsp;ou em caixa eletr&ocirc;nico, seguindo as op&ccedil;&otilde;es:&nbsp;</span></span></p>\r\n<p style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt;">\r\n	&nbsp;</p>\r\n<p style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt;">\r\n	<b>1&ordm; Transfer&ecirc;ncia&nbsp;</b></p>\r\n<p style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt;">\r\n	<span class="Apple-style-span" style="color: rgb(0, 128, 0);"><span class="Apple-style-span" style="color: rgb(0, 0, 0);"><b><span class="Apple-style-span" style="font-weight: normal;"><b>2&ordm; Outras Transfer&ecirc;ncias&nbsp;</b></span></b></span></span></p>\r\n<p style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt;">\r\n	<b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b>3&ordm; De Conta Corrente para Conta &Uacute;nica do Tesouro&nbsp;</b></span></b></span></b></p>\r\n<p style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt;">\r\n	<b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b>4&ordm; Digitar o Valor&nbsp;</b></span></b></span></b></span></b></p>\r\n<p style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt;">\r\n	<b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b>5&ordm; Identificador 1: 15404015257288489&nbsp;</b></span></b></span></b></span></b></span></b></p>\r\n<p style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt;">\r\n	<b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b>6&ordm; Identificador 2: CPF do depositante&nbsp;</b></span></b></span></b></span></b></span></b></span></b></p>\r\n<p style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt;">\r\n	<b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b>7&ordm; Confirmar&nbsp;</b></span></b></span></b></span></b></span></b></span></b></span></b></p>\r\n<p style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt;">\r\n	&nbsp;</p>\r\n<p style="text-align: center; font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt;">\r\n	<b><b><b><b><b><b><b><b>Aten&ccedil;&atilde;o:</b> </b><span class="Apple-style-span" style="font-weight: normal;">A conta do Tesouro Nacional n&atilde;o aceita transfer&ecirc;ncia ap&oacute;s as 20 horas.</span><span class="Apple-style-span" style="color: rgb(153, 153, 153);"><span class="Apple-style-span" style="font-weight: normal;">&nbsp;</span></span></b></b></b></b></b></b></p>\r\n<p style="text-align: center; font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt;">\r\n	&nbsp;</p>\r\n<p style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt;">\r\n	<b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal; color: rgb(153, 153, 153);"><span class="Apple-style-span" style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt; color: rgb(0, 0, 0);">3 - Os usu&aacute;rios que n&atilde;o tiverem Conta Corrente no Banco do Brasil, dever&atilde;o efetuar o pagamento diretamente no caixa da ag&ecirc;ncia, atrav&eacute;s de dep&oacute;sito para:&nbsp;</span></span></b></span></b></span></b></span></b></span></b></span></b></span></b></p>\r\n<p style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt;">\r\n	&nbsp;</p>\r\n<p style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt;">\r\n	<b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal; color: rgb(153, 153, 153);"><span class="Apple-style-span" style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt; color: rgb(0, 0, 0);"><b style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt;">Ag&ecirc;ncia: 1607-1</b></span></span></b></span></b></span></b></span></b></span></b></span></b></span></b></p>\r\n<p style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt;">\r\n	&nbsp;</p>\r\n<p style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt;">\r\n	<b><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal; color: rgb(153, 153, 153);"><span class="Apple-style-span" style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt; color: rgb(0, 0, 0);"><b style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt;">Conta: 170500-8</b></span></span></b></span></b></span></b></span></b></span></b></span></b></span></b></b></p>\r\n<p style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt;">\r\n	&nbsp;</p>\r\n<p style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt; display: inline ! important;">\r\n	<b><b><b><b><b><b><b><b><b style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal; color: rgb(153, 153, 153);"><span class="Apple-style-span" style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt; color: rgb(0, 0, 0);"><b style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 10px;"><span class="Apple-style-span" style="font-weight: normal; font-size: 12px;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal; color: rgb(153, 153, 153);"><span class="Apple-style-span" style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt; color: rgb(0, 0, 0);"><b style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 10px;"><span class="Apple-style-span" style="font-weight: normal;"><b style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 10px;"><span class="Apple-style-span" style="font-weight: normal;"><b style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt;"><span class="Apple-style-span" style="font-weight: normal; font-size: 12px;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal; color: rgb(153, 153, 153);"><span class="Apple-style-span" style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt; color: rgb(0, 0, 0);"><b style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 10px;"><span class="Apple-style-span" style="font-weight: normal; font-size: 12px;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal; color: rgb(153, 153, 153);"><span class="Apple-style-span" style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt; color: rgb(0, 0, 0);"><b style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 10px;"><span class="Apple-style-span" style="font-weight: normal;"><b style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 10px;"><span class="Apple-style-span" style="font-weight: normal;"><b style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt;">C&oacute;digo Identificador: 15404015257288489</b></span></b></span></b></span></span></b></span></b></span></b></span></b></span></b></span></b></span></b></span></b></span></span></b></span></b></span></b></span></b></span></b></span></b></span></b></span></b></span></b></span></b></span></span></b></span></b></span></b></span></b></span></b></span></b></span></b></span></b></span></span></b></span></b></span></b></span></b></span></b></span></b></span></b></b></b></b></b></b></b></b></b></b></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt;">\r\n	<span class="Apple-style-span" style="font-weight: normal; font-size: 10px;">&nbsp;</span></p>\r\n<p style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt;">\r\n	<b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal; color: rgb(153, 153, 153);"><span class="Apple-style-span" style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt; color: rgb(0, 0, 0);"><b style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 10px;"><span class="Apple-style-span" style="font-weight: normal; font-size: 12px;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal; color: rgb(153, 153, 153);"><span class="Apple-style-span" style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt; color: rgb(0, 0, 0);"><b style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 10px;"><span class="Apple-style-span" style="font-weight: normal;"><b style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 10px;"><span class="Apple-style-span" style="font-weight: normal;"><b style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 10px;"><span class="Apple-style-span" style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt; font-weight: normal;">4 - Entregar o comprovante do pagamento da multa no Setor de Empr&eacute;stimos, para regulariza&ccedil;&atilde;o de sua situa&ccedil;&atilde;o junto a biblioteca.&nbsp;</span></b></span></b></span></b></span></span></b></span></b></span></b></span></b></span></b></span></b></span></b></span></b></span></span></b></span></b></span></b></span></b></span></b></span></b></span></b></p>\r\n<p style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt;">\r\n	&nbsp;</p>\r\n<p style="text-align: center; font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt;">\r\n	<b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal; color: rgb(153, 153, 153);"><span class="Apple-style-span" style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt; color: rgb(0, 0, 0);"><b style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 10px;"><span class="Apple-style-span" style="font-weight: normal; font-size: 12px;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal;"><b><span class="Apple-style-span" style="font-weight: normal; color: rgb(153, 153, 153);"><span class="Apple-style-span" style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt; color: rgb(0, 0, 0);"><b style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 10px;"><span class="Apple-style-span" style="font-weight: normal;"><b style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 10px;"><span class="Apple-style-span" style="font-weight: normal;"><b style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 10px;"><span class="Apple-style-span" style="font-weight: normal;"><b style="font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 9pt;">A BCE n&atilde;o tem fins lucrativos, o pagamento da multa &eacute; de car&aacute;ter educativo.</b></span></b></span></b></span></b></span></span></b></span></b></span></b></span></b></span></b></span></b></span></b></span></b></span></span></b></span></b></span></b></span></b></span></b></span></b></span></b></p>\r\n', '2012-09-09 03:00:00', 0, NULL, NULL, NULL, 'S'),
(22, 1, 1, 'EmprÃ©stimos', '<p>\r\n	Regulamento do Servi&ccedil;o de Empr&eacute;stimo<br />\r\n	Usu&aacute;rios<br />\r\n	Poder&atilde;o cadastrar-se como usu&aacute;rios da Biblioteca, professores, alunos e funcion&aacute;rios da PUC Minas<br />\r\n	e do Sistema de Ensino Arquidiocesano, bem como ex-alunos de gradua&ccedil;&atilde;o e Bibliotecas de outras<br />\r\n	Institui&ccedil;&otilde;es de Ensino Superior e Centros de Informa&ccedil;&atilde;o e Documenta&ccedil;&atilde;o.<br />\r\n	Documentos Necess&aacute;rios<br />\r\n	Alunos Regularmente Matriculados:<br />\r\n	Comprovante de matricula ou Identidade Estudantil do per&iacute;odo vigente;<br />\r\n	Carteira de Identidade.<br />\r\n	Professores e funcion&aacute;rios:<br />\r\n	Identidade Funcional ou contracheque, mediante apresenta&ccedil;&atilde;o de Carteira de Identidade.<br />\r\n	Ex-alunos:<br />\r\n	Carteira de Identidade ou Carteira Profissional;<br />\r\n	Certificado de conclus&atilde;o do curso;<br />\r\n	Comprovante de endere&ccedil;o (conta de &aacute;gua, luz ou telefone);<br />\r\n	Pagamento da taxa de ades&atilde;o.<br />\r\n	Bibliotecas de Outras Institui&ccedil;&otilde;es de Ensino Superior:<br />\r\n	Cadastramento pr&eacute;vio da Institui&ccedil;&atilde;o na Biblioteca, junto ao Setor de Refer&ecirc;ncia;<br />\r\n	Localiza&ccedil;&atilde;o na regi&atilde;o metropolitana de Belo Horizonte;<br />\r\n	Empr&eacute;stimo entre Bibliotecas: Ver regulamento espec&iacute;fico.<br />\r\n	Hor&aacute;rio de Funcionamento:<br />\r\n	De segunda a sexta, das 7h30min. &agrave;s 22h30 min.<br />\r\n	S&aacute;bado, das 7h30min. &agrave;s 16 horas.<br />\r\n	Empr&eacute;stimo<br />\r\n	&middot; Os materiais dispon&iacute;veis para empr&eacute;stimo s&atilde;o: livros, CD-ROMs, DVDs, mapas, slides,<br />\r\n	fitas de v&iacute;de e fitas K7;<br />\r\n	&middot; As revistas, jornais, trabalhos de conclus&atilde;o de curso, folhetos, disquetes, discos de vinil,<br />\r\n	normas t&eacute;cnicas, cat&aacute;logos t&eacute;cnicos, projetos de pesquisa e materiais da Cole&ccedil;&atilde;o Mem&oacute;ria<br />\r\n	n&atilde;o est&atilde;o dispon&iacute;veis para empr&eacute;stimo;<br />\r\n	&middot; As obras de Refer&ecirc;ncia, Consulta Interna, Mapas e Cole&ccedil;&otilde;es Especiais poder&atilde;o ser<br />\r\n	emprestadas, em car&aacute;ter especial, aos s&aacute;bados;<br />\r\n	&middot; Para utilizarem o servi&ccedil;o de empr&eacute;stimo, alunos, professores e funcion&aacute;rios dever&atilde;o<br />\r\n	apresentar a Identidade Estudantil ou Identidade Funcional, com valida&ccedil;&atilde;o de senha;<br />\r\n	&middot; Os usu&aacute;rios poder&atilde;o efetuar empr&eacute;stimo, devolu&ccedil;&atilde;o e requisi&ccedil;&atilde;o de livros por meio do<br />\r\n	servi&ccedil;o de malote, em qualquer unidade da PUC Minas.<br />\r\n	Tabela de empr&eacute;stimo/usu&aacute;rio<br />\r\n	Categoria de Usu&aacute;rio Quantidade de<br />\r\n	Material<br />\r\n	Prazo de empr&eacute;stimo<br />\r\n	em dias &uacute;teis<br />\r\n	Alunos de gradua&ccedil;&atilde;o 4 7<br />\r\n	Alunos de dois cursos 10 10<br />\r\n	Alunos de P&oacute;s-gradua&ccedil;&atilde;o 6 10<br />\r\n	Funcion&aacute;rios 4 7<br />\r\n	Professores 10 7<br />\r\n	Alunos Sistema de Ensino<br />\r\n	Arquidiocesano<br />\r\n	4 7<br />\r\n	Ex-alunos 2 7<br />\r\n	Bibliotecas Externas 10* 7<br />\r\n	* As Bibliotecas Externas est&atilde;o autorizadas a efetuar apenas empr&eacute;stimo de livros. Cada<br />\r\n	usu&aacute;rio poder&aacute; efetuar 02 (dois) empr&eacute;stimos, mediante apresenta&ccedil;&atilde;o do formul&aacute;rio de<br />\r\n	empr&eacute;stimo entre bibliotecas.<br />\r\n	Reserva<br />\r\n	&middot; A reserva do material poder&aacute; ser feita nos terminais de consulta da Biblioteca ou<br />\r\n	pela Internet, desde que o material a ser reservado esteja emprestado;<br />\r\n	&middot; O usu&aacute;rio poder&aacute; receber o aviso de disponibilidade de reserva, desde que tenha seu<br />\r\n	e-mail cadastrado, sendo que alunos de gradua&ccedil;&atilde;o dever&atilde;o cadastrar-se no CRA<br />\r\n	(Centro de Registro Acad&ecirc;mico), professores na PRORH e alunos de p&oacute;s-gradua&ccedil;&atilde;o<br />\r\n	na secretaria do curso;<br />\r\n	&middot; A obra reservada ficar&aacute; dispon&iacute;vel para o usu&aacute;rio por 24 horas ap&oacute;s sua devolu&ccedil;&atilde;o.<br />\r\n	Renova&ccedil;&atilde;o<br />\r\n	A renova&ccedil;&atilde;o do empr&eacute;stimo do material de qualquer unidade da PUC Minas poder&aacute; ser feita nos<br />\r\n	terminais de consulta da Biblioteca ou pela Internet, desde que:<br />\r\n	&middot; O empr&eacute;stimo esteja dentro do prazo de vencimento;<br />\r\n	&middot; N&atilde;o exista reserva para o material;<br />\r\n	&middot; O usu&aacute;rio n&atilde;o esteja em situa&ccedil;&atilde;o irregular junto &agrave; Biblioteca.<br />\r\n	Servi&ccedil;o de Malote<br />\r\n	&middot; O servi&ccedil;o de malote &eacute; restrito a alunos, professores e funcion&aacute;rios da PUC Minas<br />\r\n	cadastrados no sistema da Biblioteca;<br />\r\n	&middot; O pedido deve ser feito no setor de refer&ecirc;ncia da biblioteca solicitante;<br />\r\n	&middot; A obra deve estar em situa&ccedil;&atilde;o normal e dispon&iacute;vel no acervo;<br />\r\n	&middot; O prazo de encaminhamento ser&aacute; de 48 horas, sendo que a obra ficar&aacute; dispon&iacute;vel para o<br />\r\n	usu&aacute;rio pelo prazo de 03 dias &uacute;teis a partir da chegada do malote. Ao fim deste prazo, a<br />\r\n	obra ser&aacute; devolvida &agrave; biblioteca fornecedora;<br />\r\n	&middot; A obra ser&aacute; liberada somente para o solicitante e ap&oacute;s a sua identifica&ccedil;&atilde;o (Carteira de<br />\r\n	Estudante, Carteira Funcional ou Carteira de Identidade).<br />\r\n	Multa / Suspens&atilde;o / Penalidades<br />\r\n	&middot; O atraso na devolu&ccedil;&atilde;o do material retirado por empr&eacute;stimo, implicar&aacute; na suspens&atilde;o<br />\r\n	autom&aacute;tica do usu&aacute;rio, pelo dobro do n&uacute;mero de dias em atraso;<br />\r\n	&middot; O usu&aacute;rio que estiver em situa&ccedil;&atilde;o irregular junto &agrave; Biblioteca, ficar&aacute; impedido de efetuar<br />\r\n	novos empr&eacute;stimos, renova&ccedil;&otilde;es e reservas estando automaticamente suspenso;<br />\r\n	&middot; O usu&aacute;rio poder&aacute; ter seu registro suspenso pela Chefia da Biblioteca, em caso de faltas cuja<br />\r\n	gravidade comprometa de modo irremedi&aacute;vel o bom funcionamento da Biblioteca;<br />\r\n	&middot; O usu&aacute;rio &eacute; diretamente respons&aacute;vel pelos materiais que retirar da Biblioteca, devendo zelar<br />\r\n	pela sua integridade, visando sua preserva&ccedil;&atilde;o;<br />\r\n	&middot; O usu&aacute;rio dever&aacute; efetuar a reposi&ccedil;&atilde;o do material em casos de perda e eventuais danos a ele<br />\r\n	causados, devendo substitu&iacute;-lo por:<br />\r\n	1. Outro exemplar (mesmo autor e t&iacute;tulo, data e edi&ccedil;&atilde;o iguais ou mais atualizadas);<br />\r\n	2. Obra similar a ser indicada pela Biblioteca (em caso de obra esgotada).<br />\r\n	Escaninhos/Vigil&acirc;ncia<br />\r\n	&middot; Para guarda de objetos de uso particular, como pastas, bolsas, colecionadores,<br />\r\n	sacolas, pacotes, etc., o usu&aacute;rio dever&aacute; utilizar os escaninhos da Biblioteca;<br />\r\n	&middot; Para utiliza&ccedil;&atilde;o dos escaninhos, o usu&aacute;rio receber&aacute; uma chave, mediante<br />\r\n	apresenta&ccedil;&atilde;o de documento, que ficar&aacute; retido durante o per&iacute;odo de sua perman&ecirc;ncia<br />\r\n	nas depend&ecirc;ncias da Biblioteca e ser&aacute; liberado ap&oacute;s a devolu&ccedil;&atilde;o da chave;<br />\r\n	&middot; Os escaninhos s&oacute; poder&atilde;o ser utilizados durante o tempo de perman&ecirc;ncia do usu&aacute;rio<br />\r\n	na Biblioteca;<br />\r\n	&middot; A Biblioteca n&atilde;o se responsabiliza por objetos (pastas, bolsas, sacolas, pacotes, etc.)<br />\r\n	deixados ou esquecidos nos escaninhos, bem como pelo seu conte&uacute;do;<br />\r\n	&middot; Em caso de extravio da chave do escaninho, o usu&aacute;rio ser&aacute; respons&aacute;vel pelo custo<br />\r\n	decorrente de sua troca;<br />\r\n	&middot; Na sa&iacute;da, os usu&aacute;rios dever&atilde;o apresentar ao encarregado da vigil&acirc;ncia os materiais que<br />\r\n	tenham sido retirados por empr&eacute;stimo, n&atilde;o podendo negar-se &agrave; confer&ecirc;ncia do material que<br />\r\n	entra ou sai da Biblioteca;<br />\r\n	&middot; A n&atilde;o devolu&ccedil;&atilde;o da chave em tempo h&aacute;bil implica na suspens&atilde;o do usu&aacute;rio por 07 (sete)<br />\r\n	dias &uacute;teis, contados, para cada dia de posse da chave, a partir da data de seu empr&eacute;stimo.<br />\r\n	Responsabilidades dos usu&aacute;rios<br />\r\n	&middot; Solicitamos aos usu&aacute;rios n&atilde;o utilizarem aparelhos celulares bem como falar em voz alta,<br />\r\n	fumar e se alimentar nas depend&ecirc;ncias da biblioteca;<br />\r\n	&middot; O usu&aacute;rio tamb&eacute;m &eacute; respons&aacute;vel pela manuten&ccedil;&atilde;o do silencio e da organiza&ccedil;&atilde;o da<br />\r\n	biblioteca;<br />\r\n	&middot; Comunicar imediatamente a perda ou extravio da carteira de usu&aacute;rio, permitindo o bloqueio<br />\r\n	do acesso assim como a troca da senha;<br />\r\n	&middot; N&atilde;o emprestar sua carteira a outro leitor;<br />\r\n	&middot; Comunicar qualquer altera&ccedil;&atilde;o de endere&ccedil;o;<br />\r\n	&middot; Acompanhar a &ldquo;tela de acesso ao usu&aacute;rio&rdquo; quando da realiza&ccedil;&atilde;o de qualquer transa&ccedil;&atilde;o do<br />\r\n	servi&ccedil;o de circula&ccedil;&atilde;o;<br />\r\n	&middot; Devolver o material da biblioteca dentro dos prazos estabelecidos;<br />\r\n	&middot; Zelar pela integridade das obras sob sua responsabilidade visando a sua preserva&ccedil;&atilde;o.</p>\r\n', '2012-09-11 03:00:00', 0, NULL, NULL, NULL, 'S');

-- --------------------------------------------------------

--
-- Estrutura da tabela `perfis`
--

CREATE TABLE IF NOT EXISTS `perfis` (
  `idperfis` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) DEFAULT NULL,
  `descricao` text,
  `ativo` char(1) DEFAULT 'S',
  PRIMARY KEY (`idperfis`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `perfis`
--

INSERT INTO `perfis` (`idperfis`, `nome`, `descricao`, `ativo`) VALUES
(1, 'Administrador', NULL, 'S'),
(2, 'Usuario', NULL, 'S');

-- --------------------------------------------------------

--
-- Estrutura da tabela `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `idposts` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usuarios_idusuarios` int(10) unsigned NOT NULL,
  `status_registro_idstatus_registro` int(10) unsigned NOT NULL,
  `categorias_idcategorias` int(10) unsigned NOT NULL,
  `titulo` varchar(60) DEFAULT NULL,
  `conteudo` text,
  `datainclusao` varchar(15) DEFAULT NULL,
  `userinclusao` int(10) unsigned DEFAULT NULL,
  `dataalteracao` varchar(15) DEFAULT NULL,
  `useralteracao` int(11) DEFAULT NULL,
  `ativo` char(1) DEFAULT 'S',
  PRIMARY KEY (`idposts`),
  KEY `posts_FKIndex1` (`categorias_idcategorias`),
  KEY `posts_FKIndex2` (`status_registro_idstatus_registro`),
  KEY `posts_FKIndex3` (`usuarios_idusuarios`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Extraindo dados da tabela `posts`
--

INSERT INTO `posts` (`idposts`, `usuarios_idusuarios`, `status_registro_idstatus_registro`, `categorias_idcategorias`, `titulo`, `conteudo`, `datainclusao`, `userinclusao`, `dataalteracao`, `useralteracao`, `ativo`) VALUES
(1, 1, 1, 1, 'SaÃºde Ã© coisa sÃ©ria', '<p style="text-align: justify;">\r\n	Post &eacute; uma palavra em ingl&ecirc;s que significa correio, p&aacute;gina, posto, fun&ccedil;&atilde;o, etc, tamb&eacute;m &eacute; utilizada para designar uma mensagem que foi enviada para um grupo de discuss&atilde;o ou para uma lista de e-mails. No &#39;mundo dos blogs&#39;, um post &eacute; uma mensagem colocada no blog e postar &eacute; enviar uma mensagem para o blog.</p>\r\n<p style="text-align: justify;">\r\n	Post &eacute; uma palavra em ingl&ecirc;s que significa correio, p&aacute;gina, posto, fun&ccedil;&atilde;o, etc, tamb&eacute;m &eacute; utilizada para designar uma mensagem que foi enviada para um grupo de discuss&atilde;o ou para uma lista de e-mails. No &#39;mundo dos blogs&#39;, um post &eacute; uma mensagem colocada no blog e postar &eacute; enviar uma mensagem para o blog.</p>\r\n', '', NULL, NULL, NULL, 'S'),
(2, 1, 1, 4, 'Cirurgias', '<p style="text-align: justify;">\r\n	<span style="font-size:14px;">Em 2009, um grande estudo publicado na New England Jornal of Medicine, possivelmente o peri&oacute;dico m&eacute;dico mais respeitado do mundo, confirmou a validade da implanta&ccedil;&atilde;o do Protocolo. Foi realizado em centros de v&aacute;rios pa&iacute;ses, com diferentes estruturas e graus de complexidade e conseguiu reduzir a mortalidade de 1,5% para 0,8% (queda de 46%) e o &iacute;ndice de complica&ccedil;&otilde;es ca&iacute;ram de 11% para 7% (queda de 36%). A publica&ccedil;&atilde;o deste estudo nos deu ainda mais for&ccedil;a e mostrou que estamos no caminho certo.</span></p>\r\n<p style="text-align: justify;">\r\n	<span style="font-size: 14px;"><br />\r\n	Desde 2000, quando o Hospital Anchieta recebeu a 1 certifica&ccedil;&atilde;o da ISO, j&aacute; era trabalhada a Gest&atilde;o de Risco, a preocupa&ccedil;&atilde;o com a seguran&ccedil;a dos pacientes j&aacute; era prioridade da Superintend&ecirc;ncia do Hospital. Desde ent&atilde;o, o HA cresceu e se aperfei&ccedil;oou muito. Recebeu em 2002 o certificado de Acredita&ccedil;&atilde;o da ONA em N&iacute;vel I que tem como princ&iacute;pio justamente a seguran&ccedil;a do paciente, em 2003, o certificado n&iacute;vel II e em 2006, j&aacute; era n&iacute;vel III. Analisando o indicador de seguran&ccedil;a, constatamos que temos um alto desempenho comparado aos referenciais internacionais. </span></p>\r\n', '01/10/2012', NULL, '02/10/2012', 1, 'S'),
(3, 1, 1, 4, 'Biomedicina', '<p>\r\n	Hoje estamos divulgando mais um artigo para que os nossos leitores possam ter um conhecimento do que de fato envolve os estudos da <span style="font-size:16px;"><strong>BIOMEDICINA</strong></span>. Quem est&aacute; nos nossos bastidores &eacute; o Dr. Weidman Ferreira, quem explicar&aacute; com todos os detalhes.</p>\r\n', NULL, NULL, NULL, NULL, 'S'),
(4, 1, 1, 3, 'Medicina Nuclear', '<p>\r\n	Post &eacute; uma palavra em ingl&ecirc;s que significa correio, p&aacute;gina, posto, fun&ccedil;&atilde;o, etc, tamb&eacute;m &eacute; utilizada para designar uma mensagem que foi enviada para um grupo de discuss&atilde;o ou para uma lista de e-mails. No &#39;mundo dos blogs&#39;, um post &eacute; uma mensagem colocada no blog e postar &eacute; enviar uma mensagem para o blog.</p>\r\n<p>\r\n	Post &eacute; uma palavra em ingl&ecirc;s que significa correio, p&aacute;gina, posto, fun&ccedil;&atilde;o, etc, tamb&eacute;m &eacute; utilizada para designar uma mensagem que foi enviada para um grupo de discuss&atilde;o ou para uma lista de e-mails. No &#39;mundo dos blogs&#39;, um post &eacute; uma mensagem colocada no blog e postar &eacute; enviar uma mensagem para o blog.</p>\r\n', NULL, NULL, NULL, NULL, 'S'),
(5, 1, 1, 4, 'PrÃ³tese', '<p style="text-align: justify;">\r\n	Post &eacute; uma palavra em ingl&ecirc;s que significa correio, p&aacute;gina, posto, fun&ccedil;&atilde;o, etc, tamb&eacute;m &eacute; utilizada para designar uma mensagem que foi enviada para um grupo de discuss&atilde;o ou para uma lista de e-mails. No &#39;mundo dos blogs&#39;, um post &eacute; uma mensagem colocada no blog e postar &eacute; enviar uma mensagem para o blog.</p>\r\n<p style="text-align: justify;">\r\n	Post &eacute; uma palavra em ingl&ecirc;s que significa correio, p&aacute;gina, posto, fun&ccedil;&atilde;o, etc, tamb&eacute;m &eacute; utilizada para designar uma mensagem que foi enviada para um grupo de discuss&atilde;o ou para uma lista de e-mails. No &#39;mundo dos blogs&#39;, um post &eacute; uma mensagem colocada no blog e postar &eacute; enviar uma mensagem para o blog.</p>\r\n<p style="text-align: justify;">\r\n	Post &eacute; uma palavra em ingl&ecirc;s que significa correio, p&aacute;gina, posto, fun&ccedil;&atilde;o, etc, tamb&eacute;m &eacute; utilizada para designar uma mensagem que foi enviada para um grupo de discuss&atilde;o ou para uma lista de e-mails. No &#39;mundo dos blogs&#39;, um post &eacute; uma mensagem colocada no blog e postar &eacute; enviar uma mensagem para o blog.</p>\r\n', NULL, NULL, NULL, NULL, 'S'),
(14, 1, 1, 1, 'Sistema de Biblioteca', '<p>\r\n	O sistema de bilbioteca faraeraf bdfjaghsdjfhajs ndkfjahsdkljfhasd kdjakfsdf fsdsd</p>\r\n', '01/10/2012', 1, '', 1, 'S'),
(15, 1, 4, 2, 'tezte', '<p>\r\n	texfdscdfdfd</p>\r\n', NULL, 1, NULL, NULL, 'N'),
(21, 1, 1, 1, 'teste', '<p>\r\n	tesett eef efefefc</p>\r\n', '02/10/2012', 1, NULL, NULL, 'S');

-- --------------------------------------------------------

--
-- Estrutura da tabela `renovar_item`
--

CREATE TABLE IF NOT EXISTS `renovar_item` (
  `idRenovacao` int(11) NOT NULL AUTO_INCREMENT,
  `idEmprestimo` int(11) NOT NULL,
  `dataRenovacao` varchar(10) NOT NULL,
  `horaRenovacao` varchar(10) NOT NULL,
  PRIMARY KEY (`idRenovacao`),
  KEY `idEmprestimo` (`idEmprestimo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `reserva_item`
--

CREATE TABLE IF NOT EXISTS `reserva_item` (
  `idReserva` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuarios` int(10) unsigned NOT NULL,
  `idItem` int(11) NOT NULL,
  `data_reserva` varchar(10) NOT NULL,
  `Hora_reserva` varchar(10) NOT NULL,
  `dataLimite` varchar(12) NOT NULL,
  `horaLimite` varchar(8) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`idReserva`),
  KEY `idUsuarios` (`idUsuarios`),
  KEY `idItem` (`idItem`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Extraindo dados da tabela `reserva_item`
--

INSERT INTO `reserva_item` (`idReserva`, `idUsuarios`, `idItem`, `data_reserva`, `Hora_reserva`, `dataLimite`, `horaLimite`, `status`) VALUES
(6, 2, 1, '31/10/2012', '231735', '01112012', '231735', 0),
(7, 2, 2, '02/11/2012', '205153', '02112012', '205753', 0),
(8, 2, 10, '02/11/2012', '205730', '03112012', '205730', 0),
(9, 2, 1, '02/11/2012', '213431', '03112012', '213431', 0),
(10, 2, 8, '02/11/2012', '213437', '03112012', '213437', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `segmento`
--

CREATE TABLE IF NOT EXISTS `segmento` (
  `idSegmento` int(11) NOT NULL AUTO_INCREMENT,
  `nomeSegmento` varchar(200) NOT NULL,
  `idExclusao` char(1) NOT NULL,
  `cdUser` varchar(50) NOT NULL,
  `dtUser` varchar(10) NOT NULL,
  `hmUser` varchar(10) NOT NULL,
  `cdUserA` varchar(50) NOT NULL,
  `dtUserA` varchar(10) NOT NULL,
  `hmUserA` varchar(10) NOT NULL,
  `cdUserE` varchar(50) NOT NULL,
  `dtUserE` varchar(10) NOT NULL,
  `hmUserE` varchar(10) NOT NULL,
  PRIMARY KEY (`idSegmento`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `segmento`
--

INSERT INTO `segmento` (`idSegmento`, `nomeSegmento`, `idExclusao`, `cdUser`, `dtUser`, `hmUser`, `cdUserA`, `dtUserA`, `hmUserA`, `cdUserE`, `dtUserE`, `hmUserE`) VALUES
(1, 'Medicina', '', 'Ricardo', '23072012', '220814', '', '', '', '', '', ''),
(2, 'Informatica', '', 'Ricardo', '23072012', '221001', '', '', '', '', '', ''),
(3, 'FisÃ­ca', '', 'Ricardo', '06082012', '223959', '', '20/09/2012', '225216', '', '', ''),
(4, 'teste', '', '', '', '', '', '', '', '', '', ''),
(5, 'teste 2', '', '1', '20/09/2012', '225934', '', '', '', '', '', ''),
(6, 'teste 3', '', '1', '20/09/2012', '230825', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `status_registro`
--

CREATE TABLE IF NOT EXISTS `status_registro` (
  `idstatus_registro` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) DEFAULT NULL,
  `datainclusao` timestamp NULL DEFAULT NULL,
  `userinclusao` int(10) unsigned DEFAULT NULL,
  `dataalteracao` timestamp NULL DEFAULT NULL,
  `useralteracao` int(10) unsigned DEFAULT NULL,
  `ativo` char(1) DEFAULT 'S',
  PRIMARY KEY (`idstatus_registro`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `status_registro`
--

INSERT INTO `status_registro` (`idstatus_registro`, `nome`, `datainclusao`, `userinclusao`, `dataalteracao`, `useralteracao`, `ativo`) VALUES
(1, 'Publicado', '2012-04-20 02:26:31', NULL, '2012-04-20 02:26:31', NULL, 'S'),
(2, 'Rascunho', '2012-04-20 02:28:16', NULL, '2012-04-20 02:28:16', NULL, 'S'),
(3, 'Revisao Pendente', '2012-04-20 02:28:36', NULL, '2012-04-20 02:28:36', NULL, 'S'),
(4, 'Excluido', '2012-05-06 05:29:53', NULL, '2012-05-06 05:29:53', NULL, 'S');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipoUsuario`
--

CREATE TABLE IF NOT EXISTS `tipoUsuario` (
  `idtipo_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_usuario` varchar(50) NOT NULL,
  `idExclusao` char(1) NOT NULL,
  `cdUser` varchar(40) NOT NULL,
  `dtUser` varchar(10) NOT NULL,
  `hmUser` varchar(10) NOT NULL,
  `cdUserA` varchar(40) NOT NULL,
  `dtUserA` varchar(10) NOT NULL,
  `hmUserA` varchar(10) NOT NULL,
  `cdUserE` varchar(40) NOT NULL,
  `dtUserE` varchar(10) NOT NULL,
  `hmUserE` varchar(10) NOT NULL,
  PRIMARY KEY (`idtipo_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tipoUsuario`
--

INSERT INTO `tipoUsuario` (`idtipo_usuario`, `tipo_usuario`, `idExclusao`, `cdUser`, `dtUser`, `hmUser`, `cdUserA`, `dtUserA`, `hmUserA`, `cdUserE`, `dtUserE`, `hmUserE`) VALUES
(1, 'Bibliotecario', '', '1', '23/08/2012', '160423', '1', '20/09/2012', '234231', '', '', ''),
(2, 'Atendente', '', '', '', '', '', '', '', '', '', ''),
(3, 'Professor', '', '', '', '', '', '', '', '', '', ''),
(4, 'Aluno', '', '', '', '', '1', '12/10/2012', '184811', '', '', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `idusuarios` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipo_usuario` int(11) NOT NULL,
  `perfis_idperfis` int(10) unsigned NOT NULL,
  `nome` varchar(60) DEFAULT NULL,
  `endereco` varchar(100) NOT NULL,
  `telFixo` varchar(10) NOT NULL,
  `celular` varchar(10) NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  `matricula` int(15) unsigned NOT NULL,
  `username` varchar(60) DEFAULT NULL,
  `senha` varchar(100) DEFAULT NULL,
  `idExclusao` char(1) NOT NULL,
  `cdUser` varchar(50) NOT NULL,
  `dtUser` varchar(15) DEFAULT NULL,
  `hmUser` varchar(15) DEFAULT NULL,
  `cdUserA` varchar(50) DEFAULT NULL,
  `dtUserA` varchar(15) NOT NULL,
  `hmUserA` varchar(15) NOT NULL,
  `cdUserE` varchar(50) NOT NULL,
  `dtUserE` varchar(15) NOT NULL,
  `hmUserE` varchar(15) NOT NULL,
  PRIMARY KEY (`idusuarios`),
  KEY `usuarios_FKIndex1` (`perfis_idperfis`),
  KEY `usuarios_FKIndex2` (`tipo_usuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`idusuarios`, `tipo_usuario`, `perfis_idperfis`, `nome`, `endereco`, `telFixo`, `celular`, `email`, `matricula`, `username`, `senha`, `idExclusao`, `cdUser`, `dtUser`, `hmUser`, `cdUserA`, `dtUserA`, `hmUserA`, `cdUserE`, `dtUserE`, `hmUserE`) VALUES
(1, 1, 1, 'Administrador', 'administrador do sistema', '9999-9999', '9999-9999', 'admin@admin.com', 999999999, 'admin', 'admin', '', '1', '11/09/2012', '084523', '', '', '', '', '', ''),
(2, 3, 2, 'Usuario da silva', 'Usuario do sistema', '9999-9999', '9999-9999', 'usuario@usuario.com', 0, 'usuario', 'usuario', '', '1', '174545', '210437', '2', '02/11/2012', '231742', '', '', ''),
(3, 4, 2, 'Ana Beatriz Alves', 'qqqqqqqqqqqqqqq', '22223333', '22225555', 'teste@teste.com', 123456, 'beatriz', 'beatriz', '', '1', '111718', NULL, NULL, '', '', '', '', '');

--
-- Restrições para as tabelas dumpadas
--

--
-- Restrições para a tabela `devolucao_item`
--
ALTER TABLE `devolucao_item`
  ADD CONSTRAINT `devolucao_item_ibfk_1` FOREIGN KEY (`idEmprestimo`) REFERENCES `emprestimo` (`idEmprestimo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `emprestimo`
--
ALTER TABLE `emprestimo`
  ADD CONSTRAINT `emprestimo_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idusuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `emprestimo_ibfk_3` FOREIGN KEY (`idItem`) REFERENCES `item` (`idItem`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`idAutor`) REFERENCES `autor` (`idAutor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `item_ibfk_2` FOREIGN KEY (`idEditora`) REFERENCES `editora` (`idEditora`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `item_ibfk_3` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `item_ibfk_4` FOREIGN KEY (`idSegmento`) REFERENCES `segmento` (`idSegmento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `multa`
--
ALTER TABLE `multa`
  ADD CONSTRAINT `multa_ibfk_1` FOREIGN KEY (`idDevolucao`) REFERENCES `devolucao_item` (`idDevolucao`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `paginas`
--
ALTER TABLE `paginas`
  ADD CONSTRAINT `paginas_ibfk_1` FOREIGN KEY (`status_registro_idstatus_registro`) REFERENCES `status_registro` (`idstatus_registro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `paginas_ibfk_2` FOREIGN KEY (`usuarios_idusuarios`) REFERENCES `usuarios` (`idusuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`categorias_idcategorias`) REFERENCES `categorias` (`idcategorias`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`status_registro_idstatus_registro`) REFERENCES `status_registro` (`idstatus_registro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `posts_ibfk_3` FOREIGN KEY (`usuarios_idusuarios`) REFERENCES `usuarios` (`idusuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `renovar_item`
--
ALTER TABLE `renovar_item`
  ADD CONSTRAINT `renovar_item_ibfk_1` FOREIGN KEY (`idEmprestimo`) REFERENCES `emprestimo` (`idEmprestimo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `reserva_item`
--
ALTER TABLE `reserva_item`
  ADD CONSTRAINT `reserva_item_ibfk_2` FOREIGN KEY (`idUsuarios`) REFERENCES `usuarios` (`idusuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `reserva_item_ibfk_3` FOREIGN KEY (`idItem`) REFERENCES `item` (`idItem`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`perfis_idperfis`) REFERENCES `perfis` (`idperfis`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`tipo_usuario`) REFERENCES `tipoUsuario` (`idTipo_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
