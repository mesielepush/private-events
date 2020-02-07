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
  before_save { email.downcase! }

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
end
