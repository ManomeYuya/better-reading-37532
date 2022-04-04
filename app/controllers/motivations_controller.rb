class MotivationsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_motivation, only: [:show, :edit, :update, :destroy]

  def index
    @motivations = Motivation.order("created_at DESC")
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
    @comment = Comment.new
    @comments = @motivation.comments
  end

  def edit
  end

  def update
    @motivation.update(motivation_params)
    if @motivation.save
      redirect_to motivation_path
    else
      render :edit
    end
  end

  def destroy
    @motivation.destroy
  end

  private

  def motivation_params
    params.require(:motivation).permit(:title, :image, :purchase_date, :category_id, :person, :comment, :intuition, :purpose).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index #サインインしていない場合、indexアクションに戻る
    end
  end

  def set_motivation
    @motivation = Motivation.find(params[:id])
  end
  

end
