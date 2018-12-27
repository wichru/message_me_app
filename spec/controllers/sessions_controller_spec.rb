require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:create_user) do
    @user = User.create(username: 'John', password: 'test123')
  end

  let(:create_session) do
    post :create, params: { session: { username: username, password: password } }
  end

  let(:username) { @user.username }
  let(:password) { @user.password }

  describe 'POST #create' do
    before(:each) do
      create_user
      create_session
    end

    context 'when user has valid params' do
      it 'redirect to the root path' do
        expect(response).to redirect_to(root_path)
        expect(flash[:success]).to eq('You have successfully logged in')
      end

      context 'when user is already logged in' do
        it 'redirect to the root path and shows an error' do
          post :create, params: { session: { username: username, password: password } }

          expect(flash[:error]).to eq('You are already logged in')
          expect(response).to redirect_to(root_path)
        end
      end
    end

    context 'when user has invalid params' do
      let(:password) { 'somepass' }

      it 'render new action' do
        expect(assigns(:user)).not_to eq create_user
        expect(response).to render_template(:new)
      end

      it 'shows error message' do
        expect(flash[:error]).to eq('incorect password or email try again')
      end
    end
  end

  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'DELETE #destroy' do
    context 'when user want to log out' do
      it 'redirect to login with message' do
        create_user
        create_session
        delete :destroy, session: { user_id: nil }

        expect(response).to redirect_to(login_path)
        expect(flash[:success]).to eq('You have successfully logged out')
      end
    end
  end
end
