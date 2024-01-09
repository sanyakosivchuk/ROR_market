# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :category
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :price, presence: true
  has_many_attached :images
end
