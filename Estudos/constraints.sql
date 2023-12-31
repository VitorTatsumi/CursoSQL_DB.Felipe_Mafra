--CRIA UM BANCO DE DADOS	
USE EMPRESA

--CRIA A TABELA ALUNOS 
CREATE TABLE ALUNO (
	IDALUNO INT PRIMARY KEY IDENTITY (1, 1),
	NOME VARCHAR (30) NOT NULL,
	SEXO CHAR (1) NOT NULL,
	NASCIMENTO DATE NOT NULL,
	EMAIL VARCHAR (50) UNIQUE
)
GO

--ALTERA AS CONSTRAINTS (REGRAS)
ALTER TABLE ALUNO
ADD CONSTRAINT CK_SEXO CHECK (SEXO IN('M', 'F'))

--CRIANDO TABELA ENDERECO
/*

AUTO INCREMENTO COM IDENTITY FUNCIONA DA SEGUINTE MANEIRA:
IDENTITY(VALOR INICIAL, PASSO)

O CHECK CRIA UMA CONSTRAINT PARA A CHECAGEM DOS VALORES INSERIDOS DENTRO DO CAMPO
PODE SE PENSAR DE DUAS FORMAS: O CHECK FAZ A CHECAGEM DOS VALORES DENTRO DO CAMPO INSERIDO, SE NÃO FOR IGUAL ÀS OPÇÕES. OU TAMBÉM, PODE SE PENSAR QUE O CHECK CRIA UMA 'CHECKBOX' QUE SOMENTE RECEBERÁ OS CAMPOS LISTADOS

*/
CREATE TABLE ENDERECO(
	IDENDERECO INT PRIMARY KEY IDENTITY (100, 10),
	BAIRRO VARCHAR(30),
	UF CHAR(2) NOT NULL, 
	CHECK (UF IN('SP', 'RJ', 'MG')),
	ID_ALUNO INT UNIQUE
)
GO

--CRIANDO UMA FK E INSERINDO NA TABELA ENDERECO
ALTER TABLE ENDERECO
ADD CONSTRAINT FK_ENDERECO_ALUNO
FOREIGN KEY(ID_ALUNO) 
REFERENCES ALUNO(IDALUNO)
GO

--INSERÇÃO DE VALORES NA TABELA ALUNO
INSERT INTO ALUNO VALUES('ANDRE','M','1981/12/09','ANDRE@IG.COM')
INSERT INTO ALUNO VALUES('ANA','F','1978/03/09','ANA@IG.COM')
INSERT INTO ALUNO VALUES('RUI','M','1951/07/09','RUI@IG.COM')
INSERT INTO ALUNO VALUES('JOAO','M','2002/11/09','JOAO@IG.COM')
GO
--INSERÇÃO DE VALORES NA TABELA ENDERECO
INSERT INTO ENDERECO VALUES('FLAMENGO','RJ',1)
INSERT INTO ENDERECO VALUES('MORUMBI','SP',2)
INSERT INTO ENDERECO VALUES('CENTRO','MG',3)
INSERT INTO ENDERECO VALUES('CENTRO','SP',4)
GO
--INSERÇÃO DE VALORES NA TABELA TELEFONE
INSERT INTO TELEFONE VALUES('CEL','7899889',1)
INSERT INTO TELEFONE VALUES('RES','4325444',1)
INSERT INTO TELEFONE VALUES('COM','4354354',2)
INSERT INTO TELEFONE VALUES('CEL','2344556',2)
GO
