class CampaignLogSerializer < ActiveModel::Serializer
  attributes :id, :log, :title, :campaign
  # has_one :campaign_id

  def campaign
  object.campaign.id
  end
end
