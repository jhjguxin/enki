class Admin::HealthController < Admin::BaseController
  #before_filter :require_login
  before_filter :authenticate_user!

  def index
  end

  def generate_exception
    raise RuntimeError
  end
end
