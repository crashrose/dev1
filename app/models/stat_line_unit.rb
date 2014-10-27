class StatLineUnit < ActiveRecord::Base
	has_many :stat_line_entry_units
	has_many :stat_line_entries
	# belongs_to :person, :foreign_key => :unit_id, :primary_key => :user_id

	acts_as_superclass
end
