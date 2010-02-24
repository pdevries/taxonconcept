require 'active_record/fixtures'

class LoadSeData < ActiveRecord::Migration

  def self.up
    down
    directory = File.join("db/migrate/", "dev_data")
    Fixtures.create_fixtures(directory, "ses")
  end

  def self.down
   Se.delete_all
  end
end
