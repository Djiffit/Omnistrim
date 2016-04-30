class AddTargetUserToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :target_user_id, :integer
  end
end
