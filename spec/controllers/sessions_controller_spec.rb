require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:create_user) { @user = User.create(username: 'John', password: 'test123') }

  describe 'POST #create' do

    context 'when user is logged in' do
      it 'loads correct user details and redirect to the root path' do
        create_user
        post :create, params: { session: { username: @user.username, password: @user.password } }
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when user has invalid params' do
      before do
        create_user
        post :create, params: { session: { username: @user.username, password: 'somepass' } }
      end

      it 'render new action' do
        expect(assigns(:user)).not_to eq create_user
        expect(response).to redirect_to(action: 'new')
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
