# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper    
  def iphone_user_agent?
      user_agent = request.env["HTTP_USER_AGENT"]
      mobile = user_agent && user_agent.index("Mobile/")
      !!(mobile && user_agent.index("Safari", mobile + 8))
    end
end
