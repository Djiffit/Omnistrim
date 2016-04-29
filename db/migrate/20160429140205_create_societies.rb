class CreateSocieties < ActiveRecord::Migration
  def change
    create_table :societies do |t|
      t.string :name
      t.string :abbreviation
      t.text :description

      t.timestamps null: false
    end
  end
end
