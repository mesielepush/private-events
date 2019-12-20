class User < ApplicationRecord
  has_many :created_events, foreign_key: 'creator_id', class_name: 'Event'
  has_many :user_events, foreign_key: :attendee_id
  has_many :attended_events, through: :user_events

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  def upcoming_events
    upc_events = []
    attended_events.each do |event|
      upc_events.push(event) if event.date_event >= Time.zone.now
    end
    upc_events
  end

  def previous_events
    past_ev = []
    attended_events.each do |event|
      past_ev.push(event) if event.date_event < Time.zone.now
    end
    past_ev
  end
end
