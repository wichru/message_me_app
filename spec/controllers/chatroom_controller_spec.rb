require 'rails_helper'

RSpec.describe ChatroomController, type: :controller do
  describe 'not signed user' do
    it 'redirects to login path' do
      get :index

      expect(response).to redirect_to(controller: 'sessions',
                                      action: 'new')
    end
  end

  describe 'signed user' do
    let(:user) { User.new(username: 'John', password: 'Bonjovi') }

    it 'returns http success' do
      log_in user
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
