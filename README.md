# ERP Example

Um mini ERP para controle de pedidos, produtos, cupons e estoque.

## Tecnologias & versão:

- **Banco de dados**: MYSQL;
- **Frontend**: HTML, CSS, JavaScript, JQuery (3.7.1) e Bootstrap (5.3.7);
- **Backend**: PHP (8.2.7);
- **Suporte**: phpdotenv, composer (2.7.1);

## Variaveis de ambiente
 Antes de executar a aplicação crie, na raiz do projeto, um arquivo ``.env`` com as seguintes variaveis de ambiente:
 ```env
APP_NAME="ERP Exemple"
APP_ENV=development

DISPLAY_ERRORS=1

DB_HOST=127.0.0.1
DB_PORT=3001
DB_NAME=erp_example_db
DB_USER=[SEU_USUARIO_MYSQL]
DB_PASS=[SUA_SENHA_MYSQL]
 ```

## Iniciando o banco de dados
No MySQL Workbench, ou na interface de sua preferência, execute o script SQL *database/migration/Create Database and Tables.sql*

## Rode a aplicação localmente

No terminal, dentro da pasta do projeto, execute:

```
php -S localhost:8000 -t public
```