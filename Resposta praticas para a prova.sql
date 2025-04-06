
-- Contar o número total de clientes
select count(*) as total_clientes -- Função COUNT(*) conta todas as linhas da tabela clientes. todos clientes
from clientes; -- da tabela clientes

-- Contar o número total de pedidos
select count(*) as total_pedidos -- Função COUNT(*) conta todas os pedidos registrados
from  pedidos; -- da tabela pedidos

-- Calcular o valor total de todos os pedidos
select sum(p.quantidade * pr.preco) as valor_pedidos-- usa-se o SUM para calcular o valor de todos os pedidos (quandidade x preco)
from pedidos as p -- usa o AS para crirar um apelido para a tabela
	join produtos as pr -- usado para combinar registros de 2 tabelas com base em uma condição
    on p.produto_id = pr.id; -- o On é usado junto com o Join, pra definir a condição da junção entre 2 tabelas.

-- calcular a média dos preços dos produtos
select avg(preco) as p_medio -- usa o AVG para calcular média.
from produtos; -- da tabela produtos

-- Listar todos os clientes e seus produtos
select c.id, c.nome, p.id as pedido_id, p.data_pedido -- (c) seginifica cliente
from clientes as c
	left join pedidos as p -- todos os clientes inclusive o que não fizeram pedido, por isso usar left
    on c.id = p.cliente_id; -- aqui quero o id do cliente referente o id do pedido do cliente
    
-- Listar todos os pedidos e seus produtos, incluindo pedidos sem produtos
select p.id as pedido, pr.nome as produto  -- (p.id) número do peido e (pr.nome) nome do pedido
from pedidos as p  -- tabelo pedido
left join produtos as pr  -- todos os pedidos e produtos, usar left
on p.id = p.produto_id ;

-- listar os produtos mais caros
select *  -- tudo 
from produtos  -- tabela produto
order by preco desc;  -- (order by) ordena por onddem, (desc) ordem decressente.

-- Listar os produtos com menos estoque
select *  -- tudo
from produtos -- tabela produtos
order by estoque asc; -- (asc) do menor para o maior 

-- Contar quantos pedidos foram feitos por clientes
select cliente_id, count(*) as total_pedido -- count(*) funçao para contar linhas de uma tabela
from pedidos
where cliente_id IS NOT NULL -- pra verificar se o valor em uma coluna não está vazio
group by cliente_id; -- group by serve para agrupar linhas com valores semelhantes

-- contar quantos produtos diferente foram vendidos
select count(distinct produto_id) as produtos_vendidos 	 -- Distinct garante que o produto seja contado apenas 1 vez
from pedidos -- da tabela pedidos
where produto_id;

-- Mostrar os clientes que não realizaram um pedido
select c.* -- c = clientes
from clientes as c -- tabela clientes
left join pedidos as p -- Join serve para combinar dados de duas tabelas
on c.id = p.cliente_id -- diz como juntar os dados dessa tabela
where p.id is null; -- pra procurar aonde não tem pedidos

-- Mostrar os produtos que nunca foram vendidos
select pr.*
from produtos as pr
left join pedidos as p
on pr.id = p.produto_id
where p.id is null;

-- Contar o número de pedidos feitos por dia
select data_pedido, count(*) as total_pedidos -- feitos por dia data_pedido, COUNT(*) função pra contar linhas em uma tabela
from pedidos
group by data_pedido -- agrupar por...
order by data_pedido; -- ordernar por --

-- Listar os produtos mais vendidos
select pr.nome, sum(p.quantidade) as total_vendido -- nome do produto, somado a quantidade de pedidos = total vendido
from pedidos as p -- tabela pedidos
left join produtos as pr -- combinada com a tabela produtos
on p.produto_id = pr.id -- pedido relacionado com o id do produto = id do produto
group by pr.nome -- agruprar por nome do produto
order by total_vendido desc;    -- ordenar por ordem descressente

-- Encontrar o cliente que mais fez pedidos
select c.nome, count(p.id) as total_pedidos -- nome do cliente, somado ao numero de pedidos = total de pedidos
from clientes as c  -- tabela clientes
join pedidos as p -- combinada a tabela pedidos
on c.id = p.cliente_id -- id do cliente = produto relacionado ao id do cliente
group by c.nome --  agrupar por nome do cliente
order by total_pedidos desc -- ordenar por ordem do maior para o menor
limit 1; -- limitar para 1 nome

-- Listar os pedidos e os clientes que os fizeram, incluindo pedidos sem clientes
select p.id as pedido_id, c.nome -- id do pedido, nome do cliente
from pedidos as p -- tabela pedidos
left join clientes as c -- combinado com a tabela clientes
on c.id = p.cliente_id; -- id do cliente = pedido relacionado com o id do cliente

-- Listar os produtos e o total de vendas por produtos
select pr.nome, sum(p.quantidade * pr.preco) as total_vendas -- nome do produto, somado a quantidade * valor do produto = total de vendas
from pedidos as p -- tabela pedidos
join produtos as pr -- combinado a tabela produtos
on pr.id = p.produto_id -- id do produto = p relacionado ao id do produto
group by pr.nome -- agrupar por nome
order by total_vendas desc; -- ordenar por ondem descressente

-- Calcular a média de quantidade de produtos po pedido
select avg(quantidade) as media_quantidade -- avg faz o calculo médio. valor médio de quantidades
from pedidos; -- da tabela pedidos

-- Listar os pedidos ordenados por data (mais recente primeiro)
select *  -- todos os pedidos
from pedidos -- da tabela pedidos
order by data_pedido desc; -- ordenando por ordem descressente

-- Contar quantos clientes possuem telefone cadastrados
select count(*) as clientes_telefone -- contar todas as linhas
from clientes -- da tabela clientes 
where telefone is not null; -- que possuem telefone cadastrado

-- Encontrar o cliente que gastou mais dinheiro em pedidos
select c.nome, sum(p.quantidade * pr.preco) as total_gasto -- nome do cliente, calculando quantidade * preco do produto = total gast0
from cliente as c -- da tabela cliente
join pedidos as p -- cobinado com a tabela pedido
on c.id = p.cliente_id -- id do cliente = pedido relacionado com id do cliente
join produtos as pr -- combinado com a tabela produdo
on p.produto_id = pr.id -- id do produto relacinado com pedido = id do produto
group by c.nome -- agrupar por nome do cliente
order by total_gasto desc -- ordenar por total gasto em ordem descressente
limit 1; -- limitando a 1 cliente

-- Listar os 5 produtos mais vendidos
select pr.nome, sum(p.quantidade) as total_vendido -- nome do produto, somando a quantidade de produtos = total vendido
from pedidos as p -- da tabela pedidos
join produtos as pr -- combinado com a tabela produtos
on pr.id = p.produto_id -- id do produto = pedido relacionado ao id do produto
group by pr.nome -- agrupar po nome
order by total_vendido desc; -- ordenar por ordem descressente

-- Listar os clientes que ja fizeram pedidos e o número de pedidos de cada um
select c.nome, count(p.id) as total_pedidos -- nome do cliente, quantidade de vezes que fez o pedido (count soma o numero de linhas em uma tabela) = total de pedidos
from clientes as c -- da tabela cliente
join pedidos as p -- combinado com a tabela pedidos
on c.id = p.cliente_id -- id cliente = pedidos relacionado com id cliente
group by c.nome -- agrupar por nome
order by total_pedidos desc;

-- Encontrar a data com mais pedidos realizados
select data_pedido, count(*) as Total
from pedidos
group by data_pedido
order by Total Desc
limit 1;

-- Calcular a média de valor gasto por pedido
select avg(p.quantidade * pr.preco) as Valor_medio -- media do numeros de pedidos * o valor do produto = valor médio
from pedidos as p -- da tabela pedidos
join produtos as pr -- combinado com a tabela produtos
on p.id = p.produto_id; -- id do pedido = pedido relacinado com id do produto

    