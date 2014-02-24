GenericSchemaHstore::Application.routes.draw do
  root :to => 'item_categories#index'

  resources :item_categories do
    resources :items, :shallow => true
  end
end
