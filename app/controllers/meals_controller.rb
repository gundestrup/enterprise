class MealsController < ApplicationController

    before_filter :login_required, :except => [:index, :show, :setlayout, :setcss]

    def index
        @meals = Meal.search(params[:search], params[:page],10)
        respond_to do |format|
          format.html # index.html.erb :layout => false
          format.xml  { render :xml => @meals }
        end

    end

    def show
    @meal = Meal.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @meal }
    end
  end

      def new
        @meal = Meal.new
        @recipe = Recipe.find(params[:id])
        @units = Unit.find(:all, :order => 'name')
        @ingrediences = Ingredience.find(:all, :order => 'title')
        respond_to do |format|
          format.html # new.html.erb
          format.xml  { render :xml => @meal }
        end
      end

      # GET /movies/1/edit
      def edit
        @meal = Meal.find(params[:id])
        @units = Unit.find(:all, :order => 'name')
        @ingrediences = Ingredience.find(:all, :order => 'title')
      end

      # POST /movies
      # POST /movies.xml
      def create
        @meal = Meal.new(params[:meal])
        respond_to do |format|
          if @meal.save
            recipeid = @meal.recipe_id
            flash[:notice] = 'Meal was successfully created.'
            #format.html { redirect_to(recipe_url(recipeid), :layout => false) }
            format.xml  { render :xml => @meal, :status => :created, :meal => @meal }
          else
            format.html { render :action => "new" }
            format.xml  { render :xml => @meal.errors, :status => :unprocessable_entity }
          end
        end
      end

      # PUT /movies/1
      # PUT /movies/1.xml
      def update
        @meal = Meal.find(params[:id])
        recipeid = @meal.recipe_id
        respond_to do |format|
          if @meal.update_attributes(params[:meal])
            flash[:notice] = 'Meal was successfully updated.'
            format.html { redirect_to(recipe_url(recipeid)) }
            format.xml  { head :ok }
          else
            format.html { render :action => "edit" }
            format.xml  { render :xml => @lsit.errors, :status => :unprocessable_entity }
          end
        end
      end

      # DELETE /movies/1
      # DELETE /movies/1.xml
      def destroy
        @meal = Meal.find(params[:id])
        recipeid = @meal.recipe_id
        @meal.destroy
        respond_to do |format|
          format.html { redirect_to(recipe_url(recipeid), :layout => false) }
          format.xml  { head :ok }
        end
      end
end
