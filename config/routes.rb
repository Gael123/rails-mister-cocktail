Rails.application.routes.draw do
  resources :cocktails ,only: [ :new,:show,:create,:index] do
    resources :doses,only: [ :new, :create, :destroy]
end
# resources :doses, only: [:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
