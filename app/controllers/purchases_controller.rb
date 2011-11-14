class PurchasesController < ApplicationController

   before_filter :login_required, :except => [:index, :show, :setlayout, :setcss]
  
  # GET /locations
  # GET /locations.xml

  def index

    #@movies = Movie.search(params[:search])
    @purchases = Purchase.search(params[:search], params[:page],10)
    respond_to do |format|
      format.html # index.html.erb :layout => false
      format.xml  { render :xml => @purchases }
    end

  end

  # GET /movies/1
  # GET /movies/1.xml
  def show
    @purchase = Purchase.find(params[:id])
    @lists = List.find(:all, :conditions => ['purchase_id = ?', @purchase.id])
    @ingrediences = Ingredience.find(:all, :order => 'title')
    @units = Unit.find(:all, :order => 'name')
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @purchase }
    end
  end

  # GET /movies/new
  # GET /movies/new.xml
  def new
    @purchase = Purchase.new
    @units = Unit.find(:all, :order => 'name')
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @purchase }
    end
  end

  # GET /movies/1/edit
  def edit
    @purchase = Purchase.find(params[:id])
    @units = Unit.find(:all, :order => 'name')
  end

  # POST /movies
  # POST /movies.xml
  def create
    @purchase = Purchase.new(params[:purchase])
    respond_to do |format|
      if @purchase.save
        flash[:notice] = 'Purchase was successfully created.'
        format.html { redirect_to(@purchase) }
        format.xml  { render :xml => @purchase, :status => :created, :purchase => @purchase }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @purchase.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /movies/1
  # PUT /movies/1.xml
  def update
    @purchase = Purchase.find(params[:id])

    respond_to do |format|
      if @purchase.update_attributes(params[:purchase])
        flash[:notice] = 'Purchase was successfully updated.'
        format.html { redirect_to(@purchase) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @purchase.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.xml
  def destroy
    @purchase = Purchase.find(params[:id])
    @purchase.destroy

    respond_to do |format|
      format.html { redirect_to(purchase_url) }
      format.xml  { head :ok }
    end
  end
end
