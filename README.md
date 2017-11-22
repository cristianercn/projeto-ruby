# Instruções para instalação  do projeto

## Requisitos

. Ruby

. PostgreSql;


### 1 - Configuração de variáveis de ambiente

Criar as seguintes variavéis de ambiente no Sistema Operacional:

    ENV['PG_USER']
    ENV['PG_PASS']
    ENV['IP_SERVIDOR']

### 2 - Configuração do Banco de Dados: PostgreSQL 


. Criar o Banco de dados: 

  Nome do Banco de dados => cristiane_estudo

 
. Criar o schema: 

  Nome do Schema no Banco de dados => votaprato

Obs.: Não usar o schema public.

### 3 - Instalação de dependëncias 

#### (Bundler: Para agrupar as Gems)

```
gem install bundler
```

```
bundle install

```
### 4 - Configuração do Banco de Dados:
```
bundle exec rake db:migrate -> (Cria a estrutura do banco de dados do projeto)

```


### 5 - Execução do Projeto :

```

rais s -> (cria um servidor local com a aplicação) 

acessar a aplicação através da url http://localhost:3000

```

### 6 - GIT e Github:

```
git branch
git checkout -- <file>...
git status
git add <file>...
git commit -am "projeto restaurante rails"
git push -u origin master 
git pull
```
