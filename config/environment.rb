RAILS_GEM_VERSION = '2.3.4' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.gem "authlogic"
  config.gem "cancan"
  config.gem 'brdata'
  config.gem 'brdinheiro'
  config.gem 'brhelper'
  config.gem 'brnumeros'
  config.gem 'brstring'
  config.gem 'paperclip', :source => 'http://gemcutter.org'
  config.time_zone = 'Brasilia'
  config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}')]
  config.i18n.default_locale = 'pt-BR'
end

