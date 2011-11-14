class RolesController < ApplicationController
    before_filter :login_required
   #before_filter :not_logged_in_required
  # GET /roles
  # GET /roles.xml
 before_filter :check_administrator_role

   def index
     @user = User.find(params[:user_id])
     @all_roles = Role.find(:all)
   end

   def update
     @user = User.find(params[:user_id])
     @role = Role.find(params[:id])
     unless @user.has_role?(@role.rolename)
       @user.roles << @role
     end
     redirect_to users_path
   end

   def destroy
     @user = User.find(params[:user_id])
     @role = Role.find(params[:id])
     if @user.has_role?(@role.rolename)
       @user.roles.delete(@role)
     end
     redirect_to users_path
   end

 end