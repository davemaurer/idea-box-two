class Api::V1::IdeasController < ApplicationController
  respond_to :json

  before_action :find_idea, only: [:update, :destroy]

  def index
    @ideas = Idea.all.sort_by(&:created_at).reverse
    respond_with @ideas
  end

  def create
    @idea = Idea.create!(valid_params)
    # respond_with Idea.create!(valid_params)
    render json: @idea
  end

  def update
    respond_with @idea.update_attributes(valid_params)
  end

  def destroy
    respond_with Idea.destroy(params[:id])
  end

  private

  def find_idea
    @idea = Idea.find(params[:id])
  end

  def valid_params
    params.require(:idea).permit(:title, :body, :quality)
  end
end
