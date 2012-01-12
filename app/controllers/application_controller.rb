class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => t("common.access_denied")
  end

  protected

  def enki_config
    @@enki_config = Enki::Config.default
  end
  helper_method :enki_config
end
