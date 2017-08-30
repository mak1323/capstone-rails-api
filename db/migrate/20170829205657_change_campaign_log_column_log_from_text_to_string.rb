class ChangeCampaignLogColumnLogFromTextToString < ActiveRecord::Migration[5.0]
  def change
    change_column :campaign_logs, :log, :string
  end
end
