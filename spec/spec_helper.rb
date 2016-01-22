require 'rspec'
require 'stylist'
require 'client'
require 'pg'

DB = PG.connect({dbname: 'hair_salon_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM stylists *;")
    DB.exec("DELETE FROM clients *;")
  end
end
