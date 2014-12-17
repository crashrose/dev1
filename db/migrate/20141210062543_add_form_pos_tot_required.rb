class AddFormPosTotRequired < ActiveRecord::Migration
  def change
  	add_column :formation_positions, :num_required, :integer, index: true
  end
end
