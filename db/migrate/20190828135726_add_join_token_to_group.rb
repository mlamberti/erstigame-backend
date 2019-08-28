class AddJoinTokenToGroup < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :join_token, :string
    add_index :groups, :join_token, unique: true
  end
end
