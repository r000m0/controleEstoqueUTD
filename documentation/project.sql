-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 07/06/2021 às 01:30
-- Versão do servidor: 10.4.18-MariaDB
-- Versão do PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `project`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `categorias`
--

CREATE TABLE `categorias` (
  `codCategoria` int(11) NOT NULL,
  `categoria` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `categorias`
--

INSERT INTO `categorias` (`codCategoria`, `categoria`) VALUES
(1, 'Móveis'),
(2, 'Eletrodomésticos'),
(3, 'Celulares');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cidades`
--

CREATE TABLE `cidades` (
  `codCidade` int(11) NOT NULL,
  `cidade` varchar(255) NOT NULL,
  `cidadeUF` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `cidades`
--

INSERT INTO `cidades` (`codCidade`, `cidade`, `cidadeUF`) VALUES
(2, 'Maracanaú', 'CE'),
(3, 'Salvador', 'BA'),
(4, 'Maceió', 'AL'),
(5, 'João Pessoa', 'PB');

-- --------------------------------------------------------

--
-- Estrutura para tabela `fornecedores`
--

CREATE TABLE `fornecedores` (
  `codFornecedor` int(11) NOT NULL,
  `cidadeCod` int(11) NOT NULL,
  `fornecedor` varchar(255) NOT NULL,
  `fornecedorEndereco` varchar(255) NOT NULL,
  `fornecedorNumero` int(10) NOT NULL,
  `fornecedorBairro` varchar(100) NOT NULL,
  `fornecedorCEP` char(9) NOT NULL,
  `fornecedorContato` varchar(100) NOT NULL,
  `fornecedorCNPJ` char(18) NOT NULL,
  `fornecedorInscricao` varchar(255) NOT NULL,
  `fornecedorTelefone` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `fornecedores`
--

INSERT INTO `fornecedores` (`codFornecedor`, `cidadeCod`, `fornecedor`, `fornecedorEndereco`, `fornecedorNumero`, `fornecedorBairro`, `fornecedorCEP`, `fornecedorContato`, `fornecedorCNPJ`, `fornecedorInscricao`, `fornecedorTelefone`) VALUES
(1, 2, 'Loja lá da esquina', 'Rua Bem Ali', 500, 'Centro', '000000000', 'O Dono', '12345678910', 'Estadual', '8532060000'),
(3, 3, 'Samsung', 'Rua Lá na PQP', 1000, 'Nas Quequé', '123456789', 'Tlêis tigles tlistes', '24247537543', 'Nacional', '41493292');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `codProduto` int(11) NOT NULL,
  `categoriaCod` int(11) NOT NULL,
  `fornecedorCod` int(11) NOT NULL,
  `produtoDescricao` varchar(255) NOT NULL,
  `produtoPeso` double NOT NULL,
  `produtoQtemin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`codProduto`, `categoriaCod`, `fornecedorCod`, `produtoDescricao`, `produtoPeso`, `produtoQtemin`) VALUES
(1, 2, 3, 'Smartphone Galaxy s21', 0.5, 10),
(2, 1, 1, 'Mesa de 4 lugares', 20, 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `usuarioNome` varchar(255) NOT NULL,
  `usuarioEmail` varchar(255) NOT NULL,
  `usuarioCPF` varchar(20) NOT NULL,
  `usuarioSenha` varchar(255) NOT NULL,
  `usuarioCriacao` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `usuarioNome`, `usuarioEmail`, `usuarioCPF`, `usuarioSenha`, `usuarioCriacao`) VALUES
(1, 'Rômulo', 'romulo@email.com', '12345678910', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '2021-06-05 17:10:09'),
(2, 'Danielle', 'dani@ymail.com', '10987654321', '39dfa55283318d31afe5a3ff4a0e3253e2045e43', '2021-06-05 19:45:38'),
(5, 'user', 'user@email.com', '12345678911', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '2021-06-06 23:24:47');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`codCategoria`);

--
-- Índices de tabela `cidades`
--
ALTER TABLE `cidades`
  ADD PRIMARY KEY (`codCidade`);

--
-- Índices de tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  ADD PRIMARY KEY (`codFornecedor`),
  ADD KEY `cidadeCod` (`cidadeCod`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`codProduto`),
  ADD KEY `categoriaCod` (`categoriaCod`),
  ADD KEY `fornecedorCod` (`fornecedorCod`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`),
  ADD UNIQUE KEY `usuarioEmail` (`usuarioEmail`),
  ADD UNIQUE KEY `usuarioCPF` (`usuarioCPF`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `codCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `cidades`
--
ALTER TABLE `cidades`
  MODIFY `codCidade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  MODIFY `codFornecedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `codProduto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `fornecedores`
--
ALTER TABLE `fornecedores`
  ADD CONSTRAINT `fornecedores_ibfk_1` FOREIGN KEY (`cidadeCod`) REFERENCES `cidades` (`codCidade`);

--
-- Restrições para tabelas `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`fornecedorCod`) REFERENCES `fornecedores` (`codFornecedor`),
  ADD CONSTRAINT `produtos_ibfk_2` FOREIGN KEY (`categoriaCod`) REFERENCES `categorias` (`codCategoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
