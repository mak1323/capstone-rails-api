require "rails_helper"

RSpec.describe CampaignLogsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/campaign_logs").to route_to("campaign_logs#index")
    end

    it "routes to #new" do
      expect(:get => "/campaign_logs/new").to route_to("campaign_logs#new")
    end

    it "routes to #show" do
      expect(:get => "/campaign_logs/1").to route_to("campaign_logs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/campaign_logs/1/edit").to route_to("campaign_logs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/campaign_logs").to route_to("campaign_logs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/campaign_logs/1").to route_to("campaign_logs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/campaign_logs/1").to route_to("campaign_logs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/campaign_logs/1").to route_to("campaign_logs#destroy", :id => "1")
    end

  end
end
