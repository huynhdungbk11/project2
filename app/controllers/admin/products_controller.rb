class Admin::ProductsController < ApplicationController
  layout "admin_application"
  before_action :load_product, only: [:edit, :destroy, :show]
  before_action :load_categories, only: [:new, :edit, :create]
  load_and_authorize_resource
  before_action :authorize_admin

  def index
    @products = Product.recent.page(params[:page]).per Settings.per_page.products
  end

  def new
    @product = Product.new
    @suggestion = Suggestion.find_by id: params[:object]
  end

  def show
  end

  def edit
  end

  def create
    @product = Product.new product_params
    if @product.save
      if params[:suggestion_id]
        @product.update_suggestion_status params[:suggestion_id]
      end
      flash[:success] = t "flash_success_create_product"
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def update
  end

  def destroy
    if @product.destroy
      flash[:success] = t "flash_success_delete_product"
    else
      flash[:danger] = t "flash_danger_delete_product"
    end
    redirect_to admin_products_path
  end

  private
  def product_params
    params.require(:product).permit :id,
      :category_id, :name, :description, :price, :kind, :image
  end

  def load_product
    @product = Product.find_by id: params[:id]
    unless @product
      flash[:warning] = t "category_isnt_exist"
      redirect_to root_url
    end
  end

  def load_categories
    @categories = Category.all
  end


end
