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
    it 'thou shall pass' do
      user = User.new(name: 'popo', email: 'popo@pipi.com').save
      expect(user).to eq(true)
    end
  end
end
