class CreateCampaignUserPositions < ActiveRecord::Migration
  def change
    create_table :campaign_user_positions do |t|
      t.integer :campaign_user_id
      t.integer :position_id
      t.integer :organization_id

      t.timestamps
    end

    rename_column :positions, :role_id, :team_role_id
  end
end
