class AddIndices < ActiveRecord::Migration[5.2]
  def change
    add_index :tests, :level
  end
end
