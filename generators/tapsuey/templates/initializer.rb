# Your production HTTP host.
# (Taps will attempt to pull data from http://myapp.com/tapsuey.)
Tapsuey.host = 'myapp.com'

# Will need to be the *same* for development and production. I like to load
# config/environment_variables.rb from config/preinitializer.rb, keeping
# environment_variables.rb out of version control and symlinking it back into
# the app on deploy. Inspired by
# http://tammersaleh.com/posts/managing-heroku-environment-variables-for-local-development
Tapsuey.password = ENV['TAPSUEY_PASSWORD']

# You can also set the following. (Defaults are shown.)
# Tapsuey.scheme     = 'http'    # or 'https'
# Tapsuey.port       = nil       # or 3000, for poking around locally
# Tapsuey.username   = 'tapsuey'
# Tapsuey.chunk_size = 1000      # see Taps::ClientSession
