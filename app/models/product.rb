# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :category
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :price, presence: true
  has_many_attached :images

  def self.ransackable_attributes(auth_object = nil)
    %w[category category_id created_at description id id_value name price updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[category images_attachments images_blobs]
  end
end
