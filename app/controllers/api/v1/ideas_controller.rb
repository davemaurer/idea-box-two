class Api::V1::IdeasController < ApplicationController
  respond_to :json

  before_action :find_idea, only: [:update, :destroy]

  def index
    @ideas = Idea.all.sort_by(&:created_at).reverse
    respond_with @ideas
  end

  def create
    idea = Idea.new(valid_params)
    if idea.save
      respond_with idea
    else
      render json: {status: :error}
    end
  end

  def update
    respond_with @idea.update(valid_params)
  end

  def destroy
    respond_with @idea.destroy
  end

  private

  def find_idea
    @idea = Idea.find(params[:id])
  end

  def valid_params
    params.require(:idea).permit(:title, :body, :quality)
  end
end
