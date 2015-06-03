class AddPrivLevelToUsers < ActiveRecord::Migration
  def change

  	add_column :users, :priv_level, :integer

  end
end
