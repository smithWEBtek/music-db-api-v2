namespace :db do
  desc 'heroku pg:reset, migrate, seed'
  task hdcms: :environment do
    exec('heroku pg:reset --app music-db-api-v2 --confirm music-db-api-v2
      heroku run rake db:migrate --app music-db-api-v2
      heroku run rake db:seed --app music-db-api-v2')	
  end
end
