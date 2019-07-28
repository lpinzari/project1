# == Route Map
#
#       Prefix Verb   URI Pattern                  Controller#Action
#         root GET    /                            welcome#home
#        about GET    /about(.:format)             welcome#about
#     articles GET    /articles(.:format)          articles#index
#              POST   /articles(.:format)          articles#create
#  new_article GET    /articles/new(.:format)      articles#new
# edit_article GET    /articles/:id/edit(.:format) articles#edit
#      article GET    /articles/:id(.:format)      articles#show
#              PATCH  /articles/:id(.:format)      articles#update
#              PUT    /articles/:id(.:format)      articles#update
#              DELETE /articles/:id(.:format)      articles#destroy

Rails.application.routes.draw do
  root :to => 'welcome#home'
  get '/about' => 'welcome#about', as: "about"
  resources :articles

  get '/signup' => "users#new"
  resources :users, except: [:new]
end
