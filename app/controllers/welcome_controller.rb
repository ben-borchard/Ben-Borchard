class WelcomeController < ApplicationController

	skip_before_action :require_permissions
  
  	def index
  	end
end
