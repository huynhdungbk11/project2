class Rate < ApplicationRecord
  belongs_to :user, class_name: User.name
  belongs_to :product, class_name: Product.name

  validates :user_id, presence: true
  validates :product_id, presence: true
end
