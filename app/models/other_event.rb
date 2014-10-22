class OtherEvent < ActiveRecord::Base

	acts_as :event#, :as => :eventable
end
