module ActiveAdmin
  module Sortable
  	module TableMethods
  		HANDLE = ActiveAdmin::Iconic.icon(:move_vertical)

		def sortable_handle_column
        	column '', :class => "activeadmin-sortable" do |resource|
				# sort_url, query_params = resource_path(resource).split '?', 2
				query_params = resource_path(resource).split '?', 2
				sort_url, query_params = resource.class.name.tableize+'/'+resource.id.to_s
				sort_url += "/sort"
				sort_url += "?" + query_params if query_params
				content_tag :span, HANDLE, :class => 'handle', 'data-sort-url' => sort_url
       		end
		end
  	end
  end
end

