module ViewsHelper


	def userlist_popover(group)
		link_to group.name, '#', {title: group.name,
								 :rel => "popover", 
								 "tabindex" => 0, 
								 "data-toggle" => "popover", 
								 "data-trigger" => "focus", 
								 "data-html" => true, 
								 "data-content" => group.org_users.map {|user| user.name}.join("<BR />")
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
		if !orig_groups && !new_groups
			nil
		elsif !orig_groups
			new_list = usergroups_to_s(new_groups).map {|item| {:status => 'Added', :full_name => item[0], :group_list => item[1]}}
		elsif !new_groups || orig_groups == new_groups
			new_list = usergroups_to_s(orig_groups).map {|item| {:status => 'Saved', :full_name => item[0], :group_list => item[1]}}
		else
			orig_users = usergroups_to_s(orig_groups).map {|user| user[0]}
			new_list = Hash[*usergroups_to_s(new_groups).flatten]
			new_users = new_list.keys.flatten
			removed_users = orig_users - new_users
			added_users = new_users - orig_users
			unchanged_users = new_users & orig_users
			removed_list = removed_users.map {|item| {:status => 'Removed', :full_name => item, :group_list => ''}}
			added_list = added_users.map {|item| {:status => 'Added', :full_name => item, :group_list => new_list[item]}}
			unchanged_list = unchanged_users.map {|item| {:status => 'Unchanged', :full_name => item, :group_list => new_list[item]}}
			@combined_list = removed_list + added_list + unchanged_list
			# gebbb
		end
	end



# "people.first_name || ' ' || people.last_name", "listagg(groups.name,',') within group (order by people.first_name || ' ' || people.last_name)"
	def test_userlist(groups)
		User.joins(:groups).includes(:groups).merge(groups).explain #map {|user| user.name}.to_s.html_safe
		# User.joins(:groups).merge(groups).map {|user| "<tr><td>#{user.name}</td><td>#{user.groups.map {|group| group.name}.to_s.html_safe}</td></tr>"}.uniq.join.html_safe
	end

	def usergroup_list(user)

	end

	def delete_link(title, url)
		link_to_icon('destroy', url, {data: {
		:confirm => 'Are you sure?',
		:method => :delete
		}, title: title})
	end

	def link_to_icon(icon_name, url_or_object, data_options={})
		# url_options = {}
		link_to(image_tag("icons/#{icon_name}.png", title: data_options[:title]),
		url_or_object,
		class: "icon #{icon_name}",
		data: data_options[:data] )
	end


# remove_from_team_admin_user_path

# 	def remove_link(title="Remove", url, )
# 		link_to("Remove")
# 	end

# link_to "Remove", approve_admin_attendance_approval_path(:id => response.id, :scope => params[:scope])

end