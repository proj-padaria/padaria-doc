# padaria-doc

[![NPM](https://img.shields.io/npm/l/react)](https://github.com/proj-padaria/padaria-api/blob/main/LICENSE)

Documentação para o sistema de gestão de padarias. 

- ddl: pasta que contém os scripts para criação do banco de dados
- agenda.xlsx: planilha com as atividades desenvolvidas
- modelagem_padaria.mwb: documentação da modelagem - MySQLWorkbench.

### Sobre o projeto

O projeto padaria um sistema para gestão de padarias composto pelos repositories:
- padaria-api - back-end Java / Spring Boot
- padaria-app - front-end Flutter
- padaria-doc - banco de dados e documentação
- padaria-web - front-end Java / Angular

É uma atividade final para conclusão do treinamento que tivemos. O treinamento contou com os seguintes módulos:
<li>TI-Introdução
  <li>Lógica de programação (Fluxogramas com codificação Java)</li>
</li>
<li>Programação Java</li>
<li>Banco de dados relacional</li>
<li>Java Spring Boot</li>

### Tecnologias utilizadas
1. Banco de dados relacional [PostgreSQL](https://www.postgresql.org/) 
2. Documentação da modelagem do banco de dados pelo [MySQLWorkbench](https://www.mysql.com/products/workbench/)

### Como executar este projeto
```bash
# Clone este repositório
$ git clone padaria-doc

# Utilize o PGAdmin (ou equivalente) ou o terminal para criar um banco de dados com o nome "padaria"
# Execute neste banco os scripts SQL contidos no repositorio padaria-doc/ddl.

# Acesse a pasta do projeto no seu terminal
$ cd padaria-api

# Compile com sua IDE preferida.
# Excute. 
# A aplicação será iniciada na porta 8080.
# Acesse pelo navegador http://localhost:8080/endpoint
# Exemplo: 
http://localhost:8080/cidades/list

# Para endpoints que contenham um body, é indicado utilizar o aplicativo Postman ou um similar.
```

### Como usar
 <!--ts-->
* [Pré-Requisitos](#pre-requisitos)

    - Necessário Instalação de uma IDE;
    - Necessário Instalação do Postgresql para que as ddl's sejam executadas;
    - Necessário Instalação de software que permite enviar solicitações HTTP para APIs (recomendado Postman) para que seja possível o teste dos end points
  <!--te-->

### Agradecimentos


### Autores
<img style="width:100px" src="https://pixabay.com/pt/photos/retrato-senhorita-garota-rosto-1886231/" alt="Imagem da desenvolvedora">

Ana Júlia https://www.linkedin.com/in/ana

Gustavo https://www.linkedin.com/in/gustavo

Renan https://www.linkedin.com/in/renan
