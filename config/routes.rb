Rails.application.routes.draw do
  root :to => "courses#index"
  # Routes for the Slot resource:
  # CREATE
  get "/slots/new", :controller => "slots", :action => "new"
  post "/create_slot", :controller => "slots", :action => "create"

  # READ
  get "/slots", :controller => "slots", :action => "index"
  get "/slots/:id", :controller => "slots", :action => "show"

  # UPDATE
  get "/slots/:id/edit", :controller => "slots", :action => "edit"
  post "/update_slot/:id", :controller => "slots", :action => "update"

  # DELETE
  get "/delete_slot/:id", :controller => "slots", :action => "destroy"
  #------------------------------

  # Routes for the Schedule resource:
  # CREATE
  get "/schedules/new", :controller => "schedules", :action => "new"
  post "/create_schedule", :controller => "schedules", :action => "create"

  # READ
  get "/schedules", :controller => "schedules", :action => "index"
  get "/schedules/:id", :controller => "schedules", :action => "show"

  # UPDATE
  get "/schedules/:id/edit", :controller => "schedules", :action => "edit"
  post "/update_schedule/:id", :controller => "schedules", :action => "update"

  # DELETE
  get "/delete_schedule/:id", :controller => "schedules", :action => "destroy"
  #------------------------------

  # Routes for the Course resource:
  # CREATE
  get "/courses/new", :controller => "courses", :action => "new"
  post "/create_course", :controller => "courses", :action => "create"

  # READ
  get "/courses", :controller => "courses", :action => "index"
  get "/courses/:id", :controller => "courses", :action => "show"

  # UPDATE
  get "/courses/:id/edit", :controller => "courses", :action => "edit"
  post "/update_course/:id", :controller => "courses", :action => "update"

  # DELETE
  get "/delete_course/:id", :controller => "courses", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
