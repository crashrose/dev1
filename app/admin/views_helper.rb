module ViewsHelper


	def userlist_popover(group)
		link_to group.name, '#', {title: group.name,
								 :rel => "popover", 
								 "tabindex" => 0, 
								 "data-toggle" => "popover", 
								 "data-trigger" => "focus", 
								 "data-html" => true, 
								 "data-content" => group.users.map {|user| user.name}.join("<BR />")
								}
	end


	def location_tooltip(location)
		link_to location.name,edit_admin_location_path(location), {title: formatted_loc(location), :rel => "tooltip", "data-toggle" => "tooltip", "data-html" => true}
	end

	def formatted_loc(location)
		location_text = ''
		if !(location.address.blank?) 
			location_text += location.address + '<BR>'
		end
		if !(location.address2.blank?) 
			location_text += location.address2 + '<BR>'
		end
		if !(location.city.blank?) 
			location_text += location.city + ', '
		end
		if !(location.state.blank?) 
			location_text += location.state + ' '
		end
		if !(location.zip.blank?) 
			location_text += location.zip.to_s + '<BR>'
		end
		if location.city.blank? && location.state.blank? && location.zip.blank?
			location_text += '<BR>'
		end
		if !(location.country.blank?) 
			location_text += location.country + '<BR>'
		end
		if !(location.phone.blank?) 
			location_text += number_to_phone(location.phone, area_code: true).to_s + '<BR>'
		end
		if location_text == '<BR>'
			location_text = 'No Data Available'
		end
		location_text.html_safe
	end

end