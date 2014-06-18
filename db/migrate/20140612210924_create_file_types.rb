class CreateFileTypes < ActiveRecord::Migration
  def change
    create_table :file_types do |t|
      t.string :name
      t.string :mime_type

      t.timestamps
    end
  end
end
