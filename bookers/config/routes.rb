Rails.application.routes.draw do
	root 'books#top'
	get 'books' => 'books#index'
	post 'books' => 'books#create',as: 'create'
	get '/books/:id' => 'books#show',as: 'post'
	get '/books/:id/edit' => 'books#edit',as: 'edit'
	post '/books/:id' => 'books#show',as: 'update'
	delete '/books:id' => 'books#destroy',as: 'destroy'
 	resources :books,:only => [:update]
end