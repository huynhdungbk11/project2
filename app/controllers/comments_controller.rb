class CommentsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def create
    @comment = current_user.comments.new comment_params
    respond_to do |format|
      if @comment.save
        format.json {render json: {comment: @comment, user: current_user,
          avatar: current_user.avatar.url(:thumb)}}
      else
        format.json {render json: {status: t("error")}}
      end
    end
  end

  def update
    @comment.update_attributes comment_params
    if @comment.save
      flash[:success] = t "flash_success_create_product"
      redirect_to :back
    else
      render :new
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.js
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :product_id)
  end
end
