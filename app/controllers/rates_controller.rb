class RatesController < ApplicationController

  def create
    @product = Product.find_by id: params[:product_id]
    current_user.rate @product, params[:rate][:rate]
    respond_to do |format|
      format.js
    end
  end

  def update
    @product = Rate.find_by(id: params[:id]).product
    current_user.rerate @product, params[:rate][:rate]
    respond_to do |format|
      format.js
    end
  end
end
