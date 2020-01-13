class CreateAttendings < ActiveRecord::Migration[6.0]
  def change
    create_table :attendings do |t|
      t.integer :attendee_id
      t.integer :attended_id

      t.timestamps
    end
  end
end
