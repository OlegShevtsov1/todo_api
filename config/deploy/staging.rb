server ENV['CAP_STAGING_HOST'], user: ENV['CAP_STAGING_USER'],  roles: %w{web app db}, port: ENV['CAP_STAGING_PORT']
set :branch, ENV['CAP_STAGING_BRANCH']
set :rails_env, 'staging'
set :stage, :staging
set :sidekiq_env, :staging
set :rvm_ruby_version, ENV['CAP_STAGING_RVM_RUBY_VERSION']
set :deploy_to, ENV['CAP_STAGING_DEPLOY_TO']

namespace :deploy do
  task :console do
    on roles(:app) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :bundle, 'exec rails c'
        end
      end
    end
  end
end
