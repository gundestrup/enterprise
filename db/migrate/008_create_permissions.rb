 class CreatePermissions < ActiveRecord::Migration
   def self.up
     create_table :permissions do |t|
       t.integer :role_id, :user_id, :null => false
       t.timestamps
     end
     #Make sure the role migration file was generated first
     Role.create(:rolename => 'administrator')
     #Then, add default admin user
     #Be sure change the password later or in this migration file
     user = User.new
     user.login = "admin"
     user.name = "change me"
     user.email = "change@me.now"
     user.password = "change me"
     user.password_confirmation = "change me"
     user.save(false)
     user.send(:activate!)
     role = Role.find_by_rolename('administrator')
     user = User.find_by_login('admin')
     permission = Permission.new
     permission.role = role
     permission.user = user
     permission.save(false)
   end

   def self.down
     drop_table :permissions
     Role.find_by_rolename('administrator').destroy
     User.find_by_login('admin').destroy
   end
 end