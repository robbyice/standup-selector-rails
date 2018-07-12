Rails.application.routes.draw do
  resources :hosts, only: [:create, :index, :show, :destroy, :update]
end
