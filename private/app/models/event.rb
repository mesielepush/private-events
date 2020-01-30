# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :string
#  location    :string
#  description :text
#  date        :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  creator_id  :integer
#

class Event < ApplicationRecord
    belongs_to(:creator, class_name: 'User')
    has_many(:attendees, through: :user_events, foreign_key: :attendee_id)
    has_many(:user_events, foreign_key: :attended_event_id)
end
