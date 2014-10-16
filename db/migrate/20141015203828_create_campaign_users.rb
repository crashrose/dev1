class CreateCampaignUsers < ActiveRecord::Migration
  def change
    create_table :campaign_users do |t|
      t.integer :campaign_id
      t.integer :user_id
      t.integer :team_role_id
      t.integer :organization_id

      t.timestamps
    end
  end
end
