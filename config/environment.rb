require 'bundler'
Bundler.require

require 'active_record'


ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3', 
  database: 'db/development.db'
  )

ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Base.logger.level = 1

require_all 'app/models'
