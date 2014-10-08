

class Upload < ActiveRecord::Base
	has_attached_file :document
	# , :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	# validates_attachment_content_type :document, :content_type => /\Aimage\/.*\Z/
	validates_attachment :document, :presence => true,
  :content_type => {
  	:content_type =>
  	%w[application/pdf image/jpeg image/gif image/png audio/mpeg
  		audio/mpeg text/csv text/plain text/rtf video/mp4 video/ogg
  		video/mpeg video/avi video/quicktime video/x-flv video/x-ms-wmv
  		application/msword
  		application/vnd.openxmlformats-officedocument.wordprocessingml.document
  		application/vnd.ms-excel
  		application/vnd.openxmlformats-officedocument.spreadsheetml.sheet
  		application/vnd.ms-powerpoint
  		application/vnd.openxmlformats-officedocument.presentationml.presentation]
  		},
  :size => { :in => 0..2000.kilobytes }

  acts_as_taggable
  acts_as_taggable_on

  belongs_to :file_type, :foreign_key => :file_type_id, :primary_key => :id, inverse_of: :uploads
  has_many :upload_groups, autosave: :true, :dependent => :destroy
  has_many :groups, :through => :upload_groups
  has_many :groups_users, :through => :groups
  has_many :users, :through => :groups_users
  has_one :mime_type, :primary_key => :document_content_type, :foreign_key => :content_type

  belongs_to :organization
  acts_as_tenant(:organization)


  scope :playbooks,       ->    {where(:file_type => FileType.playbook)}
  scope :resources,       ->    {where(:file_type => FileType.resource)}
  scope :imports,         ->    {where(:file_type => FileType.import)}
  scope :instructionals,  ->    {where(:file_type => FileType.instructional)}
  scope :multimedias,     ->    {where(:file_type => FileType.multimedia)}


  # def upload_users
  #   groups.users
  # end

end
