# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:name, 1) { |n| "Example #{n}" }
    sequence(:email, 1) { |n| "test#{n}@example.com" }
    password { 'MyString' }
  end
end
