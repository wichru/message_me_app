require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:messages) }
  it { should validate_length_of(:username).is_at_least(3).is_at_most(15) }

  describe 'validations' do
    let(:user) { User.new(username: username, password: '0ksymoron1') }

    context 'when username is too short' do
      let(:username) { 'MW' }

      it "it's invalid" do
        expect(user.valid?).to eq false
      end
    end

    context 'when username is too long' do
      let(:username) { 'ThisIsStupidUsername'}
      it "it's invalid" do
        expect(user.valid?).to eq false
      end
    end

    context 'when username is correct' do
      let(:username) {'MrMaciej'}
      it "it's valid" do
        expect(user.valid?).to eq true
      end
    end
  end
end
