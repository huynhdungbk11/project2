class Admin::OrdersController < ApplicationController
  layout "admin_application"
  before_action :load_order, only: [:show, :destroy]
  before_action :authorize_admin

  def index
    # @orders = Order.recent.page(params[:page]).per 3
      # @orders = Order.search_accept(params[:search]).page(params[:page]).per 3
    # @orders = Order.load_or_filter(params)
    #   .where("order.user_id = ? OR order.user_id IS NULL", current_user.id)

    params[:filter_by] = :all if params[:filter_by].blank?
    @orders = params[:filter_by] == :all ? Order.all :
      Order.send(params[:filter_by])
    @orders = @orders.search_name(params[:search])
      .page(params[:page]).per 3
  end

  def show
  end

  def update
    @orders = Order.find_by id: params[:id]
      if @orders.update_attributes order_params
        UserMailer.sample_email(@orders).deliver_now
        flash[:success] = t "flash.success_message"
      else
        flash[:danger] = t "flash.danger_message"
      end
      redirect_to admin_orders_path
  end

  def destroy
    if @order.destroy
      flash[:success] = t "flash_success_destroy"
    else
      flash[:danger] = t "flash_fails_destroy"
    end
    redirect_to admin_orders_path
  end

  private
  def order_params
    params.require(:order).permit :is_accept
  end

  def load_order
    @order = Order.find_by id: params[:id]
    unless @order
      flash[:danger] = t "flash_danger_not_order"
      redirect_to root_path
    end
  end
end
