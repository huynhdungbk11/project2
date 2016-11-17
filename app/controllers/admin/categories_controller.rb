class Admin::CategoriesController < ApplicationController
  before_action :load_category, only: [:destroy, :show, :edit]
  before_action :authorize_admin

  def index
    @category = Category.new
    @categories = Category.alphabetically
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    if @category.any_products_inside?
      flash[:danger] = t "category_deleted_fail_cos_product"
    else
      if @category.destroy
        flash[:sucess] = t "category_deleted_success"
      else
        flash[:danger] = t "category_deleted_fail"
      end
    end
    redirect_to admin_categories_path
  end

  def create
    @category = Category.new category_params
    respond_to do |format|
      if @category.save
        format.json{render json: {category: @category}}
      else
        format.json{render json: {status: t("category_form_error")}}
      end
    end
  end

  private
  def category_params
    params.require(:category).permit :name, :description
  end

  def load_category
    @category = Category.find_by id: params[:id]
    unless @category
      flash[:warning] = t "category_isnt_exist"
      redirect_to root_url
    end
  end
end
