# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'microposts/edit', type: :view do
  let(:micropost) do
    Micropost.create!(
      content: 'MyText',
      user_id: 1
    )
  end

  before(:each) do
    assign(:micropost, micropost)
  end

  it 'renders the edit micropost form' do
    render

    assert_select 'form[action=?][method=?]', micropost_path(micropost), 'post' do
      assert_select 'textarea[name=?]', 'micropost[content]'

      assert_select 'input[name=?]', 'micropost[user_id]'
    end
  end
end
