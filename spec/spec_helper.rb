require 'rubygems'
require 'bundler/setup'
require 'factory_girl'
require 'rameau'

Dir['./spec/factories/*.rb'].each{|factory| require factory }

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end
