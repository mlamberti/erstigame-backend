class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.references :group, foreign_key: true
      t.string :name
      t.string :info, null: true
      t.string :picture, null: true

      t.timestamps
    end
  end
end
