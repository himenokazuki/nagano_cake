 class Admin::SessionsController < Devise::SessionsController
   def after_sign_in_path_for(resource)
    admin_items_path
   end
 end
