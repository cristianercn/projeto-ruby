require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rbenv'
require 'mina/whenever'

set :domain, ENV['SERVIDOR']
set :vhosts, ENV['VHOSTS']
set :rails_env, ENV['RAILS_ENV']
set :keep_releases, '2'
set :user, 'sistemas'
set :port, '2222'
set :repository, ENV['CI_REPOSITORY_URL']
set :tag, ENV['CI_COMMIT_TAG']
set :branch, ENV['CI_COMMIT_REF_NAME'] if ENV['CI_COMMIT_REF_NAME']
set :commit, ENV['CI_COMMIT_SHA'] if ENV['CI_COMMIT_SHA']
set :rbenv_path, '/usr/local/rbenv'
set :shared_dirs, fetch(:shared_dirs, []).push('log', 'tmp')
set :shared_paths, []
set :force_migrate, true
set :force_asset_precompile, true

# Verifica o enviroment para entregar a aplicacao no servidor correto.
if fetch(:tag)
  set :versao, "#{fetch(:tag)}"
else
  set :versao, "#{fetch(:branch)}-#{fetch(:commit)}"
end

# Diretorio deploy. 
set :deploy_to, "/var/www/sistemas/#{fetch(:aplicacao)}"

# Versao do Ruby.
set :versao_ruby, File.open(".ruby-version").first.strip rescue nil

unless fetch(:versao_ruby)
  raise Exception.new("Não foi encontrada versão de Ruby no arquivo .ruby-version")
end

# Checa versao do Ruby
task :environment do
  invoke :'rbenv:load'
end

task :setup => :environment do
  command "mkdir -p #{fetch(:shared_path)}/tmp/sockets"
  command "chmod g+rx,u+rwx #{fetch(:shared_path)}/tmp/sockets"
  command "mkdir -p #{fetch(:shared_path)}/tmp/pids"
  command "chmod g+rx,u+rwx #{fetch(:shared_path)}/tmp/pids"
  command "mkdir -p #{fetch(:shared_path)}/tmp/cache"
  command "chmod g+rx,u+rwx #{fetch(:shared_path)}/tmp/cache"
  command "echo Verificando Ruby e Bundler..."
  command "if ! rbenv shell #{fetch(:versao_ruby)}; then rbenv install -s #{fetch(:versao_ruby)}; rbenv shell #{fetch(:versao_ruby)}; fi"
  command "gem install bundler --no-ri --no-rdoc"
end

# Versao Ruby para configurar Nginx
set :root_path, "#{fetch(:deploy_to)}/current/public"
set :ruby_path, "#{fetch(:rbenv_path)}/versions/#{fetch(:versao_ruby)}/bin/ruby"


comment "Faz deploy da aplicação"
task :deploy => :environment do
  deploy do
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'

    command "if [[ -f bower.json ]]; then bower install; fi"

    if fetch(:pre_compile) == 'true'
      comment "Realizando pre-compile... aguarde "
      invoke :'rails:assets_precompile'
    end

    invoke :'rails:db_migrate'

    on :launch do

      if fetch(:whenever) == 'true'
        invoke :'whenever:update'
      end


      if fetch(:versao)
        command "echo #{fetch(:versao)} > versao.txt"
      end

      command "touch tmp/restart.txt"

      comment "Removendo gems antigas"
      command "bundle clean"
    end
  end
end
