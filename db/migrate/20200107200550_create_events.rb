class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.text :description
      t.integer :creator_id
      t.integer :user_id
      t.date :date
      t.string :title

      t.timestamps
    end
  end
end
