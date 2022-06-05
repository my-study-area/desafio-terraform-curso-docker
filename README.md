# desafio-terraform-curso-docker
Repositório criado com o objetivo de assimilar os conhecimento adquiridos com terraform e docker

# Passos para iniciar a aplicação com docker
```bash
# cria a rede my_network
docker network create --driver bridge my_network

# executa o mongo
docker run -d --name mongodb --network my_network mongo

# executa o container com node1
docker run -d --name node1 --network my_network adrianoavelino/alura-books:0.2

# executa o container com node2
docker run -d --name node2 --network my_network adrianoavelino/alura-books:0.2

# executa o container com node3
docker run -d --name node3 --network my_network adrianoavelino/alura-books:0.2

# executa o nginx como controle de carga
docker run -d --name nginx -p 80:80 --network my_network adrianoavelino/nginx-curso-alura-docker:0.1

# verifica os logs do container node1
docker logs -f node1

# verifica os logs do container node2
docker logs -f node2

# verifica os logs do container node3
docker logs -f node3
```
