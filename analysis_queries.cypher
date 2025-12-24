// Analisa a Popularidade do Conteúdo

MATCH (p:Post)<-[:CURTIU]-(u:Usuario)
RETURN p.conteudo AS Postagem, count(u) AS Total_Curtidas
ORDER BY Total_Curtidas DESC


// Interações de Usuários

MATCH (u:Usuario)<-[:SEGUE]-(seguidor)
RETURN u.nome AS Influenciador, count(seguidor) AS Numero_Seguidores
ORDER BY Numero_Seguidores DESC

// Comunidades de Interesse

MATCH (eu:Usuario {nome: "Alice"})-[:SEGUE]->(amigo)-[:SEGUE]->(amigo_do_amigo)
WHERE NOT (eu)-[:SEGUE]->(amigo_do_amigo) AND eu <> amigo_do_amigo
RETURN amigo_do_amigo.nome AS Sugestao, count(amigo) AS Amigos_Em_Comum
ORDER BY Amigos_Em_Comum DESC

// Para montar o grafico.

MATCH (n) RETURN n