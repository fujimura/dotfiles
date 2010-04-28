require 'rubygems'
require 'wirble'
require 'looksee/shortcuts'
require 'ap'

Wirble.init
Wirble.colorize
 if ENV.include?('RAILS_ENV') && !Object.const_defined?('RAILS_DEFAULT_LOGGER')
   require 'logger'
   RAILS_DEFAULT_LOGGER = Logger.new(STDOUT)
 end
