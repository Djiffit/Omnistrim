class AddSocietyToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :society_id, :integer
  end
end
