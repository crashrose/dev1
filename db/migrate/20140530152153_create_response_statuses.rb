class CreateResponseStatuses < ActiveRecord::Migration
  def change
    create_table :response_statuses do |t|
      t.string :title
      t.string :text
      t.integer :position

      t.timestamps
    end
  end
end
