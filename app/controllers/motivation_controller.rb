class MotivationController < ApplicationController
  def index
    @motivations = Motivation.all
  end

  def new
    @motivation = Motivation.new
  end

  def create
    @motivation = Motivation.new(motivation_params)
    if @motivation.save
      redirect_to  root_path
    else
      render :new
  end
 end

  def show
    @motivation = Motivation.find(params[:id])
  end

  def edit
    @motivation = Motivation.find(params[:id])
  end

  def update
    @motivation = Motivation.find(params[:id])
    @motivation.update(motivation_params)
    if @motivation.save
      redirect_to motivation_path
    else
      render :edit
    end
  end

  def destroy
    @motivation = Motivation.find(params[:id])
    @motivation.destroy
  end

  private

  def motivation_params
    params.require(:motivation).permit(:title, :image, :purchase_date, :category_id, :person, :comment, :intuition, :purpose).merge(user_id: current_user.id)
  end

end
