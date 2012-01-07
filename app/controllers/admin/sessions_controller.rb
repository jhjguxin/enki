class Admin::SessionsController < Devise::SessionsController
#  before_filter :authenticate_user!

protected

  def successful_login
    session[:logged_in] = true
    redirect_to(admin_root_path)
  end

  def allow_login_bypass?
    %w(development test).include?(Rails.env)
  end
  helper_method :allow_login_bypass?
end
