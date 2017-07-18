class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :actors, :desciption, :description
  end
end
