# Teste IATEC

App para um teste do iatec.

## Getting Started

Este projeto foi feito usando o padrão de arquitetura limpa proposto pelo resocoder

Qualquer dúvida entrar em contato

rodriguesjeff.dev@gmail.com

## Architecture

Cada feature é subdividida em 3 camadas, apresentação, domínio e dados.

### Domain
A camada de domínio é o core da aplicação, é onde fica a lógica de negócios e os casos de uso do app.

### Data
A camada de dados contém a conexão com data sources, seja para recuperação de dados locais ou remotos, também é onde implementamos os repositórios e modelos com base nos repositórios e entidades abstratos da camada de domínio.

### Presentation
A camada de apresentação é onde implementamos a ui que será exibida ao usuário, também é onde fazemos toda gestão de estado da tela seja com o cubit, bloc, mobx, etc.

