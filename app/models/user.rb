# frozen_string_literal: true

class User < ApplicationRecord
  validates :email, length: { maximum: 255 }, presence: true, uniqueness: true
  validates :name, length: { maximum: 255 }, presence: true
end
