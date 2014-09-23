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

	def current_auth_userlist_with_groups(playbook)
		playbook.users.map {|user| "<tr><td>#{user.name}</td><td>#{user.ul_groups(playbook.id)}</td></tr>"}.uniq.join.html_safe
	end

	def usergroups_to_s(groups)
		# User.select(:id).joins(:groups).includes(:groups, :person).merge(Group.select(:name).where(id: groups)).explain
		User.joins(:groups, :person).where(groups: {id: groups})
		.group('users.id', "people.first_name || ' ' || people.last_name")
		.order("people.first_name || ' ' || people.last_name")
		.pluck("people.first_name || ' ' || people.last_name as full_name", "string_agg(groups.name,', ') as group_list")
		
		# User.operation_over_aggregate_column(:id, )
	end

	def usergroup_table(orig_groups, new_groups=nil)
		if !new_groups
			new_list = usergroups_to_s(orig_groups).map {|item| {:status => 'Saved', :full_name => item[0], :group_list => item[1]}}
		else
			orig_users = usergroups_to_s(orig_groups).map {|user| user[0]}
			new_list = Hash[*usergroups_to_s(new_groups).flatten]
			new_users = new_list.keys.flatten
			removed_users = orig_users - new_users
			added_users = new_users - orig_users
			unchanged_users = new_users & orig_users
			removed_list = removed_users.map {|item| {:status => 'Removed', :full_name => item[0], :group_list => ''}}
			added_list = removed_users.map {|item| {:status => 'Added', :full_name => item[0], :group_list => new_list[item[0]]}}
			unchanged_list = removed_users.map {|item| {:status => 'Saved', :full_name => item[0], :group_list => new_list[item[0]]}}
			removed_list + added_list + unchanged_list
		end
	end



# "people.first_name || ' ' || people.last_name", "listagg(groups.name,',') within group (order by people.first_name || ' ' || people.last_name)"
	def test_userlist(groups)
		User.joins(:groups).includes(:groups).merge(groups).explain #map {|user| user.name}.to_s.html_safe
		# User.joins(:groups).merge(groups).map {|user| "<tr><td>#{user.name}</td><td>#{user.groups.map {|group| group.name}.to_s.html_safe}</td></tr>"}.uniq.join.html_safe
	end

	def usergroup_list(user)

	end

end