class AddUserCreatorToEvents < ActiveRecord::Migration[6.0]
  def change
    add_reference :events, :creator, foreign_key: true
  end
end
