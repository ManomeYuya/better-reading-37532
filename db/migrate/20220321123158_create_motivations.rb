class CreateMotivations < ActiveRecord::Migration[6.0]
  def change
    create_table :motivations do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false
      t.date :purchase_date, null: false
      t.integer :category_id, null: false
      t.text :person, null: false
      t.text :comment, null: false
      t.text :intuition, null: false
      t.text :purpose, null: false

      t.timestamps
    end
  end
end
