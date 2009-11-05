# Our vendored version of taps has bin/schema with an explicit gem dependency
# on activerecord-2.2.2. We don't specify this as a dependency in
# rails/init.rb because it would wreak havoc with all that is holy.
depend :remote, :gem, 'activerecord', '= 2.2.2'

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
