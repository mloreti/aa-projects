module ApplicationHelper

  def name(user)
    user.email.split("@")[0].capitalize
  end
end
