class ModMimeTypeAssoc < ActiveRecord::Migration
  def change
  	remove_column :file_types, :mime_type
  end
end
