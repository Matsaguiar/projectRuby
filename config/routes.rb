Rails.application.routes.draw do

    root            to: 'static_pages#index'

	get 'cadastro', to: 'users#new'
	get 'entrar',   to: 'sessions#new'
	post 'entrar',  to: 'sessions#create'
	get 'sair',  	to: 'sessions#destroy'

	resources :users, only: [:show, :new, :create, :edit, :update] do
	resources :posts, only: [:index, :new, :create, :edit, :update, :destroy]
	resources :comments, only: [:index, :new, :create, :edit, :update, :destroy]
	end
	resources :sessions, only: [:new, :create, :destroy]

end
