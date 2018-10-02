class NewAddOnDeleteCascade < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :questions, :tests
    add_foreign_key :questions, :tests, on_delete: :cascade

    remove_foreign_key :answers, :questions
    add_foreign_key :answers, :questions, on_delete: :cascade
  end
end
