class AddIconToStream < ActiveRecord::Migration
  def change
    add_column :streams, :icon, :string
  end
end
