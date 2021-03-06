class SearchController < ApplicationController
  def index
    search_text = params[:q]
    #@search = Sunspot.search(Post, Comment)
    @search = Post.search do

      keywords search_text, :highlight => true
      with(:published_at).less_than Time.now
      fulltext search_text, :highlight => true
      #paginate :page => params[:page], :per_page => 10
      order_by :published_at, :desc
    end
    unless @search.results.blank?
      return @results_paginate=@search.results.paginate(params[:page])
    end
    #breakpoint
    set_seo_meta("#{t("menu.search")}: #{params[:q]}")
    #drop_breadcrumb("#{t("common.search")}: #{params[:q]}")
    breadcrumbs.add("#{t("menu.search")}: #{params[:q]}",search_path)

  end


end
