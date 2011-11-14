class MoviesController < ApplicationController
  before_filter :login_required
  before_filter :category_missing_film, :only => [:new]
  # GET /cds
  #before_filter :not_logged_in_required, :only => :show
  # GET /movies
  # GET /movies.xml
  
  def index

    @movies = Movie.search(params[:search], params[:page],10)
    @total = Movie.total(params[:search])
    respond_to do |format|
      format.html # index.html.erb :layout => false      
      format.xml  { render :xml => @movies }
    end

  end

  # GET /movies/1
  # GET /movies/1.xml
  def show
    @movie = Movie.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @movie }
    end
  end

  # GET /movies/new
  # GET /movies/new.xml
  def new
    @movie = Movie.new
    @movie.user_id = current_user.id
    @categories = Category.find(:all, :conditions => ["film = ?", true], :order => 'name')
    @locations = Location.find(:all)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @movie }
    end
  end

  # GET /movies/1/edit
  def edit
    @movie = Movie.find(params[:id])
    @categories = Category.find(:all, :conditions => ["film = ?", true], :order => 'name')
    @locations = Location.find(:all)
  end

  # POST /movies
  # POST /movies.xml
  def create
    @movie = Movie.new(params[:movie])
    @movie.user_id = current_user.id
    respond_to do |format|
      if @movie.save
        flash[:notice] = 'Movie was successfully created.'
        format.html { redirect_to(@movie) }
        format.xml  { render :xml => @movie, :status => :created, :location => @movie }
      else
        format.html { render :action => "new" }
        @categories = Category.find(:all, :conditions => ["film = ?", true], :order => 'name')
        @locations = Location.find(:all)
        format.xml  { render :xml => @movie.errors, :status => :unprocessable_entity }

      end
    end
  end

  # PUT /movies/1
  # PUT /movies/1.xml
  def update
    @movie = Movie.find(params[:id])

    respond_to do |format|
      if @movie.update_attributes(params[:movie])
        flash[:notice] = 'Movie was successfully updated.'
        format.html { redirect_to(@movie) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @movie.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.xml
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    respond_to do |format|
      format.html { redirect_to(movies_url) }
      format.xml  { head :ok }
    end
  end

end
