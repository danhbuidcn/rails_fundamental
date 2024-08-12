# frozen_string_literal: true

class Course < ApplicationRecord
  has_rich_text :description

  validates :title, presence: true, length: { maximum: 255 }
  validates :description, presence: true, length: { minimum: 5, maximum: 7000 }
end
