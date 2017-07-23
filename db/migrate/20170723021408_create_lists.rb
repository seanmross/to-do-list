class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.references :user, index: true, foreign_key: true
      t.boolean :private, default: false

      t.timestamps null: false
    end
  end
end
