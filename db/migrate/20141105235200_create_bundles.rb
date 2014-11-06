class CreateBundles < ActiveRecord::Migration
  def change
    create_table :bundles do |t|
      t.string :title, null: false
      t.boolean :restricted, default: false

      t.timestamps
    end
  end
end
