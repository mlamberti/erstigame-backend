class AddInvalidatedToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :invalidated, :boolean, null:false, default: false
  end
end
