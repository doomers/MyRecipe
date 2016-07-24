Rails.application.routes.draw do
   
   root 'pages#home'

   get '/home', to: 'pages#home'

   # get '/recipes' to: 'recipes#index'
   # get  '/recipes/new' to: 'recipes#new', as: 'new_recipe'

   resources :recipes do
     member do
      post 'like'
     end
   end

   resources :chefs, except: [:new]

   get'/register', to: 'chefs#new'

   #login routes
   get '/login', to: 'logins#new'
   post '/login', to: 'logins#create'
   get '/logout', to: 'logins#destroy'

end
