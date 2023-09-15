--CRIAÇÃO DA TABELA DE CLIENTES
CREATE TABLE CLIENTE(
	IDCLIENTE INT IDENTITY (1, 1) PRIMARY KEY,
	NOME VARCHAR(30) NOT NULL, 
	SEXO CHAR(1) NOT NULL,
	EMAIL VARCHAR(50) UNIQUE,
	CPF VARCHAR (15) UNIQUE
);

-- CRIAÇÃO DA TABELA DE ENDEREÇOS
CREATE TABLE ENDERECO (
	IDENDERECO INT IDENTITY (1, 1) PRIMARY KEY,
	RUA VARCHAR(30) NOT NULL,
	BAIRRO VARCHAR(30) NOT NULL,
	CIDADE VARCHAR(30) NOT NULL,
	ESTADO CHAR(2) NOT NULL,
	ID_CLIENTE INT UNIQUE, 
	FOREIGN KEY (ID_CLIENTE) 
	REFERENCES CLIENTE(IDCLIENTE)
);

--CRIAÇÃO DA TABELA DE TELEFONES
CREATE TABLE TELEFONE (
	IDTELEFONE INT IDENTITY (1, 1) PRIMARY KEY,
	TIPO CHAR (3) NOT NULL,
	NUMERO VARCHAR(10) NOT NULL,
	ID_CLIENTE INT,
	FOREIGN KEY(ID_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)
);

--INSERÇÃO DE DADOS DE CLIENTES NA TABELA
INSERT INTO CLIENTE VALUES('JOAO','M','JOAOA@IG.COM','76567587887');
INSERT INTO CLIENTE VALUES('CARLOS','M','CARLOSA@IG.COM','5464553466');
INSERT INTO CLIENTE VALUES('ANA','F','ANA@IG.COM','456545678');
INSERT INTO CLIENTE VALUES('CLARA','F','CLARA@CLARA.COM.BR','5687766856');
INSERT INTO CLIENTE VALUES('JORGE','M','JORGE@IG.COM','8756547688');
INSERT INTO CLIENTE VALUES('CELIA','M','JCELIA@IG.COM','5767876889');
INSERT INTO CLIENTE VALUES('PAULA','M','PAULA.PAULA@BING.COM.BR','77437493');
INSERT INTO CLIENTE VALUES('FLAVIO','M','FLAVIO@IG.COM','4657765');
INSERT INTO CLIENTE VALUES('ANDRE','M','ANDRE@GLOBO.COM','7687567');
INSERT INTO CLIENTE VALUES('GIOVANA','F','GIO.ARR@SDN.COM.BR','0876655');
INSERT INTO CLIENTE VALUES('KARLA','M','KARLA@GMAIL.COM','545676778');
INSERT INTO CLIENTE VALUES('DANIELE','M','DANIELE@GMAIL.COM','43536789');
INSERT INTO CLIENTE VALUES('LORENA','M','SARUE@BOL.COM.BR','774557887');
INSERT INTO CLIENTE VALUES('EDUARDO','M','EDU@COM.BR','54376457');
INSERT INTO CLIENTE VALUES('ANTONIO','F','ANTONIO@IG.COM','12436767');
INSERT INTO CLIENTE VALUES('ANTONIO','M','ANTONIO@UOL.COM','3423565');
INSERT INTO CLIENTE VALUES('ELAINE','M','ELAINE@GLOBO.COM','32567763');
INSERT INTO CLIENTE VALUES('CARMEM','M','CARMEM@IG.COM','787832213');
INSERT INTO CLIENTE VALUES('ADRIANA','F','ADRIANA@GMAIL.COM','88556942');
INSERT INTO CLIENTE VALUES('JOICE','F','JOICE@GMAIL.COM','55412256');

--INSERÇÃO DE DADOS DE ENDEREÇO DE CLIENTES NA TABELA
INSERT INTO ENDERECO VALUES('RUA ANTONIO SA','CENTRO','B. HORIZONTE','MG',4);
INSERT INTO ENDERECO VALUES('RUA CAPITAO HERMES','CENTRO','RIO DE JANEIRO','RJ',1);
INSERT INTO ENDERECO VALUES('RUA PRES VARGAS','JARDINS','SAO PAULO','SP',3);
INSERT INTO ENDERECO VALUES('RUA ALFANDEGA','ESTACIO','RIO DE JANEIRO','RJ',2);
INSERT INTO ENDERECO VALUES('RUA DO OUVIDOR','FLAMENGO','RIO DE JANEIRO','RJ',6);
INSERT INTO ENDERECO VALUES('RUA URUGUAIANA','CENTRO','VITORIA','ES',5);
INSERT INTO ENDERECO VALUES('RUA GUEDES','CASCADURA','B. HORIZONTE','MG',9);
INSERT INTO ENDERECO VALUES('RUA MAIA LACERDA','ESTACIO','RIO DE JANEIRO','RJ',10);
INSERT INTO ENDERECO VALUES('RUA VISCONDESSA','CENTRO','RIO DE JANEIRO','RJ',11);
INSERT INTO ENDERECO VALUES('RUA NELSON MANDELA','COPACABANA','RIO DE JANEIRO','RJ',12);
INSERT INTO ENDERECO VALUES('RUA ARAUJO LIMA','CENTRO','VITORIA','ES',13);
INSERT INTO ENDERECO VALUES('RUA CASTRO ALVES','LEBLON','RIO DE JANEIRO','RJ',14);
INSERT INTO ENDERECO VALUES('AV CAPITAO ANTUNES','CENTRO','CURITIBA','PR',15);
INSERT INTO ENDERECO VALUES('AV CARLOS BARROSO','JARDINS','SAO PAULO','SP',16);
INSERT INTO ENDERECO VALUES('ALAMEDA SAMPAIO','BOM RETIRO','CURITIBA','PR',17);
INSERT INTO ENDERECO VALUES('RUA DA LAPA','LAPA','SAO PAULO','SP',18);
INSERT INTO ENDERECO VALUES('RUA GERONIMO','CENTRO','RIO DE JANEIRO','RJ',19);
INSERT INTO ENDERECO VALUES('RUA GOMES FREIRE','CENTRO','RIO DE JANEIRO','RJ',20);
INSERT INTO ENDERECO VALUES('RUA GOMES FREIRE','CENTRO','RIO DE JANEIRO','RJ',21);

--INSERÇÃO DE DADOS DE TELEFONE DOS CLIENTES DA TABELA
INSERT INTO TELEFONE VALUES('CEL','78458743',5);
INSERT INTO TELEFONE VALUES('RES','56576876',5);
INSERT INTO TELEFONE VALUES('CEL','87866896',1);
INSERT INTO TELEFONE VALUES('COM','54768899',2);
INSERT INTO TELEFONE VALUES('RES','99667587',1);
INSERT INTO TELEFONE VALUES('CEL','78989765',3);
INSERT INTO TELEFONE VALUES('CEL','99766676',3);
INSERT INTO TELEFONE VALUES('COM','66687899',1);
INSERT INTO TELEFONE VALUES('RES','89986668',5);
INSERT INTO TELEFONE VALUES('CEL','88687909',2);
INSERT INTO TELEFONE VALUES('RES','68976565',9);
INSERT INTO TELEFONE VALUES('CEL','99656675',9);
INSERT INTO TELEFONE VALUES('CEL','33567765',11);
INSERT INTO TELEFONE VALUES('CEL','88668786',11);
INSERT INTO TELEFONE VALUES('COM','55689654',11);
INSERT INTO TELEFONE VALUES('COM','88687979',12);
INSERT INTO TELEFONE VALUES('COM','88965676',13);
INSERT INTO TELEFONE VALUES('CEL','89966809',15);
INSERT INTO TELEFONE VALUES('COM','88679978',16);
INSERT INTO TELEFONE VALUES('CEL','99655768',17);
INSERT INTO TELEFONE VALUES('RES','89955665',18);
INSERT INTO TELEFONE VALUES('RES','77455786',19);
INSERT INTO TELEFONE VALUES('RES','89766554',19);
INSERT INTO TELEFONE VALUES('RES','77755785',20);
INSERT INTO TELEFONE VALUES('COM','44522578',20);


-- RELATÓRIO GERAL DE TODOS OS CLIENTES

SELECT * 
FROM CLIENTE AS C
INNER JOIN ENDERECO AS E
ON E.ID_CLIENTE = C.IDCLIENTE
INNER JOIN TELEFONE AS T
ON T.ID_CLIENTE = C.IDCLIENTE;

-- RELATÓRIO DE HOMENS

SELECT *
FROM CLIENTE AS C
INNER JOIN ENDERECO AS E
ON E.ID_CLIENTE = C.IDCLIENTE
INNER JOIN TELEFONE AS T
ON T.ID_CLIENTE = C.IDCLIENTE
WHERE SEXO = 'M';

-- RELATÓRIO DE MULHERES

SELECT * 
FROM CLIENTE AS C
	INNER JOIN TELEFONE AS T
ON T.ID_CLIENTE = C.IDCLIENTE
	INNER JOIN ENDERECO AS E
ON E.ID_CLIENTE = C.IDCLIENTE
WHERE SEXO = 'F';

-- QUANTIDADE DE HOMENS E MULHERES

SELECT SEXO, COUNT(*) AS QTDSEXO
FROM CLIENTE
GROUP BY SEXO;

-- IDS E EMAIL DAS MULHERES QUE MOREM NO CENTRO DO RIO DE JANEIRO E NAO TENHAM CELULAR

-- 9 MORADORAS DO CENTRO
SELECT BAIRRO, COUNT(*)
FROM ENDERECO
WHERE BAIRRO = 'CENTRO'
GROUP BY BAIRRO;

-- 12 MULHERES
SELECT SEXO, COUNT(*)
FROM CLIENTE
WHERE SEXO = 'F'
GROUP BY SEXO;

-- 15 PESSOAS SEM CELULAR
SELECT TIPO, COUNT(*)
FROM TELEFONE
WHERE TIPO != 'CEL'
GROUP BY TIPO;

--QUERY
SELECT IDCLIENTE, C.NOME, C.EMAIL, BAIRRO, CIDADE, T.TIPO, C.SEXO
FROM CLIENTE AS C
INNER JOIN ENDERECO AS E
ON E.ID_CLIENTE = C.IDCLIENTE
INNER JOIN TELEFONE AS T
ON T.ID_CLIENTE = C.IDCLIENTE
WHERE SEXO = 'F' 
AND	BAIRRO = 'CENTRO'
AND CIDADE = 'RIO DE JANEIRO'
AND	(TIPO = 'RES' OR TIPO = 'COM');

--PARA UMA CAMPANHA DE MARKETING O SETOR SOLICITOU UM RELATORIO COM O NOME EMAIL E TELEFONE CELULAR DOS CLIENTES QUE MORAM NO ESTADO DO RIO DE JANEIRO. VOCE TERÁ QUE PASSAR A QUERY PARA GERAR O RELATÓRIO PARA O PROGRAMADOR.

-- PARA UMA CAMPANHA DE PRODUTOS DE BELEZA, O COMERCIAL SOLICITOU UM RELATÓRIO COM O NOME, EMAIL E TELEFONE CELULAR DAS MULHERES QUE MORAM NO ESTADO DE SÃO PAULO. VOCÊ TERPA QUE PASSAR A QUERY PARA GERAR O RELATÓRIO PARA O PROGRAMADOR.
