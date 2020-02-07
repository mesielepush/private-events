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
  creator = User.create(name: Faker::Name.first_name, email: Faker::Internet.email)
  attendee_one = User.create(name: Faker::Name.first_name, email: Faker::Internet.email)
  attendee_two = User.create(name: Faker::Name.first_name, email: Faker::Internet.email)
  first_event = Event.create(name: 'Some Event 1', location: 'Somewhere', date: '2019/12/31', creator: creator)
  second_event = Event.create(name: 'Second Event 2', location: 'Somewhere else', date: '2020/12/31', creator: creator)

  it 'register some attendees to an event' do
    first_register = UserEvent.create(user_id: attendee_one.id, event_id: first_event.id)
    second_register = UserEvent.create(user_id: attendee_two.id, event_id: second_event.id)

    expect(first_register).to be_valid
    expect(attendee_one.attended_events.count).to eq(1)
    expect(first_event.attendees.count).to eq(1)

    expect(second_register).to be_valid
    expect(attendee_two.attended_events.count).to eq(1)
    expect(second_event.attendees.count).to eq(1)
  end
end
