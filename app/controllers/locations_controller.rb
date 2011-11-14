class LocationsController < ApplicationController

    before_filter :login_required, :except => [:index, :show, :setlayout, :setcss]

  #before_filter :not_logged_in_required, :only => :show
  # GET /locations
  # GET /locations.xml

  def index

    #@movies = Movie.search(params[:search])
    @locations = Location.search(params[:search], params[:page],10)
    respond_to do |format|
      format.html # index.html.erb :layout => false
      format.xml  { render :xml => @locations }
    end

  end

  # GET /movies/1
  # GET /movies/1.xml
  def show
    @location = Location.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @location }
    end
  end

  # GET /movies/new
  # GET /movies/new.xml
  def new
    @location = Location.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @location }
    end
  end

  # GET /movies/1/edit
  def edit
    @location = Location.find(params[:id])
  end

  # POST /movies
  # POST /movies.xml
  def create
    @location = Location.new(params[:location])
    respond_to do |format|
      if @location.save
        flash[:notice] = 'Location was successfully created.'
        format.html { redirect_to(@location) }
        format.xml  { render :xml => @location, :status => :created, :location => @location }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @location.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /movies/1
  # PUT /movies/1.xml
  def update
    @location = Location.find(params[:id])

    respond_to do |format|
      if @location.update_attributes(params[:location])
        flash[:notice] = 'Location was successfully updated.'
        format.html { redirect_to(@location) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @location.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.xml
  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    respond_to do |format|
      format.html { redirect_to(locations_url) }
      format.xml  { head :ok }
    end
  end

end
