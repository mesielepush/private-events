# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #create' do
    it 'returns http success' do
      get :create, params: { user: { name: 'pipipi', email: 'something@mailnodotcom' } }
      expect(response).to have_http_status(:success)
      expect(flash.empty?).to eq(false)
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      user = User.new(name: 'popos', email: 'popos@mail.com')
      user.save
      get :show, params: { id: user.id }
      expect(response).to have_http_status(:success)
    end
  end
end
