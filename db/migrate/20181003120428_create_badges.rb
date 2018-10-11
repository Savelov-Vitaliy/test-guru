class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :color, null: false
      t.string :rule,  null: false
      t.string :param

      t.timestamps
    end

    create_table :rewards do |t|
      t.belongs_to :user, index: true
      t.belongs_to :badge, index: true
    end

  end
end
