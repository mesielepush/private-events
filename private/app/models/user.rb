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
#


class User < ApplicationRecord
    has_many(:created_events,  foreign_key: 'creator_id', class_name: 'Event')
end
