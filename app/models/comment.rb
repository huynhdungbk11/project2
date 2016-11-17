class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  scope :newest, ->{order created_at: :desc}
end
