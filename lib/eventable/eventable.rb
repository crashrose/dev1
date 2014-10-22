module Eventable
  def acts_as_eventable
    include InstanceMethods
    ############################ Class methods ################################
    has_one :event, :as => :eventable, :autosave => true, :dependent => :destroy
    alias_method_chain :event, :build
    
    event_attributes = Event.content_columns.map(&:name) #<-- gives access to all columns of Business
    # define the attribute accessor method
    def eventable_attr_accessor(*attribute_array)
      attribute_array.each do |att|
        define_method(att) do
          event.send(att)
        end
        define_method("#{att}=") do |val|
          event.send("#{att}=",val)
        end
      end
    end
    eventable_attr_accessor *event_attributes #<- delegating the attributes
  end
 
  module InstanceMethods
    def event_with_build
      event_without_build || build_event
    end
  end
end