-- Buscar nome e cpf dos médicos com menos de 40 anos ou com especialidade em traumatologia
select nome, cpf -- nome e cpf 
from medicos -- da tabela médicos
where idade < 40 or especialidade != 'traumatologia' ; -- com idade menor a 40 anos ou com especialidade de tramatologia != significa diferente

-- Buscar todos os dados das consultas marcadas no período da tarde após o dia 19/06/2006
select * -- selecionar tudo
from consultas -- da tabela consultas
where data > '2006/06/16' -- data maior
and hora >= '12:00:00'; -- após as 12h

-- Buscar nome e idade da table pacientes que não residem em florianopolis
select nome, idade -- nome e idade
from pacientes -- da tabela pacientes
where cidade != 'florianopolis'; -- que não residem em floripa

-- Buscar a hora das consultas marcadas antes do dia 14/06/2024 e depois do dia 20/12/2024
select hora -- selecionar a hora
from consultas -- da tabela consultas
where data < '2024/06/14' or data > '2024/12/20'; -- antes da data x e depois da data y

-- Buscar o nome e idade ( em meses) dos pacientes
select nome, idade * 12 as idade_em_meses -- selecionar nome e idade em meses as para criar um nome para esse resultado
from pacientes; -- tabela pacientes

-- Em quais cidades resindem os funcionários
select distinct cidade -- usa o distinct para trazes apenas 1 vez o nome da cidade duplicada
from funcionarios;

-- Qual o menos e o maior salario dos funcionarios de florianopolis
select min(salario) as minimo, max(salario) as maximo -- mim: minimo max:maximo
from funcionarios
where cidade = 'florianopolis';

-- Qual o horario da ultima consulta marcada para o dia 13/06/2024
select max(hora) as ultima_consulta -- selecionar a ultima hora MAX(HORA)
from consultas
where data = '2024/06/13';

-- Qual a média de indade dos médicos e o total de ambulatórios atendidos
select avg(idade) as idade_medico, count(distinct nroa) as total_ambulatorio -- avg pra calcular a média de idade, count pra somar o total de ambulatórios
from medicos;

-- Buscar o código, nome e o sálario líquido dos funcionários (salário - 20%)
select codf, nome, salario - (salario * 0.20)  -- codf é o codigo do funcionario, salario menos 20% 
from funcionarios;

-- Buscar o nome do funcionarios que termina com a letra a
select nome
from funcionarios
where nome like '%a'; -- qualquer coisa + a no final ]

-- Buscar nome e cpf dos funcionarios que não possuem a sequncia 00000 no cpf
select nome, cpf
from funcionarios
where cpf not like '%0000';  -- pra mostrar todos que não tenha a sequencia 00000

-- Buscar o nome e especialiade dos medicos cuja a segunda e a ultima letra do nome é o
select nome, especialidade
from medicos
where nome like '_o%' -- pega a segunda letra o _ acupa o espaço da primeira letra
and   nome like '%o'; -- usa o and para uma segunda pesquisa do nome

-- Buscar os codigos e nomes dos pacientes com mais de 25 anos que estão com tendinite, fratura, gripe e sarampo
select codp, nome -- codp é o codigo do paciente
from pacientes
where idade > '25' 
and doenca in ('Tendinite', 'Fratura', 'Gripe', 'Sarampo'); -- usou o in pra verificar se o que está escrito está em uma lista de condicoes

