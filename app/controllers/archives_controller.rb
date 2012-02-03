class ArchivesController < ApplicationController
  def index
    @months = Post.find_all_grouped_by_month.paginate params[:page]
    add_breadcrumb("#{t("posts.archives")}",@index)
  end
end
