Rails.application.routes.draw do
  root 'articles#index'

  resources :articles, except: [:index, :destroy]

  delete 'articles/:id/delete' => 'articles#destroy', as: 'articles_delete'
  get '/articles/:id/delete' => 'articles#destroy'
end
