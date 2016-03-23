class AddTwitchTokenToUser < ActiveRecord::Migration
  def change
    add_column :users, :twitch, :string
  end
end
