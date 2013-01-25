begin
  require 'pry'
rescue LoadError
end
require 'rspec'
require 'mongoid'

require File.expand_path '../../lib/mongoid/ordered', __FILE__

def database_id
    ENV['CI'] ? "mongoid_ordered_#{Process.pid}" : 'mongoid_ordered_test'
end

Mongoid.configure do |config|
  config.connect_to database_id
end

Dir['./spec/models/*.rb'].each { |f| require f }

RSpec.configure do |c|
  c.before(:each) do
    Mongoid.purge!
    Mongoid::IdentityMap.clear
  end

  c.after(:suite) do
    Mongoid::Threaded.sessions[:default].drop if ENV['CI']
  end
end
