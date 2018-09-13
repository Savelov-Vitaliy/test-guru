class AddOnDeleteCascade < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :tests, :questions
    add_foreign_key :questions, :tests, on_delete: :cascade
  end
end
