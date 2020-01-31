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
    has_many(:user_events)
    has_many(:attendees, through: :user_events, source: :user)
    scope :upcoming, -> { where('date > ?', Time.zone.now) }
    scope :past, -> { where('date <= ?', Time.zone.now) }

    validates :date, presence: true
end
