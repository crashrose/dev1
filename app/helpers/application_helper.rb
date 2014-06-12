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
		
		icon_string = []
		actions.each do |action| 
			if action == :delete
				icon_string << link_to_icon('destroy', item, {data: {
				:confirm => 'Are you sure?',
				:method => :delete
				}, title: "Delete #{item.class.name.titleize}"}) 
			elsif action == :show
				icon_string << link_to_icon(action.to_s, url_for([item]), title: "#{action.to_s.humanize} #{item.class.name.titleize}") 

			else
				icon_string << link_to_icon(action.to_s, url_for([action, item]), title: "#{action.to_s.humanize} #{item.class.name.titleize}") 
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

end
