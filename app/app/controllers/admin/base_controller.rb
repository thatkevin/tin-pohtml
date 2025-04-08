class Admin::BaseController < ApplicationController
  layout 'admin'
  before_action :require_login
  
  # Ensure all admin controllers inherit from this base controller
  # for consistent layout and authentication
end