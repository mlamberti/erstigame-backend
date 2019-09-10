class AddCachedFieldsToGroups < ActiveRecord::Migration[5.2]
  def change
    add_reference :groups, :level, foreign_key: true, null: true
    add_column :groups, :points, :integer, null: false, default: 0
    add_column :groups, :num_catches, :integer, null: false, default: 0
    add_column :groups, :num_places, :integer, null: false, default: 0
    add_column :groups, :num_sponsors, :integer, null: false, default: 0
    add_column :groups, :time_together, :integer, null: false, default: 0
  end
end
