Rails.application.routes.draw do
	devise_for :users

authenticated :user do
	root 'home#index', as: :authenticated_root
end

devise_scope :user do
	root to: "devise/sessions#new"
end	

get 'home/index'
resources :events
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
