module NavigationHelper
  def page_links_for_navigation
    link = Struct.new(:name, :url)
    [link.new(I18n.t("breadcrumbs.homepage"), root_path),
     link.new(I18n.t("menu.archives"), archives_path)] +
      Page.all.collect {|page| link.new(page.title, page_path(page.slug))}
  end

  def category_links_for_navigation
    link = Struct.new(:name, :url,:class,:rel)
    @popular_tags ||= Tag.all.reject {|tag| tag.taggings.empty? }.sort_by {|tag| tag.taggings.size }.reverse
    #@popular_tags.collect {|tag| link.new("%s(%d)" % [tag.name,tag.taggings_count], posts_path(:tag => tag.name),tag.taggings_count.to_s) }
    #breakpoint
    @popular_tags.collect {|tag| link.new(tag.name,posts_path(:tag => tag.name),"%d in tag '%s'" % [tag.taggings_count,tag.name],tag.taggings_count) }
  end

  def recent_comments_for_navigation
    Comment.joins(:post).limit(5).reverse_order
  end

  def recent_posts_for_navigation
    Post.joins(:user).limit(10).reverse_order
  end

  def class_for_tab(tab_name, index)
    classes = []
    classes << 'current' if "admin/#{tab_name.downcase}" == params[:controller]
    classes << 'first'   if index == 0
    classes.join(' ')
  end
end
