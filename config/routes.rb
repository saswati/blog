Blog::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  devise_for :users
  devise_for :admins, :controllers => { :sessions => "admins/sessions" }

  resources :comments
  resources :profiles
  resources :articles do

    member do
      post 'comment'
    end
  end



  get "/home", to: 'pages#home'

  get "/news", to: 'pages#news'

  get "/about", to: 'pages#about'

  get "/books", to: 'pages#books'

  root :to => 'pages#home'
end
