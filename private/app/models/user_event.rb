# frozen_string_literal: true

# == Schema Information
#
# Table name: user_events
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  event_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


class UserEvent < ApplicationRecord
  belongs_to :user
  belongs_to :event
end
