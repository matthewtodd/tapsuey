class TapsueyGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.template 'initializer.rb', 'config/initializers/tapsuey.rb'
    end
  end
end
