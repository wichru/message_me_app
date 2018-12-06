require 'rails_helper'

RSpec.describe 'chatroom/index.html.erb', type: :view do
  it 'renders form' do
    assign(:message, Message.new)
    assign(:message, [])

    render

    expect(rendered).to match(messages)
  end
end
