require 'bundler'
Bundler.require

DB = {:conn => SQLite3::Database.new("db/music.db")}
# other dependencies
require_all 'lib'
