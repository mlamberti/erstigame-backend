class RenameLevelLevelToRank < ActiveRecord::Migration[5.2]
  def change
    rename_column :levels, :level, :rank
  end
end
