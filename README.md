# S206-L1
Repositório de S206(Qualidade de Software)

Na pasta provas:

# /pv_karate:

  Executar um teste a partir do Runner ou suíte:
  ```
  mvn test –Dtest=bookerRunner 
  ```

# /pv_cypress:

  Baixar as dependencias do projeto (caso já tenha baixado o código do git)
  ```
  npm install
  ```

  Abrir cypress pela linha de comando:
  ```
  ./node_modules/.bin/cypress open
  ```

  Rodar specs por linha de comando:
  ```
  ./node_modules/.bin/cypress run --spec 'cypress/e2e/**/'
  ```
