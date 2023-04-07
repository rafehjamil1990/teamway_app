Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'pages#landing_page'

  resources :questions, only: %i[show create] do
    member do
      put :save_answer
    end
    collection do
      get :result
      get :start_over
    end
  end
end
