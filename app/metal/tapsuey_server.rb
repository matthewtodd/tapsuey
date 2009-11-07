class TapsueyServer
  def self.call(env)
    new.call(env)
  end

  def initialize
    require 'taps/config'
    Taps::Config.database_url      = Tapsuey.local_database_url
    Taps::Config.taps_database_url = Tapsuey.taps_database_url
    Taps::Config.login             = Tapsuey.username
    Taps::Config.password          = Tapsuey.password

    require 'taps/server'
    tapsuey = Rack::Builder.app do
      use Tapsuey::ReadOnly
      run Taps::Server.new
    end

    @app = Rack::URLMap.new('/tapsuey' => tapsuey)
  end

  def call(env)
    @app.call(env)
  end
end
