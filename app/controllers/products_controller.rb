class ProductsController < ApplicationController
  load_and_authorize_resource

  def index
    @categories = Category.all
    params[:filter_by] = :all if params[:filter_by].blank?
    @products = params[:filter_by] == :all ? Product.all :
      Product.send(params[:filter_by])
    @products = @products.search_name(params[:search]).by_category(params[:category_id])
      .page(params[:page]).per Settings.per_page.products
  end

  def show
    @product = Product.find_by id: params[:id]
    @comments = @product.comments.newest.page(params[:page]).per Settings.per_page.comments
    unless @product
      flash[:danger] = t "flash_danger_not_product"
      redirect_to root_path
    end
  end
end
