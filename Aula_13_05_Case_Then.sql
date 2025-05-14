 -- 1 Crie uma consulta SQL que exiba o nome do participante, 
 -- o nome do evento e uma coluna chamada status_descricao que deve exibir:
SELECT p.nome, e.nome_evento,
    CASE 
        WHEN status_pagamento = 'pago' THEN 'Pago'
        WHEN  status_pagamento = 'pendente' THEN 'Pendente'
        WHEN  status_pagamento = 'cancelado' THEN 'Cancelado'
        ELSE 'Desconhecido'
    END AS status_descricao
FROM 
    inscricoes as i
JOIN participantes as p ON i.id_participante = p.id
JOIN eventos as e ON i.id_evento = e.id;

-- 2 Escreva uma consulta que exiba o nome do evento, as datas de início e fim e 
-- uma nova coluna chamada classificacao_evento, com base na duração do evento:
SELECT nome_evento, data_inicio, data_fim,
    CASE 
        WHEN DATEDIFF(data_fim, data_inicio) = 0 THEN 'Evento de 1 dia'
        WHEN DATEDIFF(data_fim, data_inicio) <= 3 THEN 'Evento de Curta Duração'
        ELSE 'Evento de Longa Duração'
    END AS classificacao_evento
FROM eventos;

-- 3  Liste todos os participantes com uma coluna extra chamada tipo_participante, que deve conter:
SELECT p.nome AS nome_participante, p.data_inscricao,
    CASE 
        WHEN YEAR (p.data_inscricao) < 2024 THEN 'Veterano'
        ELSE 'Novo'
    END AS tipo_participante
FROM participantes p;
    
-- 4 Crie uma consulta que retorne o nome dos organizadores, seus cargos e uma nova coluna chamada funcao, com:
SELECT nome AS nome_organizador, cargo,
    CASE 
        WHEN cargo = 'Diretor' THEN 'Gestor Principal'
        WHEN cargo IN ('Coordenador', 'Supervisor') THEN 'Coordenação'
        ELSE 'Apoio'
    END AS funcao
FROM organizadores;

-- 5   Crie uma consulta que exiba o nome dos participantes e uma coluna chamada prioridade_contato, que deve mostrar:
SELECT nome AS nome_participante,
    CASE 
        WHEN telefone IS NOT NULL THEN 'WhatsApp'
        WHEN telefone IS NULL AND email IS NOT NULL THEN 'E-mail'
        ELSE 'Sem contato disponível'
    END AS prioridade_contato
FROM participantes;

-- 6 Liste todos os eventos com nome, tipo e uma nova coluna chamada classificacao_tipo, que mostre:
SELECT nome_evento, tipo_evento,
    CASE 
        WHEN tipo_evento in ('Campeonato', 'Corrida', 'Torneio') THEN 'Competição'
        WHEN tipo_evento in ('Oficina', 'Curso', 'Palestra') THEN 'Formativo'
        ELSE 'Outro'
    END AS classificacao_tipo
FROM eventos;

-- Novo comando Having (Obrigatoriamento usado com "group by" para usar o HAVING, comando de agrupamento)
SELECT id_evento, count(*) as qtd
FROM inscricoes
GROUP BY id_evento
HAVING QTD > 1;
		
