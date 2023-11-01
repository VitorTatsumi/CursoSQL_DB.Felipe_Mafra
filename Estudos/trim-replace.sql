--A Função TRIM tem como objetivo remover os espaços vazios ou caracteres específicos, limitando-se a fazer isso somente no INÍCIO, FINAL, ou AMBOS do registro em questão. A Função não remove os espaços vazios ou caracteres selecionados do meio de uma String.
--A Função pode conter no seu início um dos seguintes parâmetros: LEADING, TRAILING ou BOTH. LEADING para que seja removido os caracteres somente do início, TRAILING do fim, e BOTH de ambos.

--Remove o caractere '!' do final.
SELECT TRIM(TRAILING '!' FROM '!AAAAA!')
--Remove os caracteres '.' do início 
SELECT TRIM(LEADING '.' FROM '...OI')
--Remove o caractere 'A' tanto do início quanto do final do registro retornado no campo A1_NOME
SELECT TRIM (BOTH 'A' FROM A1_NOME) FROM SA1020

--A Função REPLACE faz a substituição de um caractere informado por outro no campo selecionado

--Substitui todos os '.' por '-----' dos registros de A1_NOME
SELECT REPLACE(A1_NOME, '.', '-----') FROM SA1020
