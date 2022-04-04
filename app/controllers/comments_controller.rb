class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to motivation_path(@comment.motivation)# コメントと結びつくmotivationの詳細画面に遷移する
    else
      @motivation = @comment.motivation
      @comments = @motivation.comments
      render "motivations/show"
    end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, motivation_id: params[:motivation_id]) #保存ボタンクリックした際の、リクエストのparamsの中の:motivation_idをmotivation_id:に入れ保存させる
  end
end
