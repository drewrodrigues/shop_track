Rails.application.routes.draw do
  resources :combineds do
    resources :combined_items
  end

  resources :recipe_processed_items
  resources :processed_items
  resources :sales
  resources :recipes do
    resources :recipe_items
    resources :recipe_processed_items
  end
  resources :receipts
  resources :kitchen_items
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
