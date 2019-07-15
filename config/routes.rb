# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

resources :languages, only: [:index, :create, :new] do
  collection do
    match 'plugin', :via => [:get]
  end
end