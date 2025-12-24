# 🕸️ Social Graph Analytics com Neo4j

Este projeto consiste em um protótipo funcional de um banco de dados orientado a grafos para uma startup de análise de mídias sociais. O objetivo é modelar interações de usuários e extrair insights sobre engajamento, influência e comunidades.

## 📋 O Desafio

Uma startup deseja criar um produto que ofereça insights sobre:
1.  Conexões entre usuários.
2.  Popularidade de conteúdo.
3.  Recomendações baseadas em redes de interesse.

O projeto foca na construção da **topologia da rede** e em consultas estruturais usando **Cypher Query Language**.

## 🏗️ Modelagem do Grafo (Schema)

A estrutura de dados foi desenhada para priorizar relacionamentos como cidadãos de primeira classe:

* **Nós (Nodes):** `(:Usuario)`, `(:Post)`
* **Relacionamentos:**
    * `(:Usuario)-[:SEGUE]->(:Usuario)`: Define o grafo social.
    * `(:Usuario)-[:POSTOU]->(:Post)`: Define autoria.
    * `(:Usuario)-[:CURTIU]->(:Post)`: Define engajamento.

## 🚀 Como Executar

### Pré-requisitos
* [Docker](https://www.docker.com/) instalado.

### Instalação
1. Clone este repositório.
2. Inicie o container do Neo4j via Docker.
3. Acesse `http://localhost:7474` no seu navegador.
4. Execute o script `database_setup.cypher` para popular o banco.

## 📊 Queries e Insights

Abaixo um exemplo de análise implementada via Cypher (disponivel em `analysis_queries.cypher`):

### 1. Popularidade de Conteúdo
Identifica quais posts geraram mais engajamento na rede.
```cypher
MATCH (p:Post)<-[:CURTIU]-(u:Usuario)
RETURN p.conteudo AS Postagem, count(u) AS Total_Curtidas
ORDER BY Total_Curtidas DESC
