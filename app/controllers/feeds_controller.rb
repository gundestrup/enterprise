class FeedsController < ApplicationController
  before_filter :login_required, :unless => [:is_it_xml?, :is_it_json?, :is_it_rss?, :is_it_atom?]
  # GET /feeds
  # GET /feeds.xml
  def index
    @feeds = Feed.find(:all)

    respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @feeds }
        format.json  { render :json => @feeds }
        format.rss  { render :layout => false }
        format.atom  { render :layout => false }
    end
  end

  # GET /feeds/1
  # GET /feeds/1.xml
  def show
    @feed = Feed.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      #format.xml  { render :xml => @feed }
    end
  end

  # GET /feeds/new
  # GET /feeds/new.xml
  def new
    @feed = Feed.new

    respond_to do |format|
      format.html # new.html.erb
      #format.xml  { render :xml => @feed }
    end
  end

  # GET /feeds/1/edit
  def edit
    @feed = Feed.find(params[:id])
  end

  # POST /feeds
  # POST /feeds.xml
  def create
    @feed = Feed.new(params[:feed])

    respond_to do |format|
      if @feed.save
        flash[:notice] = 'Feed was successfully created.'
        format.html { redirect_to(feeds_url) }
       # format.xml  { render :xml => @feed, :status => :created, :location => @feed }
      else
        format.html { render :action => "new" }
        #format.xml  { render :xml => @feed.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /feeds/1
  # PUT /feeds/1.xml
  def update
    @feed = Feed.find(params[:id])

    respond_to do |format|
      if @feed.update_attributes(params[:feed])
        flash[:notice] = 'Feed was successfully updated.'
        format.html { redirect_to(feeds_url) }
        #format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        #format.xml  { render :xml => @feed.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /feeds/1
  # DELETE /feeds/1.xml
  def destroy
    @feed = Feed.find(params[:id])
    @feed.destroy

    respond_to do |format|
      format.html { redirect_to(feeds_url) }
      #format.xml  { head :ok }
    end
  end
  
  def sort
    params[:feeds].each_with_index do |id, index|
      Feed.update_all(['position=?', index+1], ['id=?', id])
    end
    render :nothing => true
  end
end
