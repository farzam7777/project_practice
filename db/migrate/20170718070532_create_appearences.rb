class CreateAppearences < ActiveRecord::Migration
  def change
    create_table :appearences do |t|
      t.integer :movie_id
      t.integer :actor_id

      t.timestamps null: false
    end
  end
end
