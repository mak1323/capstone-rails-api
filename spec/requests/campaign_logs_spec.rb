require 'rails_helper'

RSpec.describe "CampaignLogs", type: :request do
  describe "GET /campaign_logs" do
    it "works! (now write some real specs)" do
      get campaign_logs_path
      expect(response).to have_http_status(200)
    end
  end
end
