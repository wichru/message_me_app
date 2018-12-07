require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'POST #create' do
    context 'when password is correct' do
      let(:user) { User.create(username: 'John', password: 'test123') }
      it 'redirect to root path' do
        post :create, session: { username: 'John', password: 'test123' }

        expect(response).to have_http_status(:redirect)
      end
    end

    context 'when password is incorrect' do
      let(:user) { User.create(username: 'John', password: 'test123') }

      it 'set the error message and render new' do
        post :create, session: { username: 'John', password: '' }

        expect(response).to have_http_status(:render)
      end
    end
  end

  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
end
