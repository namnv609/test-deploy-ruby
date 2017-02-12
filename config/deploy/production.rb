set :port, 2222
set :user, "root"
set :deploy_via, :remote_cache
set :deploy_to, "/var/www/html/#{fetch(:application)}"
set :conditionally_migrate, true

server "127.0.0.1", port: fetch(:port), user: fetch(:user), roles: %w{app web}
