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
    @post = Post.new(post_params)
    (5 - @post.attachment.length).times { @post.attachment.build }
    @post.user=current_user

    delete_empty_attachment
    if @post.save
      respond_to do |format|
        format.html {
          #flash[:notice] = "Created post '#{@post.title}'"
          flash[:notice] = I18n.t("activerecord.attributes.post.create_post_success",:title=>@post.title)
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
    if @post.update_attributes(post_params)
      delete_empty_attachment
      respond_to do |format|
        format.html {
          #flash[:notice] = "Updated post '#{@post.title}'"
          flash[:notice] = I18n.t("activerecord.attributes.post.update_post_success",:title=>@post.title)
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
    (5 - @post.attachment.length).times { @post.attachment.build }
    respond_to do |format|
      format.html {
        render :partial => 'post', :locals => {:post => @post} if request.xhr?
      }
    end
  end

  def new
    @post = Post.new
    (5 - @post.attachment.length).times { @post.attachment.build }
  end

  def preview
    #delete_empty_attachment
    post_params[:attachment_attributes]=[]
    @post = Post.build_for_preview(post_params)

    @post.user=current_user

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
        #flash[:notice] = "Deleted post '#{@post.title}'"
        flash[:notice] = I18n.t("activerecord.attributes.post.delete_post_success",:title=>@post.title)
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

  private
  def post_params
    params.require(:post).permit(
      :title, :body, :tag_list,
      :published_at_natural,
      :slug
    )
  end
  def delete_empty_attachment
    @post.attachment.each do |a|
      if a.image_file_name==nil
        a.destroy
      end
    end
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
