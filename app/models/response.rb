class Response < ActiveRecord::Base


belongs_to :attendee, :primary_key => :user_id, :foreign_key => :user_id, class_name: "Person"
# has_one :updated_by, :primary_key => :updated_by
# has_one :reviewed_user, :primary_key => :reviewed_user_id
belongs_to :response_reason, :foreign_key => :response_reason_id
belongs_to :response_status, :foreign_key => :response_status_id
has_one :review_status
belongs_to :event_user, :foreign_key => :event_user_id, class_name: "EventUser", inverse_of: :responses
has_one :event, :through => :event_user

scope :active,		-> 		{where(:active => true)}

# self.primary_key = :event_user



end
