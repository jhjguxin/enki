module UserHelper
  def show_user(user)
    if user.name.blank?
     user.email
    else
      user.name
    end
  end

end
