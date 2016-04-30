class AddTargetNameToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :target_name, :string
  end
end
