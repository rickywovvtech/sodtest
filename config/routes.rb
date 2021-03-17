Rails.application.routes.draw do
  # resources :questions
  # root 'questions#index'
  root to: "questions#index"
  devise_for :users
  resources :users do
    collection do
      resources :questions
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  constraints format: :json do
    get 'test/tes' => 'test#tes'
    get 'test/soduku' =>'test#main'

    post 'soduku/create' => 'soduku#create'
  end
  namespace 'api' do
    constraints format: :json do
      get 'test/tes' => 'soduku#tes'
      post 'soduku/create' => 'soduku#create'
    end
  end
end
