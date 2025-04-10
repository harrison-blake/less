Rails.application.routes.draw do
  root "pages#home"
  get "/about", to: "pages#about"
  get "/dashboard", to: "dashboard#show"

  get    "/login",  to: "sessions#new"
  post   "/login",  to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get  "/signup", to: "users#new"
  post "/signup", to: "users#create"

  get "/profile", to: "users#show"
  get "/profile/edit", to: "users#edit"
  patch "/profile", to: "users#update"
end
