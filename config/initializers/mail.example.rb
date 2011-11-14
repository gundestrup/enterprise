 # Email settings

 ActionMailer::Base.smtp_settings = {
    :tls => true,
    :address => "change me",
    :port => "587",
    :domain => "change me",
    :authentication => :plain,
    :user_name => "change me",
    :password => "change me"
  }