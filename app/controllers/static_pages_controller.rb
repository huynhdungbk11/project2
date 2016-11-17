class StaticPagesController < ApplicationController
  def home
    @products = Product.last Settings.show_product.num_products
  end
end
