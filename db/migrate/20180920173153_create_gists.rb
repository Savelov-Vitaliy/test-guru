class CreateGists < ActiveRecord::Migration[5.2]
  def change
    create_table :gists do |t|
      t.references :question, foreign_key: true
      t.references :user, foreign_key: true
      t.string :github_url, null: false
    end

    add_reference :questions, :gists, on_delete: :cascade
    add_reference :users, :gists, on_delete: :cascade
  end
end
