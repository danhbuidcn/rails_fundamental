# frozen_string_literal: true

class BlogPost < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { minimum: 6, maximum: 70_000 }
end
