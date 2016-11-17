class CartsController < ApplicationController
  before_action :load_product, only: :update

  def index
    @order = Order.new
  end

  def update
    @cart.add_item params[:id]
    session["cart"] = @cart.sort
  end

  def edit
    item = @cart.find_item params[:id]
    if item.quantity > Settings.item.num_quantitty
      item.decrement
      session["cart"] = @cart.sort
    end
    respond_to do |format|
      format.js {render :update}
    end
  end

  def destroy
    cart = session["cart"]
    item = cart["items"].find{|item| item["product_id"] == params[:id]}
    if item
      cart["items"].delete item
      create_cart
    end
    respond_to do |format|
      format.js {render :update}
    end
  end

  private
  def load_product
    @product = Product.find_by id: params[:id]
    unless @product
      flash[:danger] = t "flash_danger_not_product"
      redirect_to root_path
    end
  end
end
