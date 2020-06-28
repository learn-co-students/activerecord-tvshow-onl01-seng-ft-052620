require "bundler/setup"
require 'yaml'
require 'active_record'
require_relative '../app/models/show.rb'
require_relative '../app/show_controller.rb'

Bundler.require

Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../lib/support", "*.rb")].each {|f| require f}

DB = ActiveRecord::Base.establish_connection({
  adapter: 'sqlite3',
  database: 'db/shows.sqlite'
})

if ENV["ACTIVE_RECORD_ENV"] == "test"
  ActiveRecord::Migration.verbose = false
end

sql = <<-SQL
CREATE TABLE IF NOT EXISTS shows (
  id INTEGER PRIMARY KEY,
  name TEXT,
  day TEXT,
  network TEXT,
  rating INTEGER
  )
SQL

ActiveRecord::Base.connection.execute(sql)
