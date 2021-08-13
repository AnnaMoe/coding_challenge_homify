class CampaignsController < ApplicationController

  def index
    @campaigns = Campaign.all
  end

  def show
    @campaign = Campaign.find(params[:id])
    @todo = Todo.new(campaign: @campaign)
  end

  def new
    if current_user.expert
      @campaign = Campaign.new
    else
      redirect_to campaigns_path, notice: 'You are not allowed to create a campaign.'
    end
  end

  def create
    redirect_to campaigns_path, notice: 'You are not allowed to create a campaign.' unless current_user.expert

    @campaign = Campaign.new(campaign_params)
    @campaign.expert = current_user

    if @campaign.save!
       redirect_to @campaign, notice: 'Campaign was successfully created.'
    else
      render :new
    end
  end

  private

   def campaign_params
    params.require(:campaign).permit(:title, :tags, :estimated_duration)
  end

end
