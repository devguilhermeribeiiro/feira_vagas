Rails.application.routes.draw do
  get 'employers/show'
  get 'employers/edit'

  root "home#welcome"

  devise_for :job_seekers
  resources :jobs
  resources :home do
    member do
      post 'apply'
    end
  end
  resources :job_seekers, only: %i[ edit update destroy show ] do
    member do
      get 'applys'
    end
  end

  devise_for :employers

  devise_scope :job_seeker do
    get '/job_seekers/sign_out' => 'devise/sessions#destroy'
  end
  devise_scope :employer do
    get '/employers/sign_out' => 'devise/sessions#destroy'
  end

  get 'start', to: 'home#index', as: :start
  get "up" => "rails/health#show", as: :rails_health_check

end
