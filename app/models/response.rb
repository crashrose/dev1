class Response < ActiveRecord::Base


belongs_to :attendee, :primary_key => :user_id, :foreign_key => :user_id, class_name: "Person"

# has_one :updated_by, :primary_key => :updated_by
# has_one :reviewed_user, :primary_key => :reviewed_user_id
belongs_to :response_reason, :foreign_key => :response_reason_id
belongs_to :response_status, :foreign_key => :response_status_id
belongs_to :review_status, :foreign_key => :review_status_id
belongs_to :event_user, :foreign_key => :event_user_id, class_name: "EventUser", inverse_of: :responses
belongs_to :event#, :through => :event_user
has_one :location, :through => :event
has_one :event_type, :through => :event

  belongs_to :organization
  acts_as_tenant(:organization)



  scope :active, -> { where(active: true)}
  scope :all_not_attending,->  {active.where(response_status_id: 4)}
  scope :awaiting_approval,->  {all_not_attending.where(review_status_id: 1)}
  scope :approved,->  {all_not_attending.where(review_status_id: 2)}
  scope :rejected,->  {all_not_attending.where(review_status_id: 3)}

# scope :active,				-> 		{where(:active => true)}
# scope :all_not_attending	->		active.where(:response_status: "No")
# scope :aprv_incomplete,		-> 		{where(:active => true, :review_status => nil)}
# scope :aprv_complete,		-> 		{where(:active => true, :review_status != nil)}
# scope :attending,			-> 		{where(:active => true, :review_status != nil)}


# self.primary_key = :event_user

def self.approval_change(approval_status, selection)
	selection = Response.where("id = ?", selection)
	# current_status = selection.first.review_status.title
	approval_status_id = ReviewStatus.find_by(text: approval_status).id
	selection.update_all("review_status_id = #{approval_status_id}")
	                     # , "reviewed_user_id = #{current_user.id}")
	# self.review_status = approval_status
 #    self.date_reviewed = DateTime.now

	# current_status.gsub(" ", "_")

 #    self.
 #    self.save

end




end
