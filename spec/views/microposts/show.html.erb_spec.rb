# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'microposts/show', type: :view do
  before(:each) do
    assign(:micropost, Micropost.create!(
                         content: 'MyText',
                         user_id: 2
                       ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
  end
end
