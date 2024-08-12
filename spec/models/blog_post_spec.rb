# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BlogPost, type: :model do
  # Test validations
  describe 'validations' do
    subject(:blog_post) { build(:blog_post) }

    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_length_of(:title).is_at_most(255) }

    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_length_of(:body).is_at_least(6).is_at_most(70_000) }
  end
end
