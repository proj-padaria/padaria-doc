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

### Banco de dados - Modelagem e DDL
https://github.com/proj-padaria/padaria-doc

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
http://localhost:8080/nome_do_endpoint

# Para endpoints que contenham um body, é indicado utilizar o aplicativo Postman ou um similar.
```

### Como usar
 <!--ts-->
* [Pré-Requisitos](#pre-requisitos)

  - Necessário Instalação de uma IDE;
  - Necessário Instalação Postgresql para que as ddl's sejam executadas;
  - Para teste das API's é interessante um app que trate os bodies (exemplo: POSTMAN);
  <!--te-->

### Repositórios Relacionados
  <!--ts-->
* [Complemento](#complemento)

    - padaria-app: Este repositório contém a aplicação front-end da padaria.
      Ainda está em desenvolvimento e planejado para integração com a API da padaria.
      Você pode acompanhar o progresso e contribuir para o desenvolvimento;

    - padaria-web: Este repositório contém o site da padaria, que é uma versão estática do sistema de padaria.
      Ele fornece informações sobre a padaria, menu e outras informações relevantes.
      O desenvolvimento ativo está ocorrendo neste repositório.
  <!--te-->

### Agradecimentos

      Agradecemos por usar o nosso sistema de padaria!
      Se você tiver alguma dúvida ou encontrar problemas, sinta-se à vontade para entrar em contato conosco
      através das issues do GitHub.

### Autores
<img style="width:100px" src="https://pixabay.com/pt/photos/retrato-senhorita-garota-rosto-1886231/" alt="Imagem da desenvolvedora">

Ana Júlia https://www.linkedin.com/in/ana-julia-santos-ponson-423772243

Gustavo https://www.linkedin.com/in/gustavo-meira-b342b56b

Renan https://www.linkedin.com/in/renan-meira-970b0071
