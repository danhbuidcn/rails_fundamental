# frozen_string_literal: true

class Course < ApplicationRecord
  has_rich_text :description

  validates :title, presence: true, length: { maximum: 255 }
  validates :description, presence: true, length: { maximum: 7000, minimum: 5 }
end
