Rails.application.routes.draw do
  resources :marketings
  root 'dashboard#index'
  resources :sale_items

  resources :combineds do
    resources :combined_items
  end

  resources :sales
  resources :recipes do
    resources :recipe_items
    resources :recipe_combined_items
  end
  resources :receipts
  resources :kitchen_items
end
