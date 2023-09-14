CREATE DATABASE LIVRARIA;

CREATE TABLE LIVROS(
	LIVRO_NOME VARCHAR(100),
	NOME_AUTOR VARCHAR(100),
	SEXO_AUTOR CHAR(1),
	PAGINAS_LIVRO INT(5),
	EDITORA_NOME VARCHAR(30),
	LIVRO_PRECO FLOAT(10,2),
	ESTADO_AUTOR CHAR(2),
	ANO_LANC INT(4)
);

INSERT INTO LIVROS 
	VALUES('Cavaleiro Real','Ana Claudia','F',465,'Atlas',49.9,'RJ',2009);
INSERT INTO LIVROS 
	VALUES('SQL para leigos','João Nunes','M',450,'Addison',98,'SP',2018);
INSERT INTO LIVROS 
	VALUES('Receitas Caseiras','Celia Tavares','F',210,'Atlas',45,'RJ',2008);
INSERT INTO LIVROS 
	VALUES('Pessoas Efetivas','Eduardo Santos','M',390,'Beta',78,'RJ',2018);
INSERT INTO LIVROS 
	VALUES('Habitos Saudáveis','Eduardo Santos','M',630,'Beta',150,'RJ',2019);
INSERT INTO LIVROS 
	VALUES('A Casa Marrom','Hermes Macedo','M',250,'Bubba',60,'MG',2016);
INSERT INTO LIVROS 
	VALUES('Estacio Querido','Geraldo Francisco','M',310,'Insignia',100,'ES',2015);
INSERT INTO LIVROS 
	VALUES('Pra sempre amigas','Leda Silva','F',510,'Insignia',78,'ES',2011);
INSERT INTO LIVROS 
	VALUES('Copas Inesqueciveis','Marco Alcantara','M',200,'Larson',130,'RS',2018);
INSERT INTO LIVROS 
	VALUES('O poder da mente','Clara Mafra','F',120,'Continental',56,'SP',2017);

--Trazer todos os dados
SELECT * 
FROM LIVROS;

--Trazer o nome do livro e o nome da Editora
SELECT LIVRO_NOME, EDITORA_NOME 
FROM LIVROS;

--Trazer o nome do livro e a UF dos livros publicados po autores do sexo masculino
SELECT LIVRO_NOME, ESTADO_AUTOR 
FROM LIVROS 
WHERE SEXO_AUTOR = 'M';

--Trazer o nome do livro e o número de páginas dos livros publicados por autores do sexo feminino
SELECT LIVRO_NOME, PAGINAS_LIVRO 
FROM LIVROS 
WHERE SEXO_AUTOR = 'F';

--Trazer os valores dos ivros das Editoras de São Paulo
SELECT LIVRO_NOME, LIVRO_PRECO 
FROM LIVROS 
WHERE ESTADO_AUTOR = 'SP';

--Trazer os dados dos autores do sexo masculino que tiveram livros publicados por São Paulo ou Rio de Janeiro
SELECT NOME_AUTOR, SEXO_AUTOR 
FROM LIVROS 
WHERE SEXO_AUTOR = 'M' 
	AND (ESTADO_AUTOR = 'SP' 
	OR ESTADO_AUTOR = 'RJ');
