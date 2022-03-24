class MotivationController < ApplicationController
  def index
    @motivations = Motivation.all
  end

  def new
    @motivation = Motivation.new
  end

  def create
    Motivation.create(motivation_params)
    binding.pry
  end

  def motivation_params
    params.require(:motivation).permit(:title, :purchase_date, :category_id, :person, :comment, :intuition, :purpose)
  end

end
