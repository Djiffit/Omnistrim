class AddTwitchNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :twitchname, :string
  end
end
