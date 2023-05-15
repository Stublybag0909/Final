module MicropostsHelper
  # Returns the name for a user
  def username_for(userid)
    @user = User.find_by_id(userid)
    if !@user.nil?
      @user.name
    else
      "orphan"
    end
  end
end
