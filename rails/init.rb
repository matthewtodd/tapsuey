unless Rails.root.join('Gemfile').exist?
  config.gem 'matthewtodd-taps'
end

require 'tapsuey'
