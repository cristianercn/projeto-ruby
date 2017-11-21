Instruções para rodar o projeto.

- Criar variavel de ambiente no Sistema Operacional:
    PG_USER
    PG_PASS
    IP_SERVIDOR

- Banco de Dados Utilizado: 
    PostgreSQL 

- Nome do Banco de dados: 
    cristiane_estudo

- Criar o schema dentro do Banco: 
    votaprato

Obs.: Não usar o schema public.


- Criar variavel de ambiente no Sistema Operacional:
    ENV['PG_USER']
    ENV['PG_PASS']
    ENV['IP_SERVIDOR']

- Banco de Dados - PostgreSQL 
- Criar o Banco de dados: (cristiane_estudo)
- Criar o schema: (votaprato)


gem install bundle

- Criar dependências

    bundle install

- Comando rails:

bundle exec rake db:migrate -> (Cria a estrutura do banco de dados do projeto)

rais s -> (Roda o servidor local) 

localhost -> abre o projeto

- Comando do GIT:
git status
git add.
git commit -am "projeto restaurante rails"
git push -u origin master




