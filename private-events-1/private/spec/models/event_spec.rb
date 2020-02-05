# frozen_string_literal: true

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

require 'rails_helper'

RSpec.describe Event, type: :model do
  it 'creates several Events and tells you how many are upcoming and how many are past' do
    user = User.create(name:  Faker::Name.first_name, email: Faker::Internet.email)
    Event.create(name: 'Up 1', location: 'Somewhere', date: '2020/12/31', creator: user)
    Event.create(name: 'Up 2', location: 'Elsewhere', date: '2021/12/31', creator: user)
    Event.create(name: 'Pass 1', location: 'Yes sure', date: '2000/01/01', creator: user)
    Event.create(name: 'Pass 2', location: 'Yes sure', date: '1984/01/01', creator: user)

    expect(user.events.past.length).to eq(2)
    expect(user.events.upcoming.length).to eq(2)
  end
end
