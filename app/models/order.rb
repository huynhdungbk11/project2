class Order < ApplicationRecord
  attr_accessor :cart

  has_many :items, dependent: :destroy
  belongs_to :user

  after_create :build_items

  scope :recent, ->{order created_at: :desc}

  scope :search_name, ->search do
    joins(:user).where("name LIKE ?", "%#{search}%") if search.present?
  end


  scope :is_accept, ->{where is_accept: 1 , is_confirm: 0}
  scope :not_eccept, ->{where is_accept: 0}
  scope :is_confirm, ->{where is_confirm: 1}



  private
  def build_items
    cart.items.each do |item|
      items.create product_id: item.product_id, number: item.quantity,
        price: item.product.price
    end
  end


end

