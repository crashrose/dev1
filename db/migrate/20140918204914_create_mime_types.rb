class CreateMimeTypes < ActiveRecord::Migration
  def change
    create_table :mime_types do |t|
      t.string :content_type
      t.string :file_type

      t.timestamps
    end
  end
end
