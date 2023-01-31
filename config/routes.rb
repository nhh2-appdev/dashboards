Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

# Define the "/homepage" URL route
  get("/", { :controller => "application", :action => "homepage"})

# Define the "/forex" URL route
  get("/forex", { :controller => "currencies", :action => "first_currency"})

end
