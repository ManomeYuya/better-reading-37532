class CreateMotivations < ActiveRecord::Migration[6.0]
  def change
    create_table :motivations do |t|

      t.timestamps
    end
  end
end
