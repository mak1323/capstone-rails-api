# class CampaignsController < ApplicationController
class CampaignsController < ProtectedController
  before_action :set_campaign, only: [:show, :update, :destroy]

  # GET /campaigns
  def index
    @campaigns = current_user.campaigns.all

    render json: @campaigns
  end

  # GET /campaigns/1
  def show
    render json: @campaign
  end

  # POST /campaigns
  def create
    @campaign = Campaign.new(campaign_params)

    if @campaign.save
      render json: @campaign, status: :created, location: @campaign
    else
      render json: @campaign.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /campaigns/1
  def update
    if @campaign.update(campaign_params)
      render json: @campaign
    else
      render json: @campaign.errors, status: :unprocessable_entity
    end
  end

  # DELETE /campaigns/1
  def destroy
    @campaign.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign
      @campaign = current_user.campaigns.find(params[:id])
    end


    # Only allow a trusted parameter "white list" through.
    def campaign_params
      params.require(:campaign).permit(:user_id, :name, :completed)
    end
end
