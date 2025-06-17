Selects prova


-- 1
SELECT 
    a.nome AS nome_autor,
    COUNT(l.id) AS total_livros,
    SUM(CASE WHEN l.disponibilidade = 1 THEN 1 ELSE 0 END) AS livros_disponiveis
FROM 
    autores a
JOIN 
    livros l ON a.id = l.autor_id
GROUP BY 
    a.id, a.nome
HAVING 
    COUNT(l.id) > 1;
-- 2
SELECT 
    u.nome,
    COUNT(e.id) AS quantidade_emprestimos
FROM 
    usuarios u
JOIN 
    emprestimos e ON u.id = e.id_usuario
GROUP BY 
    u.id, u.nome
HAVING 
    COUNT(e.id) >= 2
ORDER BY 
    quantidade_emprestimos DESC;
    
-- 3

SELECT 
    u.nome,
    COUNT(e.id) AS quantidade_emprestimos,
    CASE 
        WHEN COUNT(e.id) >= 10 THEN 'Alta'
        WHEN COUNT(e.id) BETWEEN 5 AND 9 THEN 'Média'
        ELSE 'Baixa'
    END AS atividade
FROM 
    usuarios u
JOIN 
    emprestimos e ON u.id = e.id_usuario
GROUP BY 
    u.id, u.nome
ORDER BY 
    quantidade_emprestimos DESC;
    
    -- 4
    
    SELECT 
    DATE_FORMAT(data_cadastro, '%Y-%m') AS ano_mes,
    COUNT(*) AS total_usuarios
FROM 
    usuarios
GROUP BY 
    ano_mes
ORDER BY 
    ano_mes;
    
    -- 5
    
    SELECT 
    u.nome,
    COUNT(e.id) AS total_emprestimos
FROM 
    usuarios u
JOIN 
    emprestimos e ON u.id = e.id_usuario
GROUP BY 
    u.id, u.nome
ORDER BY 
    total_emprestimos DESC;






