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

  belongs_to :file_type
  has_many :upload_groups, autosave: :true, :dependent => :destroy
  has_many :groups, :through => :upload_groups

  scope :playbooks,    ->    {where(:file_type => FileType.find_by_name('playbook'))}
  scope :resources,    ->    {where(:file_type => FileType.find_by_name('resource'))}
  scope :imports,    ->    {where(:file_type => FileType.find_by_name('import'))}
  scope :instructionals,    ->    {where(:file_type => FileType.find_by_name('instructional'))}
  scope :multimedias,    ->    {where(:file_type => FileType.find_by_name('mutlimeia'))}


end
