# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe 'GET #show' do
    it 'returns http success' do
      creator = User.new(name: 'SomeUser', email: 'somemail@example.com')
      event1 = Event.new(name: 'Event 1', location: 'Somewhere', date: '2022/01/01', description: 'djahdkjahskdjhaskdjhas', creator: creator)
      event1.save
      get :index, params: { id: event1.id }
      expect(response).to have_http_status(:success)
    end
  end
end
