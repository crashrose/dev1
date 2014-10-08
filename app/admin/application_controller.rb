class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_action :set_org

  set_current_tenant_through_filter
  before_filter :set_org

	private
	def set_org
		# session[:organization_id] = 2
		current_org = Organization.find(2)
		set_current_tenant(current_org)
	end

	# def your_method_that_finds_the_current_tenant
	# 	current_account = Account.find_it
	# 	set_current_tenant(current_account)
	# end
end
