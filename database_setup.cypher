// 1. Criar Usuários
CREATE (alice:Usuario {nome: "Alice", id: "u1"})
CREATE (bob:Usuario {nome: "Bob", id: "u2"})
CREATE (carol:Usuario {nome: "Carol", id: "u3"})
CREATE (daniel:Usuario {nome: "Daniel", id: "u4"})
CREATE (elena:Usuario {nome: "Elena", id: "u5"})

// 2. Criar Conexões (Quem segue quem)
CREATE (alice)-[:SEGUE]->(bob)
CREATE (alice)-[:SEGUE]->(carol)
CREATE (bob)-[:SEGUE]->(alice)
CREATE (bob)-[:SEGUE]->(daniel)
CREATE (carol)-[:SEGUE]->(alice)
CREATE (carol)-[:SEGUE]->(daniel)
CREATE (daniel)-[:SEGUE]->(elena)
CREATE (elena)-[:SEGUE]->(alice)

// 3. Criar Posts e Interações
CREATE (p1:Post {conteudo: "Gráfico de conhecimento é o futuro!", id: "p1"})
CREATE (p2:Post {conteudo: "Amando aprender Neo4j", id: "p2"})
CREATE (p3:Post {conteudo: "Alguém viu o jogo ontem?", id: "p3"})

// Quem postou o quê
CREATE (alice)-[:POSTOU]->(p1)
CREATE (bob)-[:POSTOU]->(p2)
CREATE (daniel)-[:POSTOU]->(p3)

// Quem curtiu o quê (Engajamento)
CREATE (bob)-[:CURTIU]->(p1)
CREATE (carol)-[:CURTIU]->(p1)
CREATE (daniel)-[:CURTIU]->(p1)
CREATE (alice)-[:CURTIU]->(p2)
CREATE (elena)-[:CURTIU]->(p2)