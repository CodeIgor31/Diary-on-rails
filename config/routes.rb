Rails.application.routes.draw do
  root 'notes#index', as: 'home'
  
  get 'about' => 'pages#about', as: 'about'

  resources :notes do 
    resources :comments
  end
end
