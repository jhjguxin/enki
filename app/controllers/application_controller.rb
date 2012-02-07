class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale
 
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { :locale => I18n.locale }
  end

  # mv to posts_controller
  add_breadcrumb I18n.t("breadcrumbs.homepage"), @root_path

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
