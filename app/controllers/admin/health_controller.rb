class Admin::HealthController < Admin::BaseController
  #before_filter :require_login
  before_filter :authenticate_user!
  verify :method => 'post',
         :only   => 'generate_exception',
         :add_headers => {
           "Allow" => "POST"},
         :render => {
           :text   => 'Method not allowed',
           :status => 405}

  def index
  end

  def generate_exception
    raise RuntimeError
  end
end
