class CommentsController < ApplicationController

  def new
    @campaign = Campaign.find(params[:campaign_id])
    if (params[:todo_id])
      @todo = Todo.find(params[:todo_id])
    else
      # need this declaration of nil, because the simple_form asks for the @todo variable
      @todo = nil
    end
    @comment = Comment.new
  end

  def create
    @campaign = Campaign.find(params[:campaign_id])
    @comment = Comment.new(comment_params)
    # do not need @ for todo, because this variable is not used on the view
    if (params[:todo_id])
      todo = Todo.find(params[:todo_id])
      @comment.receiver = todo
    else
      @comment.receiver = @campaign
    end
    
    
    if @comment.save!
      redirect_to campaign_path(@campaign)
    else
      render 'comments/new'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:title)
  end
end
