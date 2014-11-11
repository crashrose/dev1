class StatLineEntryInstance < ActiveRecord::Base
  require 'activerecord-tableless'
  # require 'tzinfo'
  # require 'active_support/time_with_zone'
  # require 'active_support'
  # require 'rubygems'

extend  ActiveRecord::Tableless::SingletonMethods

  belongs_to :stat_line_entry
  has_one :stat_line, :through => :stat_line_entry
  has_many :stat_line_items, :through => :stat_line
  # has_many :stat_line_item_entries,

  has_no_table

  after_initialize :build_items

  column :stat_line_entry_id#, ccc

  # def attributes_from_column_definition
  #   []
  # end

# def self.columns
#     @columns ||= [ActiveRecord::ConnectionAdapters::Column.new('stat_line_entry_id', nil, nil, true)]
#   end

  # def self.column(name, sql_type = nil, default = nil, null = true)
  #   columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, sql_type.to_s, null)
  # end


def build_items

  self.stat_line_entry.stat_line.stat_line_items.each do |line_item|
    
    # self.attributes[line_item.id.to_s] = ''
    # StatLineEntryInstance.columns << ActiveRecord::ConnectionAdapters::Column.new("id_#{line_item.id.to_s}", line_item.title, nil, true)
    # send("#{line_item.id.to_s}", line_item.title)
    instance_variable_set("@id_#{line_item.id.to_s}", line_item.title)
    # define_method("#{line_item.id.to_s}=") do |val|
    #     instance_variable_set("@#{name}", val)
    # end
    # define_method("#{line_item.id.to_s}") do 
    #     instance_variable_get("@#{line_item.id.to_s}")
    # end
    # self.column(line_item.title.to_sym)
  end
  # zzz
end

def self.build_instance(stat_line_entry)
  StatLineEntryInstance.tableless_options[:columns] = []
  StatLineEntryInstance.columns << ActiveRecord::ConnectionAdapters::Column.new("stat_line_entry_id", stat_line_entry.id, nil, true)
  line_item_hash = {}
  stat_line_entry.stat_line.stat_line_items.each do |line_item|
    
    # self.attributes[line_item.id.to_s] = ''
    StatLineEntryInstance.columns << ActiveRecord::ConnectionAdapters::Column.new("id_#{line_item.id.to_s}", line_item.title, nil, true)
    # send("#{line_item.id.to_s}", line_item.title)
    line_item_hash["id_#{line_item.id.to_s}".to_sym] = line_item.title
    # instance_variable_set("@id_#{line_item.id.to_s}", line_item.title)
    # self.column(line_item.title.to_sym)
  end

end

 # def initialize(attributes = {})
 #    unless attributes.nil?
 #      attributes.each do |name, value|
 #        send("#{name}=", value)
 #      end
 #    end
 #  end

  # column :id, :string
  # column :g_cal_event_id, :string
  # column :g_iCal_uid, :string
  # column :native_event_id, :integer
  # column :title, :string
  # column :description, :string
  # column :start, :datetime
  # column :end, :datetime
  # column :start_tz
  # column :end_tz
  # column :allDay, :boolean
  # column :url, :string
  # column :location
  # column :g_cal_id
  # column :g_cal_tz
  # column :is_shared, :boolean
end