class SuggestionsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @suggestions = current_user.suggestions
  end

  def show
  end

  def new
    @suggestion = Suggestion.new
  end

  def create
    @suggestion = current_user.suggestions.new suggestion_params
    if @suggestion.save
      flash[:sucess] = t "suggestion_created_success"
      redirect_to suggestions_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    if @suggestion.destroy
      flash[:sucess] = t "suggestion_deleted_success"
    else
      flash[:danger] = t "suggestion_deleted_fail"
    end
    redirect_to suggestions_path
  end

  private
  def suggestion_params
    params.require(:suggestion).permit :name, :description, :price, :message, :image
  end
end
