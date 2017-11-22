# Instruções para rodar o projeto

Criar as seguintes variavéis de ambiente no Sistema Operacional:

    ENV['PG_USER']
    ENV['PG_PASS']
    ENV['IP_SERVIDOR']

### Banco de Dados - PostgreSQL 

- Nome do Banco de dados: 
Criar o Banco de dados: (cristiane_estudo)
    cristiane_estudo

- Criar o schema dentro do Banco: 
Criar o schema: (votaprato)
    votaprato

Obs.: Não usar o schema public.

### Bundler - Para agrupar as gemns
```
gem install bundler
```

```
bundle install

```

### Comandos Rails:

```
bundle exec rake db:migrate -> (Cria a estrutura do banco de dados do projeto)

rais s -> (Roda o servidor local) 

localhost -> abre o projeto

```

### Comandos GIT:

```
git status
git add.
git commit -am "projeto restaurante rails"
git push -u origin master
```
