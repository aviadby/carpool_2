Rails.application.routes.draw do
  # Routes for the Spot resource:

  # CREATE
  get("/spots/new", { :controller => "spots", :action => "new_form" })
  post("/create_spot", { :controller => "spots", :action => "create_row" })

  # READ
  get("/spots", { :controller => "spots", :action => "index" })
  get("/spots/:id_to_display", { :controller => "spots", :action => "show" })

  # UPDATE
  get("/spots/:prefill_with_id/edit", { :controller => "spots", :action => "edit_form" })
  post("/update_spot/:id_to_modify", { :controller => "spots", :action => "update_row" })

  # DELETE
  get("/delete_spot/:id_to_remove", { :controller => "spots", :action => "destroy_row" })

  #------------------------------

  # Routes for the Ride resource:

  # CREATE
  get("/rides/new", { :controller => "rides", :action => "new_form" })
  post("/create_ride", { :controller => "rides", :action => "create_row" })

  # READ
  get("/rides", { :controller => "rides", :action => "index" })
  get("/rides/:id_to_display", { :controller => "rides", :action => "show" })

  # UPDATE
  get("/rides/:prefill_with_id/edit", { :controller => "rides", :action => "edit_form" })
  post("/update_ride/:id_to_modify", { :controller => "rides", :action => "update_row" })

  # DELETE
  get("/delete_ride/:id_to_remove", { :controller => "rides", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
