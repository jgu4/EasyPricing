Rails.application.routes.draw do



  # Routes for the User account:
  # Home
  get("/", { :controller => "home", :action => "show" })  


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

  # Routes for the Inventory resource:

  # CREATE
  post("/insert_inventory", { :controller => "inventories", :action => "create" })
          
  # READ
  get("/inventories", { :controller => "inventories", :action => "index" })
  
  get("/inventories/:path_id", { :controller => "inventories", :action => "show" })
  
  # UPDATE
  
  post("/modify_inventory/:path_id", { :controller => "inventories", :action => "update" })
  
  # DELETE
  get("/delete_inventory/:path_id", { :controller => "inventories", :action => "destroy" })

  #------------------------------

  # Routes for the Costing resource:

  # CREATE
  post("/insert_costing", { :controller => "costings", :action => "create" })
          
  # READ
  get("/costings", { :controller => "costings", :action => "index" })
  
  get("/costings/:path_id", { :controller => "costings", :action => "show" })
  
  # UPDATE
  
  post("/modify_costing/:path_id", { :controller => "costings", :action => "update" })
  
  # DELETE
  get("/delete_costing/:path_id", { :controller => "costings", :action => "destroy" })

  #------------------------------

  # Routes for the Store resource:

  # CREATE
  post("/insert_store", { :controller => "stores", :action => "create" })
          
  # READ
  get("/stores", { :controller => "stores", :action => "index" })
  
  get("/stores/:path_id", { :controller => "stores", :action => "show" })
  
  # UPDATE
  
  post("/modify_store/:path_id", { :controller => "stores", :action => "update" })
  
  # DELETE
  get("/delete_store/:path_id", { :controller => "stores", :action => "destroy" })

  #------------------------------

  # Routes for the Classification resource:

  # CREATE
  post("/insert_classification", { :controller => "classifications", :action => "create" })
          
  # READ
  get("/classifications", { :controller => "classifications", :action => "index" })
  
  get("/classifications/:path_id", { :controller => "classifications", :action => "show" })
  
  # UPDATE
  
  post("/modify_classification/:path_id", { :controller => "classifications", :action => "update" })
  
  # DELETE
  get("/delete_classification/:path_id", { :controller => "classifications", :action => "destroy" })

  #------------------------------

  # Routes for the Item resource:

  # CREATE
  post("/insert_item", { :controller => "items", :action => "create" })
          
  # READ
  get("/items", { :controller => "items", :action => "index" })
  
  get("/items/:path_id", { :controller => "items", :action => "show" })
  
  # UPDATE
  
  post("/modify_item/:path_id", { :controller => "items", :action => "update" })
  
  # DELETE
  get("/delete_item/:path_id", { :controller => "items", :action => "destroy" })

  #------------------------------

end
