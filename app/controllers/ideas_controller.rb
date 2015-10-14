class IdeasController < ApplicationController
  respond_to :html, :json

  before_action :find_idea, only: [:update, :destroy]

  def index
    @ideas = Idea.all
  end

  def create
    idea = Idea.new(valid_params)
    if idea.save
      respond_with()
    else
      render json: {status: :error}
    end
  end

  def update
    @idea.update_attributes(valid_params)
    # render partial: 'ideas/idea', locals: {idea: @idea}, layout: false
  end

  def destroy
    @idea.destroy
    render json: {status: :success}
  end

  private

  def find_idea
    @idea = Idea.find(params[:id])
  end

  def valid_params
    params.require(:idea).permit(:title, :body, :quality)
  end
end
