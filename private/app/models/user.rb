# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class User < ApplicationRecord
  has_many(:events, foreign_key: 'creator_id', class_name: 'Event')
  has_many(:user_events)
  has_many(:attended_events, through: :user_events, source: :event)
  validates :name, presence: true, length: { maximum: 50, minimum: 2 }
  validates :email, presence: true, uniqueness: { case_sensitive: true }
  before_save { email.downcase! }
end
