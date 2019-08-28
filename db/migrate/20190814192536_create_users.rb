class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.references :group, foreign_key: true
      t.string :name, null: false
      t.string :info
      t.string :picture

      t.timestamps
    end
  end
end
