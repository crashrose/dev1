class ChgFieldTypeToTitle < ActiveRecord::Migration
  def change
  	rename_column :mime_types, :file_type, :title
  end
end
