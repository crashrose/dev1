class ChangeFormFieldTypeColName < ActiveRecord::Migration
  def change
  	rename_column :form_fields, :type, :field_type
  end
end
