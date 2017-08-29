class CreateCampaignLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :campaign_logs do |t|
      t.references :campaign, foreign_key: true
      t.text :log

      t.timestamps
    end
  end
end
