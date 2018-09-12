class AddNameAndTypeAttributesToUsers < ActiveRecord::Migration[5.2]

  def change
    change_table :users do |u|
      u.string :type, null: false, default: "User"
      u.string :first_name
      u.string :last_name
    end
    add_index :users, :type
  end

end
