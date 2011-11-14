class IngrediencesController < ApplicationController
    before_filter :login_required, :except => [:index, :show, :setlayout, :setcss]
  # GET /ingrediences
  # GET /ingrediences.xml
  def index
    @ingrediences = Ingredience.search(params[:search], params[:page],10)    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ingrediences }
    end
  end

  # GET /ingrediences/1
  # GET /ingrediences/1.xml
  def show
    @ingredience = Ingredience.find(params[:id])
    @meals = Meal.find(:all, :conditions => ['ingredience_id =?', @ingredience.id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ingredience }
    end
  end

  # GET /ingrediences/new
  # GET /ingrediences/new.xml
  def new
    @ingredience = Ingredience.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ingredience }
    end
  end

  # GET /ingrediences/1/edit
  def edit
    @ingredience = Ingredience.find(params[:id])
      
  end

  # POST /ingrediences
  # POST /ingrediences.xml
  def create
    @ingredience = Ingredience.new(params[:ingredience])
    respond_to do |format|
      if @ingredience.save
        flash[:notice] = 'Ingredience was successfully created.'
        #format.html { redirect_to(@ingredience) }
        format.xml  { render :xml => @ingredience, :status => :created, :location => @ingredience }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ingredience.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ingrediences/1
  # PUT /ingrediences/1.xml
  def update
    @ingredience = Ingredience.find(params[:id])

    respond_to do |format|
      if @ingredience.update_attributes(params[:ingredience])
        flash[:notice] = 'Ingredience was successfully updated.'
        format.html { redirect_to(@ingredience) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ingredience.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ingrediences/1
  # DELETE /ingrediences/1.xml
  def destroy
    @ingredience = Ingredience.find(params[:id])
    @ingredience.destroy

    respond_to do |format|
      format.html { redirect_to(ingrediences_url) }
      format.xml  { head :ok }
    end
  end
end
