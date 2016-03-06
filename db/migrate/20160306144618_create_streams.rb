class CreateStreams < ActiveRecord::Migration
  def change
    create_table :streams do |t|
      t.string :provider
      t.string :channel

      t.timestamps null: false
    end
  end
end
