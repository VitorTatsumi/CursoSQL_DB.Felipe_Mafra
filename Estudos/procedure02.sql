--STORAGE PROCEDURES

--CRIANDO TABELA PESSOA
CREATE TABLE PESSOA(
	IDPESSOA INT PRIMARY KEY IDENTITY,
	NOME VARCHAR(30) NOT NULL,
	SEXO CHAR(1) NOT NULL CHECK (SEXO IN('M','F')), --ENUM
	MASCIMENTO DATE NOT NULL
)
GO

--CRIANDO TABELA TELEFONE
CREATE TABLE TELEFONE(
	IDTELEFONE INT NOT NULL IDENTITY,
	TIPO CHAR(3) NOT NULL CHECK ( TIPO IN('CEL','COM')),
	NUMERO CHAR(10) NOT NULL,
	ID_PESSOA INT
)
GO

--ADICIONANDO CONSTRAINTS À TABELA TELEFONE
ALTER TABLE TELEFONE ADD CONSTRAINT FK_TELEFONE_PESSOA
FOREIGN KEY(ID_PESSOA) REFERENCES PESSOA(IDPESSOA)
ON DELETE CASCADE
GO

--INSERINDO DADOS NA TABELA PESSOA
INSERT INTO PESSOA VALUES('ANTONIO','M','1981-02-13')
INSERT INTO PESSOA VALUES('DANIEL','M','1985-03-18')
INSERT INTO PESSOA VALUES('CLEIDE','F','1979-10-13')
INSERT INTO PESSOA VALUES('MAFRA','M','1981-02-13')

--INSERINDO DADOS NA TABELA TELEFONE
INSERT INTO TELEFONE VALUES('CEL','9879008',1)
INSERT INTO TELEFONE VALUES('COM','8757909',1)
INSERT INTO TELEFONE VALUES('CEL','9875890',2)
INSERT INTO TELEFONE VALUES('CEL','9347689',2)
INSERT INTO TELEFONE VALUES('COM','2998689',3)
INSERT INTO TELEFONE VALUES('COM','2098978',2)
INSERT INTO TELEFONE VALUES('CEL','9008679',3)
GO

/*
VARIÁVEIS COM @ SÃO VARIÁVEIS 'LOCAIS' ONDE SOMENTE QUEM ESTÁ LOGADO NA SESSÃO CONSEGUIRÁ VISUALIZAR. AS VARIÁVEIS COM @@ SÃO VARIÁVEIS 'GLOBAIS' E TODOS OS UTILIZADORES DO BANCO PODEM VISUALIZAR.
*/

--GUARDA O ULTIMO IDENTITY GUARDADO NA SEÇÃO
SELECT @@IDENTITY
GO

/*
CRIANDO UMA PROCEDURE CHAMADA TELEFONES QUE RETONRA O NOME, NUMERO DA TABELA PESSOA E UNE COM A TABELA TELEFONE OS RESPECTIVOS USUÁRIOS QUE ESTEJAM DE ACORDO COM O PARÂMETRO PASSADO ATRAVÉS DA VARIÁVEL @TIPO
*/
CREATE OR ALTER PROC TELEFONES
(@TIPO CHAR (3))
AS 
	SELECT NOME, NUMERO
	FROM PESSOA
	INNER JOIN TELEFONE
	ON IDPESSOA = ID_PESSOA
	WHERE TIPO = @TIPO
GO

--COMANDO PARA EXECUTAR A PROCEDURE E PASSAR OS PARÂMETROS
EXEC TELEFONES 'CEL'
GO

EXEC TELEFONES 'COM'
GO

--PROCEDURES COM PARÂMETROS DE SAÍDA

/*
 O PARÂMETRO DE SAÍDA É NECESSÁRIO SER POSTO NA VARIÁVEL @CONTADOR POIS É UM PARÂMETRO DE SAÍDA DE DADOS
*/
CREATE OR ALTER PROCEDURE GETTIPO (@TIPO CHAR (3), @CONTADOR INT OUTPUT)
AS
	SELECT @CONTADOR = COUNT(*)
	FROM TELEFONES
	WHERE TIPO = @TIPO
GO

/*
INICIALMENTE É NECESSARIO DECLARAR UMA VARIÁVEL DE RECEBIMENTO DO VALOR, APÓS ISSO É EXECUTADO O COMANDO CHAMANDO A PROCEDURE E PASSANDO SEUS PARÂMETROS PARA A EXECUÇÃO. A VARIÁVEL @SAIDA TEM O OUTPUT NECESSÁRIO, POIS É UMA VARIAVEL DE SAÍDA
*/
DECLARE @SAIDA INT
EXEC GETTIPO 'CEL', @SAIDA OUTPUT
SELECT @SAIDA
GO

/*
PROCEDURE PARA CADASTRAR DUAS TABELAS COM SOMENTE UM COMANDO DE INSERÇÃO
SÃO CRIADAS VARIÁVEIS PARA CADA CAMPO A SER RECEBIDO DADOS
DENTRO DO BLOCO DE COMANDO É CRIADO UMA VARIÁVEL PARA A FK, ONDE É ARMAZENADA A ULTIMA ENTRADA DE ID E APÓS ISSO É ALIMENTADA A TABELA COM OS DADOS.
*/
CREATE OR ALTER PROCEDURE CADASTRO 
(@NOME VARCHAR(30), @SEXO CHAR(1), @NASCIMENTO DATE, @TIPO CHAR(3), @NUMERO VARCHAR(10))
AS
	DECLARE @FK INT
	INSERT INTO PESSOA VALUES (@NOME, @SEXO, @NASCIMENTO)
	SET @FK = (SELECT IDPESSOA FROM PESSOA WHERE IDPESSOA = @@IDENTITY)
	INSERT INTO TELEFONE VALUES (@TIPO, @NUMERO, @FK)
GO

--COMANDO PARA EXECUTAR A PROCEDURE COM OS PARÂMETROS
EXEC CADASTRO 'VITOR', 'M', '1997-09-12', 'CEL', '954787847'
GO