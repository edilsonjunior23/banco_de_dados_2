-- Buscar nome e o cpf de médicos com menos de 40 anos
-- Ou com especialidade diferente de traumatólogia
select nome, cpf
from medicos
where idade < 40 or especialidade != 'traumologia';

-- Buscar todos os dados das consultas marcadas no periódo da tarde após o dia 19/06/2006
select *
from consultas
where data > '2006-06-19' and hora > '12:00';

-- Buscar o nome e idade dos pacientes que não residem em Florianópolis
select nome, idade
from pacientes
where cidade != 'florianopolis';

-- Buscar a hora das consultas marcadas antes do dia 14/06/2024 e depois do dia 20/12/2024
select hora
from consultas
where data between '2024-06-14' and '2024-12-20';

-- Buscar nome e idade (em meses) dos pacientes
select nome, idade*12
from pacientes;

-- Em quais cidades resindem os funcionários
select distinct cidade
from funcionarios;

-- Qual o menor e maior sálario dos funcionários de Florianópolis
select min(salario) as mimino, max(salario) as maximo
from funcionarios
where cidade = 'Florianópolis';

-- Qual o horário da última consulta marcada para o dia 13/06/2024
select max(hora)
from consultas
where data = '2006-06-13';

-- Qual a média de idade e o total de ambulatórios antendios por eles

-- Buscar o código , o nome e o salário líquido dos funcionários. O saldo líquido obtido pela diferença entre salário cadastrado menos 20% deste mesmo salário
select codf, nome, salario - (salario * 0.20)
from funcionarios;

-- Buscar o nome dos funcionários que terminam com a letra a

select nome
from funcionarios
where nome like '%a';

-- Buscar o nome e CPF de funcionários que não possuem a sequência '00000' em seus CPfs
select nome, cpf
from funcionarios
where cpf not like '%00000';

-- Buscar no nome e as especialidades dos médicos cuja a segunda e a última letra do seu nome seja o
select nome, especialidade
from medicos
where nome like '_o%' -- segunda letra é 'o'
and  nome like '%o';  -- ultima letra é 'o'

-- Buscar os códigos e nomes dos pacientes com mais de 25 anosque não estão com tendinite, fratura, gripe e sarampo
select codp, nome
from pacientes
where idade > 25
and (doenca like '%tendinite' or doenca like '%fratura' or doenca like '%gripe' or doenca like '%sarampo');


