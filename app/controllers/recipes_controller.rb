class RecipesController < ApplicationController
    before_filter :login_required, :except => [:index, :show, :setlayout, :setcss]
    before_filter :category_missing_food, :only => [:new]
    
    
    #WYSIWYG editor [:new, :edit])

    # GET /recipes
  # GET /recipes.xml
  def index
    @recipes = Recipe.search(params[:search], params[:page],10)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @recipes }
    end
  end

  # GET /recipes/1
  # GET /recipes/1.xml
  def show
    @recipe = Recipe.find(params[:id])
    @ingrediences = Ingredience.find(:all, :order => 'title')
    @units = Unit.find(:all, :conditions => ['foods = ?', true], :order => 'name')
    @meals = Meal.find(:all, :conditions => ['recipe_id = ?', @recipe.id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @recipe }
    end
  end

  # GET /recipes/new
  # GET /recipes/new.xml
  def new
    @recipe = Recipe.new
    @ingrediences = Ingredience.find(:all)
    @categories = Category.find(:all, :conditions => ["food = ?", true])
    @units = Unit.find(:all)
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @recipe }
    end
  end

  # GET /recipes/1/edit
  def edit
    @recipe = Recipe.find(params[:id])
    @categories = Category.find(:all, :conditions => ["food = ?", true])
    @ingrediences = Ingredience.find(:all, :order => 'title')
  end

  # POST /recipes
  # POST /recipes.xml
  def create
    @recipe = Recipe.new(params[:recipe])
    #@recipe.ingrediences = Ingredience.find(@params[:ingredience_ids]) if @params[:ingredience_ids]
    respond_to do |format|
      if @recipe.save
        flash[:notice] = 'Recipe was successfully created.'
        format.html { redirect_to(@recipe) }
        format.xml  { render :xml => @recipe, :status => :created, :location => @recipe }
      else
        format.html { render :action => "new" }
        @ingrediences = Ingredience.find(:all, :order => 'title')
        @categories = Category.find(:all, :conditions => ["food = ?", true])
        format.xml  { render :xml => @recipe.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /recipes/1
  # PUT /recipes/1.xml
  def update
    @recipe = Recipe.find(params[:id])
    @recipe.ingrediences = Ingredience.find(params[:ingredience_ids]) if params[:ingredience_ids]    
    respond_to do |format|
      if @recipe.update_attributes(params[:recipe])
        flash[:notice] = 'Recipe was successfully updated.'
        format.html { redirect_to(@recipe) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @recipe.errors, :status => :unprocessable_entity }
      end
    end
  end    

    def update_ingredience
    @recipe = Recipe.find(params[:id])
    @recipe.ingrediences = Ingredience.find(params[:ingredience_ids]) if params[:ingredience_ids]
    respond_to do |format|
      if @recipe.update_attributes(params[:recipe])
        flash[:notice] = 'Recipe was successfully updated.'
        format.html { redirect_to(@recipe) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @recipe.errors, :status => :unprocessable_entity }
      end
    end
    end

  # DELETE /recipes/1
  # DELETE /recipes/1.xml
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to(recipes_url) }
      format.xml  { head :ok }
    end
  end
  
end
