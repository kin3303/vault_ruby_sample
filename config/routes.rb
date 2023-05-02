Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/new'
  post 'posts/create'
	
  get 'home/form'
  get 'home/next'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 root 'posts#index'
 get '/posts/show/:id' => 'posts#show'
 get '/posts/edit/:id' => 'posts#edit'
 post '/posts/update/:id' => 'posts#update'
 get '/posts/destroy/:id' => 'posts#destroy'
end
