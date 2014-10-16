class CampaignDtToDate < ActiveRecord::Migration
  def change
  	change_column :campaigns, :start_date, :date
  	change_column :campaigns, :end_date, :date
  end
end
