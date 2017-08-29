class CampaignLogsController < ApplicationController
  before_action :set_campaign_log, only: [:show, :update, :destroy]

  # GET /campaign_logs
  def index
    @campaign_logs = CampaignLog.all

    render json: @campaign_logs
  end

  # GET /campaign_logs/1
  def show
    render json: @campaign_log
  end

  # POST /campaign_logs
  def create
    @campaign_log = CampaignLog.new(campaign_log_params)

    if @campaign_log.save
      render json: @campaign_log, status: :created, location: @campaign_log
    else
      render json: @campaign_log.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /campaign_logs/1
  def update
    if @campaign_log.update(campaign_log_params)
      render json: @campaign_log
    else
      render json: @campaign_log.errors, status: :unprocessable_entity
    end
  end

  # DELETE /campaign_logs/1
  def destroy
    @campaign_log.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign_log
      @campaign_log = CampaignLog.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def campaign_log_params
      params.require(:campaign_log).permit(:campaign_id_id, :log)
    end
end
