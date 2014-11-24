class CreateStatCategories < ActiveRecord::Migration
  def change
    create_table :stat_categories do |t|
      t.string :name
      t.integer :order_pos

      t.timestamps
    end
    add_column :stat_lines, :order_pos, :integer
    remove_column :stat_lines, :category
    add_column :stat_lines, :stat_category_id, :integer
    drop_table :stat_line_units
	drop_table :stat_teams
	drop_table :stat_users
	drop_table :stat_line_entry_units
  end
end
