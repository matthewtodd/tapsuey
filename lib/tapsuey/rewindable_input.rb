module Tapsuey
  # NoMethodError at /tapsuey/
  # undefined method `rewind' for #<UNIXSocket:0x9636fec>
  # file: request.rb location: POST line: 142
  class RewindableInput
    attr_reader :app

    def initialize(app)
      @app = app
    end

    def call(env)
      env['rack.input'] = Rack::RewindableInput.new(env['rack.input'])
      app.call(env)
    end
  end
end
