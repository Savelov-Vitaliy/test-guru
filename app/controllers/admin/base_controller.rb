class Admin::BaseController < ApplicationController

  layout 'admin'

  before_action :authenticate_user!
  before_action :admin_required!

  def admin_section?
    true
  end

  private

  def admin_required!
    redirect_to root_path, alert: t('.authorization_error_message') unless current_user.admin?
  end

end