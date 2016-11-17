class Admin::SuggestionsController < ApplicationController
  layout "admin_application"
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @suggestions = Suggestion.all
  end

  def edit
  end

  def destroy
    if @suggestion.destroy
      flash[:success] = t "suggestion.deleted"
      redirect_to admin_suggestions_path
    else
      flash[:warning] = t "suggestion.delete_fail"
      redirect_to root_path
    end
  end

  private
  def suggestion_params
    params.require(:suggestion).permit :name, :description, :price, :message, :image
  end
end
