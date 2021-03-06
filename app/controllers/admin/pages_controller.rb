class Admin::PagesController < Admin::BaseController
  before_filter :find_page, :only => [:show, :update, :destroy]

  def index
    respond_to do |format|
      format.html {
        @pages = Page.order("created_at DESC").paginate(
          :order => "created_at DESC",
          :page  => params[:page]
        )
      }
    end
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      respond_to do |format|
        format.html {
          flash[:notice] = I18n.t("activerecord.attributes.page.create_page_success",:title=>@page.title)#"Created page '#{@page.title}'"
          redirect_to(:action => 'show', :id => @page)
        }
      end
    else
      respond_to do |format|
        format.html { render :action => 'new',         :status => :unprocessable_entity }
      end
    end
  end

  def update
    if @page.update_attributes(page_params)
      respond_to do |format|
        format.html {
          flash[:notice] = I18n.t("activerecord.attributes.page.update_page_success",:title=>@page.title)#"Updated page '#{@page.title}'"
          redirect_to(:action => 'show', :id => @page)
        }
      end
    else
      respond_to do |format|
        format.html { render :action => 'show',        :status => :unprocessable_entity }
      end
    end
  end

  def show
    respond_to do |format|
      format.html {
        render :partial => 'page', :locals => {:page => @page} if request.xhr?
      }
    end
  end

  def new
    @page = Page.new
  end

  def preview
    @page = Page.build_for_preview(page_params)

    respond_to do |format|
      format.js {
        render :partial => 'pages/page.html.erb', :locals => {:page => @page}
      }
    end
  end

  def destroy
    undo_item = @page.destroy_with_undo

    respond_to do |format|
      format.html do
        flash[:notice] = I18n.t("activerecord.attributes.page.delete_page_success",:title=>@page.title)#"Deleted page '#{@page.title}'"
        redirect_to :action => 'index'
      end
      format.json {
        render :json => {
          :undo_path    => undo_admin_undo_item_path(undo_item),
          :undo_message => undo_item.description,
          :page         => @page.attributes
        }.to_json
      }
    end
  end

  private
  def page_params
    params.require(:page).permit(
      :title, :slug, :body
    )
  end
  def find_page
    @page = Page.find(params[:id])
  end
end
