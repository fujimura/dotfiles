# -*- encoding: utf-8 -*-
require 'rubygems' unless defined? Gem
require 'wirb'
Wirb.start

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

class Array
  def self.sample(count = nil)
    count ||= 10
    %w(one two three four five six seven eight nine ten)[0.. count-1]
  end
end

class Hash
  def self.sample(count = nil)
    count ||= 10
    a = Array.sample(count)
    Hash.new.tap do |h|
      (0..count-1).map do |i|
        h[a[i]] = i + 1
      end
    end
  end
end
