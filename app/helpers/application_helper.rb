module ApplicationHelper
  def user_signed_in?
    !!session[:user_id]
  end

  def current_user
    if session[:user_id]
      return User.find(session[:user_id])
    else
      nil
    end
  end

  def parse_time(string)
    year = string.split("/").last
    month = string.split("/").first
    date = string.split("/")[1]
    DateTime.new(year.to_i, month.to_i, date.to_i)
  end

  def convert_condition(int)
    case int
    when "1"
      "Brand New"
    when "2"
      "Like New"
    when "3"
      "Pretty Shitty"
    end
  end
end
