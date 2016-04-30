class AddFounderToSociety < ActiveRecord::Migration
  def change
    add_column :societies, :user_id, :integer
  end
end
