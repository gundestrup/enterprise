class CategoriesController < ApplicationController
     before_filter :login_required, :except => [:show, :setlayout, :setcss]
   #before_filter :not_logged_in_required, :only => [:index, :show,:setlayout]
    # GET /categories
      # GET /categories.xml
      def index

        @categories = Category.search(params[:search], params[:page],10)
        if params[:type] == 'movie'
            @categories = Category.fsearch(params[:search], params[:page],10)
        end

        if params[:type] == 'recipe'
            @categories = Category.rsearch(params[:search], params[:page],10)
        end

        if params[:type] == 'music'
            @categories = Category.msearch(params[:search], params[:page],10)
        end

        respond_to do |format|
          format.html # index.html.erb
          format.xml  { render :xml => @categories }
        end

      end

      # GET /categories/1
      # GET /categories/1.xml
      def show
        @category = Category.find(params[:id])
        @recipes = Recipe.find(:all, :conditions => ['category_id = ?', @category.id], :order => 'title')

        @movies = Movie.find(:all, :conditions => ['category_id = ?', @category.id], :order => 'title, year')
        @movietotal = Movie.catcount(@category.id)
        
        respond_to do |format|
          format.html # show.html.erb
          format.xml  { render :xml => @category }
        end
      end

      # GET /categories/new
      # GET /categories/new.xml
      def new
        @category = Category.new
        #@category.user_id = current_user.id
        respond_to do |format|
          format.html { render :layout => true } # new.html.erb
          format.xml  { render :xml => @category }
        end
      end

      # GET /categories/1/edit
      def edit
        @category = Category.find(params[:id])
      end

      # POST /categories
      # POST /categories.xml
      def create
        @category = Category.new(params[:category])

        respond_to do |format|
          if @category.save
            flash[:notice] = 'Category was successfully created.'
            format.html { redirect_to(categories_url) }
            format.xml  { render :xml => @category, :status => :created, :location => @category }
          else
            format.html { render :action => "new" }
            format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
          end
        end
      end

      # PUT /categories/1
      # PUT /categories/1.xml
      def update
        @category = Category.find(params[:id])

        respond_to do |format|
          if @category.update_attributes(params[:category])
            flash[:notice] = 'Category was successfully updated.'
            format.html { redirect_to(@category) }
            format.xml  { head :ok }
          else
            format.html { render :action => "edit" }
            format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
          end
        end
      end

      # DELETE /categories/1
      # DELETE /categories/1.xml
      def destroy
        @category = Category.find(params[:id])
        @category.destroy

        respond_to do |format|
          format.html { redirect_to(categories_url) }
          format.xml  { head :ok }
        end
      end

      def live_search
          @searchstring = params[:searching]
          @phrase = request.raw_post || request.query_string
          a1 = "%"
          a2 = "%"
          @searchphrase = a1 + @phrase + a2
          @results = Movie.find(:all, :conditions => [ "title LIKE ?", @searchphrase])

          @number_match = @results.length

          render(:layout => false)

      end

        def search
            items_per_page = 10

        sort = case params['sort']
               when "name"  then "name"
               when "name_reverse"  then "name DESC"
               end


        conditions = ["title LIKE ?", "%#{params[:search]}%"]
        @total = Category.count(:all, :conditions => conditions)
        if request.xml_http_request?
          render :partial => "category_search", :layout => false
        end

          @categories = Category.paginate :per_page => items_per_page, :page => params[:page],
                                          :conditions => conditions,
                                          :order => sort
        end
end
