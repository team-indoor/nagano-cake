module ApplicationHelper

  def display_header_name(user)
    if user.is_active?
      "ようこそ、#{user.last_name}さん！"
    else
      "退会済みのユーザー"
    end
  end

end
