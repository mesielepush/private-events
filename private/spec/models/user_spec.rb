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

require 'rails_helper'

RSpec.describe User, type: :model do
  
  context 'validation test' do
    it 'creates a valid User' do
      user = User.new(name: 'popo', email: 'popo@pipi.com').save
      expect(user).to eq(true)
    end
  end
  
  it 'is not valid without name' do
    user = User.new( email: 'popop@pipi.com')
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'is not valid for duplicated emails' do
    User.new(name: 'popopo', email: 'popos@pipi.com').save
    t = User.new(name: 'popopo', email: 'popos@pipi.com').save
    expect(t).to eq(false)
  end

end
