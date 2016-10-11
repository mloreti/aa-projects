module ApplicationHelper
  def auth_token
    "<input
      type = \"hidden\"
      name = \"authenticity_token\"
      value = \"#{form_authenticity_token}\"
      >".html_safe
  end

  def name
    current_user.email.split("@")[0].capitalize
  end

  def email_name(user)
    user.email.split("@")[0].capitalize
  end
end
