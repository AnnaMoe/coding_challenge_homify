class TodosController < ApplicationController

def create
    @campaign = Campaign.find(params[:campaign_id])
    @todo = Todo.new(todo_params)
    @todo.campaign = @campaign
    if @todo.save
      redirect_to campaign_path(@campaign)
    else
      render 'campaigns/show'
    end
  end

  private
  def todo_params
    params.require(:todo).permit(:name)
  end
end