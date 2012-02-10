class PagesController < ApplicationController
  def show
    @page = Page.find_by_slug(params[:id]) || raise(ActiveRecord::RecordNotFound)
    breadcrumbs.add("#{t("menu.pages")}: #{@page.title}",@show)
  end
end
