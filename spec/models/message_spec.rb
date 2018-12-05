require 'rails_helper'

RSpec.describe Message, type: :model do
  it { should validate_presence_of(:body) }

  describe 'validations' do
    let(:user) { User.create(username: 'John', password: '0ksymoron1') }
    let(:message) { Message.create(body: body, user: user) }

    subject { message.valid? }

    context 'when it has not have body' do
      let(:body) { nil }

      it "it's invalid" do
        is_expected.to eq false
      end
    end
    context 'when it has body' do
      let(:body) { 'This is a test message' }

      it "it's valid" do
        is_expected.to eq true
      end
    end
  end
end
