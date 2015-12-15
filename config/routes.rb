Rails.application.routes.draw do

  devise_for :users,
    :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout', :sign_up => 'admin/new/signup'}

  root                  'pages#home'
  get   'about'    =>   'pages#about'
  get   'contact'  =>   'pages#contact'
  get   'news'     =>   'pages#news'
  get   'help'     =>   'pages#help'

  resources :users
  resources :courses do
    resources :coursesemesters do 
      resources :subjects
    end
  end
  resources :takes
  resources :sessionenrolls
  resources :coursesessions

end
