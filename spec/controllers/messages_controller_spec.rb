require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  describe 'signed user' do
    before do
      user = User.create!(username: 'John', password: 'test123')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    end

    describe 'GET #create' do
      it 'create message' do
        expect do
          post :create, params: { message: { body: 'Please work!' } }
        end.to change(Message, :count).by(1)
        expect(response).to have_http_status(:redirect)
      end
    end
  end
end
