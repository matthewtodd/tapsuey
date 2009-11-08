namespace :tapsuey do
  namespace :db do
    desc 'Pull production data into the latest release.'
    task :pull do
      rake      = fetch(:rake, 'rake')
      rails_env = fetch(:rails_env, 'production')

      unless rails_env == 'production'
        run "cd #{latest_release}; #{rake} RAILS_ENV=#{rails_env} db:pull"
      end
    end
  end
end
