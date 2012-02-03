class ApplicationController < ActionController::Base
  protect_from_forgery
  # mv to posts_controller
  #add_breadcrumb I18n.t("breadcrumbs.homepage"), :root_path

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => t("common.access_denied")
  end

  protected

  def enki_config
    @@enki_config = Enki::Config.default
  end

  def set_seo_meta(title = '',meta_keywords = '', meta_description = '')
    if title.length > 0
      @page_title = "#{title}"
    end
    @meta_keywords = meta_keywords
    @meta_description = meta_description
  end
  helper_method :enki_config
end
