require 'rails_helper'

RSpec.describe RegistrationController, type: :controller do

  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    context 'when user has valid params' do
      let(:valid_params) do
        { user: { username: 'John', password: 'test123' } }
      end

      let(:invalid_params) do
        { user: { username: 'fo', password: 'test123' } }
      end

      it 'creates user' do
        expect do
          post :create, params: valid_params
        end.to change(User, :count).by(1)
        expect(response).to redirect_to(root_path)
      end

      it 'checks user length' do
        expect do
          post :create, params: invalid_params
        end.not_to change(User, :count)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
