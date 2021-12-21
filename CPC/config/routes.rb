Rails.application.routes.draw do
  
  root 'labworks#index'
    get '/labworks/new', to: 'labworks#new', as:'new_labwork'
    get '/labworks/:id', to: 'labworks#show', as: 'labwork'
    post '/labworks', to: 'labworks#create'
    get '/labworks/:id/edit' ,to: 'labworks#edit' , as: 'edit_labwork'
    put '/labworks/:id' , to: 'labworks#update'
    patch '/labworks/:id' , to: 'labworks#update'
    delete '/labworks/:id', to: 'labworks#destroy'
  get '/labworks/:id/mark', to: 'labworks#mark', as: 'mark_labwork'
  post '/labworks/:id/mark' , to: 'labworks#grade'
  # resources :labworks

end
