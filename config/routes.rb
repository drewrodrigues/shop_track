Rails.application.routes.draw do
  resources :sales
  resources :recipes do
    resources :recipe_items
  end
  resources :receipts
  resources :kitchen_items
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
