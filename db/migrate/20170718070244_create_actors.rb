class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
      t.string :name
      t.text :desciption
      t.integer :age

      t.timestamps null: false
    end
  end
end
