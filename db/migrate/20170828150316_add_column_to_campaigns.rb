class AddColumnToCampaigns < ActiveRecord::Migration[5.0]
  def change
    add_column :campaigns, :completed, :boolean
  end
end
