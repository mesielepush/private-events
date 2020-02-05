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

require 'rails_helper'

RSpec.describe UserEvent, type: :model do
  creator  = User.create(name:  Faker::Name.first_name, email: Faker::Internet.email)
  attendee_1  = User.create(name:  Faker::Name.first_name, email: Faker::Internet.email)
  attendee_2  = User.create(name:  Faker::Name.first_name, email: Faker::Internet.email)
  first_event = Event.new(name: 'Up 1', location: 'Somewhere', date: '2020/12/31', creator: creator).save
  second_event = Event.new(name: 'Up 1', location: 'Somewhere', date: '2021/12/31', creator: creator).save

  it 'register some attendees to an event' do
    first_register = UserEvent.new(user_id: attendee_1.user_id, event_id: first_event.creator_id).save
    expect(first_register).to eql(true)
    expect(attendee_1.attended_events.count).to eq(1)
    expect(first_event.attendees.count).to eq(1)
  end
end
