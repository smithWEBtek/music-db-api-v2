# config valid for current version and patch releases of Capistrano
lock "~> 3.12.1"

set :application, "musicdb"
set :repo_url, "git@github.com:smithwebtek/music-db-api-v2.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# set :rails_env, 'production'
set :user, 'deploy'
# set :pty, true
# set :ssh_options, {:forward_agent => true}
# set :deploy_to, "/home/#{fetch(:user)}/#{fetch(:application)}"
set :deploy_to, "/home/deploy/musicdb"
# set :rvm_roles, [ :app, :web ]
# set :default_env, { 'PASSENGER_INSTANCE_REGISTRY_DIR' => '/home/deploy/passenger_temp' }
set :rvm_ruby_version, '2.6.3'

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml", "config/master.key"
append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Defaults to ["/path/to/release_path/public/#{fetch(:assets_prefix)}/.sprockets-manifest*", "/path/to/release_path/public/#{fetch(:assets_prefix)}/manifest*.*"]
# This should match config.assets.manifest in your rails config/application.rb
set :assets_manifests, ['app/assets/config/manifest.js']

# RAILS_GROUPS env value for the assets:precompile task. Default to nil.
set :rails_assets_groups, :assets

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
set :ssh_options, verify_host_key: :secure
