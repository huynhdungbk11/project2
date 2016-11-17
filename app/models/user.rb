class User < ApplicationRecord
  rolify
  after_create :assign_default_role
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    :omniauthable, :omniauth_providers => [:facebook, :twitter]

  has_many :suggestions
  has_many :orders
  has_many :active_rates, class_name: Rate.name,
    foreign_key: :user_id, dependent: :destroy
  has_many :rating, through: :active_rates, source: :product
  has_many :comments

  enum role: {admin: 0, user: 1}

  has_attached_file :avatar, styles: {mini: Settings.avatar.mini,
    medium: Settings.avatar.medium,
    thumb: Settings.avatar.thumb},
    default_url: Settings.avatar.default_url
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def self.from_omniauth auth
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.password = Devise.friendly_token[0,20]
    end
  end

  def assign_default_role
    self.add_role :newuser if self.roles.blank?
  end

  def rate product, value
    active_rates.create product_id: product.id, rate: value
    product.update_attributes rating: product.raters.average(:rate)
  end

  def rerate product, value
    active_rates.find_by(product_id: product.id).update_attributes rate: value
    product.update_attributes rating: product.raters.average(:rate)
  end

  def rating? product
    rating.include?product
  end

  def is_user? user
    self == user
  end
end
