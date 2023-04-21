Rails.application.routes.draw do
  # Routes for the User account:
  
  # HOME
  get("/", :controller => "home", :action => "index")

  # Users
  get("/users", :controller => "user_content", :action => "all_users") 
  get("/users/:name", :controller => "user_content", :action => "user_details")
  post("/user_liked_image", :controller => "user_content", :action => "liked_photos")
  get("/user_unliked_image/:id", :controller => "user_content", :action => "unliked_photos")
  get("/users/:username/liked_photos", :controller => "user_content", :action => "the_user_liked_photos")
  get("/users/:username/feed", :controller => "user_content", :action => "the_user_feed")
  get("/users/:username/discover", :controller => "user_content", :action => "the_user_discover")

  #Photos
  get("/photos", :controller => "photo_content", :action => "public_photos")
  get("/photos/:photo_id", :controller => "photo_content", :action => "photo_details")
  post("/insert_photo", :controller => "photo_content", :action => "create_photo")

  #Comments
  post("/insert_comment", :controller => "comment_content", :action => "create_comment")

  #FollowRequests
  post("/insert_follow_request", :controller => "follow_request_content", :action => "follow_request")


  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
