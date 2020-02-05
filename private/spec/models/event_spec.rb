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
  context 'validation test' do
    it 'creates a valid Event' do
      user = User.new(name: 'ooooo', email: 'ooooo@ooooo.com').save
      event_test = user.events.build(name: 'event', location: 'somewhere 1001', date: Time.now, description: 'Some description for some Event.')
      expect(event_test).to eql(true)
    end
  end
end
