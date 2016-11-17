class Category < ApplicationRecord
  has_many :products

  validates :name, presence: true, length: {maximum: 140}
  validates :description, presence: true;

  scope :update_desc, ->{order updated_at: :desc}
  scope :alphabetically, ->{order :name}

  def any_products_inside?
    products.any?
  end
end
