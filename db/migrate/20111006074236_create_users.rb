class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.String :project_url
      t.string :name
      t.string :password

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
