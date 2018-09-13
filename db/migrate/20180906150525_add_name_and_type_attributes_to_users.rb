class AddNameAndTypeAttributesToUsers < ActiveRecord::Migration[5.2]

  def change
    change_table :users do |u|
      u.string :type, null: false, default: "User", index: true
      u.string :first_name
      u.string :last_name
    end
  end

end
