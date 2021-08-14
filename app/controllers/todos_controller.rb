class TodosController < ApplicationController

  def create
    @campaign = Campaign.find(params[:campaign_id])
    @todo = Todo.new(todo_params)
    @todo.campaign = @campaign
    @todo.user = current_user

    if @todo.save
      redirect_to campaign_path(@campaign)
    else
      flash[:alert] = "Your todo could not be saved."
      render 'campaigns/show'
    end
  end

  private
  def todo_params
    params.require(:todo).permit(:name)
  end
end