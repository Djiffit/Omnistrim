class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :nmae

      t.timestamps null: false
    end
  end
end
