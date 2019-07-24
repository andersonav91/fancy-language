# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

resources :languages, only: [:index] do
  collection do
    match 'plugin', :via => [:get]
    match 'save', :via => [:post]
  end
end