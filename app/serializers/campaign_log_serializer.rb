class CampaignLogSerializer < ActiveModel::Serializer
  attributes :id, :log
  has_one :campaign_id
end
