# config valid only for current version of Capistrano
lock "3.7.2"

set :application, "test_deploy_ruby"
set :repo_url, "git@github.com:namnv609/test-deploy-ruby.git"
set :bundle_binstubs, nil

append :linked_files, "config/database.yml", "config/secrets.yml"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets"

after "deploy:publishing", "deploy:restart"

namespace :deploy do
  task :restart do
    invoke "unicorn:stop"
    invoke "unicorn:reload"
  end

  task :stop do
    invoke "unicorn:stop"
  end
end
