class Admin::PostsController < Admin::BaseController
  before_filter :find_post, :only => [:show, :update, :destroy]

  def index
    respond_to do |format|
      format.html {
        @posts = Post.order("created_at DESC").paginate(
          :page  => params[:page]
        )
      }
    end
  end

  def create
    @post = Post.new(params[:post])
    @post.user=current_user
    if @post.save
      respond_to do |format|
        format.html {
          flash[:notice] = "Created post '#{@post.title}'"
          redirect_to(:action => 'show', :id => @post)
        }
      end
    else
      respond_to do |format|
        format.html { render :action => 'new',         :status => :unprocessable_entity }
      end
    end
  end

  def update
    #breakpoint
    if params.member?("post_attachment_destroy") && params[:post_attachment_destroy]=='1'
      @post.attachment=nil
    end
    if @post.update_attributes(params[:post])
      respond_to do |format|
        format.html {
          flash[:notice] = "Updated post '#{@post.title}'"
          redirect_to(:action => 'show', :id => @post)
        }
      end
    else
      respond_to do |format|
        format.html { render :action => 'show',        :status => :unprocessable_entity }
      end
    end
  end

  def show
    #breakpoint
    respond_to do |format|
      format.html {
        render :partial => 'post', :locals => {:post => @post} if request.xhr?
      }
    end
  end

  def new
    @post = Post.new
  end

  def preview
    @post = Post.build_for_preview(params[:post])
    @post.user=current_user
    #breakpoint
    respond_to do |format|
      format.js {
        render :partial => 'posts/post.html.erb', :locals => {:post => @post}
      }
    end
  end

  def destroy
    undo_item = @post.destroy_with_undo

    respond_to do |format|
      format.html do
        flash[:notice] = "Deleted post '#{@post.title}'"
        redirect_to :action => 'index'
      end
      format.json {
        render :json => {
          :undo_path    => undo_admin_undo_item_path(undo_item),
          :undo_message => undo_item.description,
          :post         => @post.attributes
        }
      }
    end
  end

  protected

  def find_post
    @post = Post.find(params[:id])
  end
end
