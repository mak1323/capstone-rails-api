class AddColumnToCampaignLogs < ActiveRecord::Migration[5.0]
  def change
    add_column :campaign_logs, :title, :string
  end
end
