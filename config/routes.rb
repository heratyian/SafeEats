Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: "omniauth_callbacks",
  }

  get 'select_diet', to: 'select_diet#edit'
  patch 'select_diet', to: 'select_diet#update'
  
  root "landing_page#landing"

  resources :diet_types
  resources :ingredients
  
  get "/food" => "compliance#food"
  get "/compliance" => "compliance#check_compliance"
end
