Rails.application.routes.draw do
  devise_for :models
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "articles#index"
  get 'filter', to: "articles#filter"
  resources :articles do
    resources :comments
  end
  resources :articles do
    resources :likes
  end

end
