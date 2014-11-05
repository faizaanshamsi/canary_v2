class CreateSubmission < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
