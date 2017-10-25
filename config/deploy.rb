`ssh-add`
# config valid only for current version of Capistrano
lock "3.9.1"

set :application, "rails-101"
set :repo_url, "https://github.com/StanGC/rails-101.git"
set :deploy_to, "/home/apps/rails-101"
set :keep_releases, 5

set :rbenv_type, :system
set :rbenv_ruby, "2.2.4"
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w(rake gem bundle ruby rails)
set :rbenv_roles, :all
# set :branch, ENV['BRANCH'] if ENV['BRANCH']

append :linked_files, 'config/database.yml', 'config/secrets.yml'
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'

# set :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

after "deploy:publishing", "deploy:restart"
namespace :deploy do
  task :restart do
    invoke "unicorn:reload"
  end
end
