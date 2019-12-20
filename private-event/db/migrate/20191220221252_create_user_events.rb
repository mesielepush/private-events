class CreateUserEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :user_events do |t|
      t.integer :attendee_id
      t.interger :attended_event_id

      t.timestamps
    end
  end
end
