require 'rubygems'
require 'wirble'
require 'sketches'

Wirble.init
Wirble.colorize
 if ENV.include?('RAILS_ENV') && !Object.const_defined?('RAILS_DEFAULT_LOGGER')
   require 'logger'
   RAILS_DEFAULT_LOGGER = Logger.new(STDOUT)
 end

 Sketches.config :editor => 'vim'
