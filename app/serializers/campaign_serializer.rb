class CampaignSerializer < ActiveModel::Serializer
  attributes :id, :name, :completed, :campaign_logs
  has_one :user

  def campaign_logs
    object.campaign_logs.pluck(:id)
  end
end
