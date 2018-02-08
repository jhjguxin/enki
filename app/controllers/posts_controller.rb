class PostsController < ApplicationController
  #add_breadcrumb I18n.t("breadcrumbs.first"),  :first_path
  #add_breadcrumb I18n.t("breadcrumbs.second"), :second_path, :only => %w(second)
  #add_breadcrumb I18n.t("breadcrumbs.third"),  :third_path,  :only => %w(third)
  def index
    @tag = params[:tag]
    @posts = Post.find_recent(:tag => @tag).includes(:tags).paginate params[:page]

#    add_breadcrumb I18n.t("menu.posts"),  @index_path
    if not @tag.nil?
      #add_breadcrumb I18n.t("breadcrumbs.homepage"), :root_path
    #else
      breadcrumbs.add("#{t("menu.posts")}: #{@tag}",@index)
    end
    
    respond_to do |format|
      format.html
      format.atom { render :layout => false }
    end
  end

  def show
    @post = Post.find_by_permalink(*([:year, :month, :day, :slug].collect {|x| params[x] } << {:include => [:approved_comments, :tags]}))
    @comment = Comment.new
    breadcrumbs.add("#{t("common.read_post")}: #{@post.title}",@show)
  end
end
