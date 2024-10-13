server ENV['CAP_PROD_HOST'], user: ENV['CAP_PROD_USER'],  roles: %w{web app db}, port: ENV['CAP_PROD_PORT']
set :branch, ENV['CAP_PROD_BRANCH']
set :rails_env, 'production'
set :stage, :production
set :sidekiq_env, :production
set :rvm_ruby_version, ENV['CAP_PROD_RVM_RUBY_VERSION']
set :deploy_to, ENV['CAP_PROD_DEPLOY_TO']
