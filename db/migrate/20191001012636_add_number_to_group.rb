class AddNumberToGroup < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :number, :integer, null: false, unique: true
  end
end
