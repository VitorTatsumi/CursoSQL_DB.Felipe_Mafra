--CRIAR UMA QUERY PARA PROJETAR A DATA DE NASCIMENTO DOS AUNOS FORMATADA PARA O PADRÃO BRASILEIRO
SELECT  NOME, 
		CAST(DAY(NASCIMENTO) AS VARCHAR)+ '/' + 
		CAST(MONTH(NASCIMENTO) AS VARCHAR)  + '/' +
		CAST(YEAR(NASCIMENTO) AS VARCHAR)
FROM ALUNO
