class AddYoutubeTokenToUser < ActiveRecord::Migration
  def change
    add_column :users, :youtubetoken, :string
  end
end
