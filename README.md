# API de Migração de Dados SQL para NoSQL

## Descrição

Esta API realiza a conversão de uma base de dados SQL (MySQL) para um banco NoSQL (MongoDB). Ela lê dados de tabelas MySQL e os migra para o MongoDB.

## Requisitos

- Node.js
- MySQL
- MongoDB

## Configuração

1. **Instale as dependências**:

    ```bash
    npm install
    ```

2. **Configure o banco de dados SQL**:

    Certifique-se de que o MySQL está configurado e a base de dados `setup_dragons_db` está criada.

3. **Configure o banco de dados NoSQL**:

    Certifique-se de que o MongoDB está configurado e funcionando.

4. **Inicie a API**:

    ```bash
    npm start
    ```

5. **Faça a migração**:

    Envie uma requisição POST para `/api/migrate` para iniciar a migração dos dados.

## Endpoints

- **GET /**: Verifica se a API está funcionando.
- **POST /api/migrate**: Realiza a migração dos dados do MySQL para o MongoDB.

## Contribuição

Faça um fork deste repositório, faça suas alterações e envie um pull request.

## Licença

Este projeto está licenciado sob a MIT License - veja o arquivo [LICENSE](LICENSE) para detalhes.
