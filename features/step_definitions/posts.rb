Given /there is at least one post tagged "([\w\s]+)"/ do |tag_name|
  Factory(:post=>[Factory(:post, :user=>Factory(:user))], :tags => [Factory(:tag, :name => tag_name)])
end

Given /there is at least one post titled "([\w\s]+)"/ do |title|
  Factory(:post=>[Factory(:post, :user=>Factory(:user))],:title => title)
end

Given /a post with comments exists/ do
  Factory(:post=>[Factory(:post, :user=>Factory(:user))], :comments => [Factory(:comment), Factory(:comment)])
end
