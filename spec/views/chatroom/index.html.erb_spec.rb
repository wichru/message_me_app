require 'rails_helper'

RSpec.describe 'chatroom/index.html.erb', type: :view do
  pending 'renders form' do
    assign(:message, Message.new)
    assign(:message, [])

    render

    expect(rendered).to match(messages)
  end
end
