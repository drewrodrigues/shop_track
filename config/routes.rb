Rails.application.routes.draw do
  root 'kitchen_items#index'

  resources :combineds do
    resources :combined_items
  end

  resources :recipe_processed_items
  resources :processed_items
  resources :sales
  resources :recipes do
    resources :recipe_items
    resources :recipe_processed_items
    resources :recipe_combined_items
  end
  resources :receipts
  resources :kitchen_items
end
