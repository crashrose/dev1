module ApplicationHelper

	def link_to_icon(icon_name, url_or_object, data_options={})
		# url_options = {}
		link_to(image_tag("icons/#{icon_name}.png", title: data_options[:title]),
		url_or_object,
		class: "icon #{icon_name}",
		data: data_options[:data] )
	end

	def dom_class_first(object, array)
		if (object == array.first)
			return "first"
		end
		nil
	end

	def list_icons(item, actions=[:new])
		if item.kind_of?(Array)
			url_options = item
		else
			url_options = []
			url_options << item
		end
		main_item = url_options.last
		icon_string = []
		actions.each do |action| 
			if action == :delete
				icon_string << link_to_icon('destroy', item, {data: {
				:confirm => 'Are you sure?',
				:method => :delete
				}, title: "Delete #{main_item.class.name.titleize}"}) 
			elsif action == :show
				icon_string << link_to_icon(action.to_s, url_for(url_options), title: "#{action.to_s.humanize} #{main_item.class.name.titleize}") 

			else
				url_options.unshift action
				icon_string << link_to_icon(action.to_s, url_for(url_options), title: "#{action.to_s.humanize} #{main_item.class.name.titleize}") 
				url_options.shift
			end				
		end
	return icon_string.join(' ').html_safe
	end


	def event_title_links(event)
		content_tag :h1 do
			[ event.name,
				link_to_icon('new', new_event_path(event), title: 'New Event'),
				link_to_icon('show', event, title: 'Show Event Details'),
				link_to_icon('edit', edit_event_path(event), title: 'Edit Event Details'),
				link_to_icon('destroy', event, {data: {
					:confirm => 'Are you sure?',
					:method => :delete
					}, title: 'Delete Event'})
			].join(' ').html_safe
		end
	end

	def event_type_title_links(event_type)
		content_tag :h1 do
			[ event_type.title,
				link_to_icon('new', new_event_type_path(event_type), title: 'New Event Type'),
				link_to_icon('show', event_type, title: 'Show Event Type Details'),
				link_to_icon('edit', edit_event_type_path(event_type), title: 'Edit Event Type Details'),
				link_to_icon('destroy', event_type, {data: {
					:confirm => 'Are you sure?',
					:method => :delete
					}, title: 'Delete Event Type'})
			].join(' ').html_safe
		end
	end

	def sortable(column, title = nil)
		title ||= column.titleize
		class_name = column == sort_column ? "current #{sort_direction}" : nil
		direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
 		link_to title, {:sort => column, :dir => direction}, class: class_name

	end

end
