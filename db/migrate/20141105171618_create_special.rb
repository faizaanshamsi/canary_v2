class CreateSpecial < ActiveRecord::Migration
  def change
    create_table :specials do |t|
      t.string :name, null: false

      t.index :name, unique: true
      t.timestamps
    end
  end
end
