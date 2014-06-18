class CreateFormFields < ActiveRecord::Migration
  def change
    create_table :form_fields do |t|
      t.string :name
      t.integer :form_id
      t.integer :max_length
      t.integer :min_length
      t.boolean :required
      t.string :type

      t.timestamps
    end
  end
end
