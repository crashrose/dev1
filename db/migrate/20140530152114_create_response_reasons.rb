class CreateResponseReasons < ActiveRecord::Migration
  def change
    create_table :response_reasons do |t|
      t.string :title
      t.integer :position

      t.timestamps
    end
  end
end
