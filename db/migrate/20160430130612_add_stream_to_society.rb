class AddStreamToSociety < ActiveRecord::Migration
  def change
    add_column :societies, :stream_id, :integer
  end
end
