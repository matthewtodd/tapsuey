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
      use FixPassengerNonRewindableInput
      run Taps::Server.new
    end

    @app = Rack::URLMap.new('/tapsuey' => tapsuey)
  end

  def call(env)
    @app.call(env)
  end

  private

  # NoMethodError at /tapsuey/
  # undefined method `rewind' for #<UNIXSocket:0x9636fec>
  # file: request.rb location: POST line: 142
  class FixPassengerNonRewindableInput < Struct.new(:app)
    def call(env)
      env['rack.input'] = Rack::RewindableInput.new(env['rack.input'])
      app.call(env)
    end
  end
end
