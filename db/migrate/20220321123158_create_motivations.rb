class CreateMotivations < ActiveRecord::Migration[6.0]
  def change
    create_table :motivations do |t|
      t.integer :user_id
      t.string :title, null: false
      t.date :purchase_date, null: false
      t.integer :category_id, null: false
      t.text :person
      t.text :comment
      t.text :intuition
      t.text :purpose, null: false

      t.timestamps
    end
  end
end
