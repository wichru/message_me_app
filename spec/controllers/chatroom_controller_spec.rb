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
    before do
      user = User.new(username: 'John', password: 'Bonjovi')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    end

    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'fetch message' do
      Message.create(body: 'Hello')

      get :index

      expect(assigns(:message)).to be_a_new(Message)
      expect(assigns(:messages)).to match_array(Message.all)
    end
  end
end
