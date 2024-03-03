# frozen_string_literal: true

class User < ApplicationRecord
  has_many :microposts

  validates :email, length: { maximum: 255 }, presence: true, uniqueness: true
  validates :name, length: { maximum: 255 }, presence: true
end
