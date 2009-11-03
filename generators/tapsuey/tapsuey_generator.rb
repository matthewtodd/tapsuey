class TapsueyGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.template 'initializer.rb', 'config/initializers/tapsuey.rb'
      m.template 'password.txt',   'config/tapsuey.txt'
    end
  end
end
