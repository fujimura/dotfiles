# -*- encoding: utf-8 -*-
require 'rubygems'
require 'wirble'
require 'irb/completion'

Wirble.init
Wirble.colorize
ARGV.concat [ "--readline", "--prompt-mode", "simple" ]
if ENV.include?('RAILS_ENV') && !Object.const_defined?('RAILS_DEFAULT_LOGGER')
  require 'logger'
  RAILS_DEFAULT_LOGGER = Logger.new(STDOUT)
elsif defined?(Rails)
  if Rails.logger
    Rails.logger = Logger.new(STDOUT)
    ActiveRecord::Base.logger = Rails.logger
  end
end
