Motivationaltext::Application.routes.draw do

  devise_for :user

  resources :user

  root :to => "home#index"

end
