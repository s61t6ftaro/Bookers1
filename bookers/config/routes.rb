Rails.application.routes.draw do
root 'books#top'
delete 'books/:id' => 'books#destroy',as: 'destroy_book'
resources :books
end