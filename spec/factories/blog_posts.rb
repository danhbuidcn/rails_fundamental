# frozen_string_literal: true

FactoryBot.define do
  factory :blog_post do
    title { 'MyString' }
    body { 'post Text' }
  end
end
