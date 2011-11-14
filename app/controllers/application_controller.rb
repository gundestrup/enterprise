# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  include AuthenticatedSystem
  #before_filter :not_logged_in_required, :only => :setlayout
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery #:secret => '0306ffa800ef09de38cbe03a467122d1'

  
  if  1==2 #@session[:layout] == 'lcars'
            layout 'lcars', :except => [ :rss, :atom, :xml ]
      else
            layout 'application', :except => [ :rss, :atom, :xml ]
  end


  def setcss
        session[:css] = params[:css]
        redirect_to :controller => controller_name, :action => 'index'
  end

  def setlayout
        session[:layout] = params[:layout]
        redirect_to :controller => controller_name, :action => 'index'
  end
  
    protected

    def log_error(exception)
      super(exception)

      begin
        ErrorMailer.deliver_snapshot(
          exception,
          clean_backtrace(exception),
          session.instance_variable_get("@data"),
          params,
          request.env)
      rescue => e
        logger.error(e)
      end
    end
    
    def is_it_xml?
      request.format.xml?
    end
    
    def is_it_json?
      request.format.json?
    end
    
    def is_it_rss?
      request.format.rss?
    end
    
    def is_it_atom?
      request.format.atom?
    end
    
    def category_missing_food
      if Category.find(:all, :conditions => ["food = ?", true]).empty?
        flash[:error] = "Missing category, please create one"
        redirect_to(new_category_url)
      else
      
      end
    end
    
    def category_missing_film
      if Category.find(:all, :conditions => ["film = ?", true]).empty?
        flash[:error] = "Missing category, please create one"
        redirect_to(new_category_url)
      else
      
      end
    end
    
            
end
