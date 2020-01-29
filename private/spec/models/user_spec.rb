# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation test' do
    it 'thou shall pass' do
      user = User.new(name: 'popo', email: 'popo@pipi.com').save
      expect(user).to eq(true)
    end
  end
end
