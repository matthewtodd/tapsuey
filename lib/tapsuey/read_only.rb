module Tapsuey
  class ReadOnly
    attr_reader :app

    def initialize(app)
      @app = app
    end

    def call(env)
      if env['REQUEST_METHOD'] == 'GET' || env['PATH_INFO'] =~ %r{^/sessions(/\d+)?$}
        app.call(env)
      else
        [403, {}, 'Sorry, this is a read-only taps server. Push is not allowed.']
      end
    end
  end
end
