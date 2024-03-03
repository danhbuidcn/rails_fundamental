# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/index', type: :view do
  before(:each) do
    assign(:users, [
             User.create!(
               name: 'Name',
               email: 'Email1'
             ),
             User.create!(
               name: 'Name',
               email: 'Email2'
             )
           ])
  end

  it 'renders a list of users' do
    render
    cell_selector = 'tr>td'
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Email1'.to_s), count: 1
    assert_select cell_selector, text: Regexp.new('Email1'.to_s), count: 1
  end
end
