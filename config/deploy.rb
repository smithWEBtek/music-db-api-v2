# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, "musicdb"
set :repo_url, "git@github.com:smithwebtek/music-db-api-v2.git"
set :user, 'deploy'
set :rvm_ruby_version, '2.6.5'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call
set :branch, ENV['BRANCH'] if ENV['BRANCH']

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/home/deploy/musicdb'

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :debug

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
set :linked_files, %w{config/database.yml config/secrets.yml config/master.key}

# Default value for linked_dirs is []
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Defaults to ["/path/to/release_path/public/#{fetch(:assets_prefix)}/.sprockets-manifest*", "/path/to/release_path/public/#{fetch(:assets_prefix)}/manifest*.*"]
# This should match config.assets.manifest in your rails config/application.rb
# set :assets_manifests, ['app/assets/config/manifest.js']

# RAILS_GROUPS env value for the assets:precompile task. Default to nil.
# set :rails_assets_groups, :assets

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  before "deploy:assets:precompile", "deploy:npm_install"

  namespace :deploy do
    desc 'Run rake npm:install'
    task :npm_install do
      on roles(:web) do
        within release_path do
          execute("cd #{release_path} && npm install")
        end
      end
    end
  end

end
