# Our vendored version of taps has bin/schema with an explicit gem dependency
# on activerecord-2.2.2. We don't specify this as a dependency in
# rails/init.rb because it would wreak havoc with all that is holy.
depend :remote, :gem, 'activerecord', '= 2.2.2'

namespace :tapsuey do
  desc 'Download production tapsuey password to config/tapsuey.txt.'
  task :download do
    download "#{shared_path}/config/tapsuey.txt", 'config/tapsuey.txt'
  end

  desc 'Upload config/tapsuey.txt to production shared_path.'
  task :upload do
    # TODO would it make more sense to add 'config' into shared_children?
    run "#{try_sudo} mkdir -p #{shared_path}/config && #{try_sudo} chmod g+w #{shared_path}/config"
    upload 'config/tapsuey.txt', "#{shared_path}/config/tapsuey.txt", :mode => 0600
  end

  desc 'Symlink config/tapsuey.txt into the latest release.'
  task :symlink do
    run <<-CMD
      rm -rf #{latest_release}/config/tapsuey.txt &&
      ln -s #{shared_path}/config/tapsuey.txt #{latest_release}/config/tapsuey.txt
    CMD
  end
end

after 'deploy:setup',       'tapsuey:upload'
after 'deploy:update_code', 'tapsuey:symlink'
