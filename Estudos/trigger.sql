/*
A ESTRUTURA PARA CRIAÇÃO DE UM TRIGGER É A SEGUINTE:

CREATE OR ALTER TRIGGER [NOMEDATRIGGER]
ON [NOMEDATABELA]
FOR [INSERT/DELETE/UPDATE]
AS
BEGIN
	[COMANDOS SQL PARA SEREM ATIVADOS QUANDO O INSERT/UPDATE/DELETE FOR EXECUTADOS]
END
*/

--CRIAÇÃO DA TABELA VENDEDORES PARA TESTE DO TRIGGER
CREATE TABLE VENDEDORES(
	IDVENDEDOR INT IDENTITY(1, 1) PRIMARY KEY,
	NOME VARCHAR (30),
	SEXO CHAR (1),
	JANEIRO FLOAT,
	FEVEREIRO FLOAT,
	MARCO FLOAT
)

--ALIMENTANDO A TABELA COM ALGUNS VALORES
INSERT INTO VENDEDORES VALUES('CARLOS','M',76234.78,88346.87,5756.90);
INSERT INTO VENDEDORES VALUES('MARIA','F',5865.78,6768.87,4467.90);
INSERT INTO VENDEDORES VALUES('ANTONIO','M',78769.78,6685.87,6664.90);
INSERT INTO VENDEDORES VALUES('CLARA','F',5779.78,446886.87,8965.90);
INSERT INTO VENDEDORES VALUES('ANDERSON','M',676545.78,77544.87,578665.90);
INSERT INTO VENDEDORES VALUES('IVONE','F',57789.78,44774.87,68665.90);
INSERT INTO VENDEDORES VALUES('JOAO','M',4785.78,66478.87,6887.90);
INSERT INTO VENDEDORES VALUES('CELIA','F',89667.78,57654.87,5755.90);

--CRIAÇÃO DA TABELA DE METAS PARA TESTE DO TRIGGER
CREATE TABLE METAS(
	IDMETAS INT IDENTITY (1, 1) PRIMARY KEY,
	VALOR INT,
);

--COMANDO PARA CRIAR OU ALTERAR UM TRIGGER
CREATE OR ALTER TRIGGER TRIGGER_TESTE
ON VENDEDORES
FOR INSERT
AS 
BEGIN
	DECLARE --COMANDO PARA DECLARAR UMA VARIÁVEL
		@META INT

	SELECT @META = JANEIRO + FEVEREIRO + MARCO/3 
	FROM VENDEDORES

	INSERT INTO METAS VALUES (@META)
END

--INSERINDO UM VALOR NA TABELA VENDEDORES PARA ATIVR O TRIGGER
INSERT INTO VENDEDORES VALUES ('VITOR', 'M', 999999.99, 999999.99, 999999.99);

--VISUALIZANDO O RESULTADO DO TRIGGER
SELECT * FROM METAS