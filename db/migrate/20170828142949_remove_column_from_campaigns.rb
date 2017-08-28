class RemoveColumnFromCampaigns < ActiveRecord::Migration[5.0]
  def change
    remove_column :campaigns, :completed, :boolean
  end
end
