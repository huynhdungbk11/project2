class ApplicationController < ActionController::Base
  include CanCan::ControllerAdditions
  protect_from_forgery with: :exception
  before_action :create_cart

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def authorize_admin
    unless current_user.role?
      redirect_to root_path, alert: 'Admins only!'
    end
  end

  private
  def create_cart
    @cart = Cart.build_from_hash session[:cart]
  end
end
