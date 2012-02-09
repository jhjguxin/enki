class ArchivesController < ApplicationController
  def index
    @months = Post.find_all_grouped_by_month.paginate params[:page]
    breadcrumbs.add("#{t("menu.archives")}",@index)
  end
end
