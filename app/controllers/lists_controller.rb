class ListsController < ApplicationController
       before_filter :login_required, :except => [:index, :show, :setlayout, :setcss]

      # GET /locations
      # GET /locations.xml

      def index
        @lists = List.search(params[:search], params[:page],10)
        respond_to do |format|
          format.html # index.html.erb :layout => false
          format.xml  { render :xml => @lists }
        end

      end

      # GET /movies/1
      # GET /movies/1.xml
      def show
        @list = List.find(params[:id])
        respond_to do |format|
          format.html # show.html.erb
          format.xml  { render :xml => @list }
        end
      end

      # GET /movies/new
      # GET /movies/new.xml
      def new
        @list = List.new
        @purchase = Purchase.find(params[:id])
        @ingrediences = Ingredience.find(:all, :order => 'title')
        @units = Unit.find(:all, :order => 'name')
        respond_to do |format|
          format.html # new.html.erb
          format.xml  { render :xml => @list }
        end
      end

      # GET /movies/1/edit
      def edit
        @list = List.find(params[:id])
        @ingrediences = Ingredience.find(:all, :order => 'title')
        @units = Unit.find(:all, :order => 'name')
      end

      # POST /movies
      # POST /movies.xml
      def create
        @list = List.new(params[:list])
        respond_to do |format|
          if @list.save
            purchaseid = @list.purchase_id
            flash[:notice] = 'List was successfully created.'
            #format.html { redirect_to(purchase_url(purchaseid), :layout => false) }
            format.xml  { render :xml => @list, :status => :created, :list => @list }
          else
            format.html { render :action => "new" }
            format.xml  { render :xml => @list.errors, :status => :unprocessable_entity }
          end
        end
      end

      # PUT /movies/1
      # PUT /movies/1.xml
      def update
        @list = List.find(params[:id])
        purchaseid = @list.purchase_id
        respond_to do |format|
          if @list.update_attributes(params[:list])
            flash[:notice] = 'List was successfully updated.'
            format.html { redirect_to(purchase_url(purchaseid)) }
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
        @list = List.find(params[:id])
        purchaseid = @list.purchase_id
        @list.destroy
        respond_to do |format|
          format.html { redirect_to(purchase_url(purchaseid), :layout => false) }
          format.xml  { head :ok }
        end
      end

end
