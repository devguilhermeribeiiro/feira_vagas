Rails.application.routes.draw do
  root "home#welcome"

  resources :jobs
  resources :home

  devise_for :job_seekers
  devise_for :employers
  devise_scope :job_seeker do
    get '/job_seekers/sign_out' => 'devise/sessions#destroy'
  end
  devise_scope :employer do
    get '/employers/sign_out' => 'devise/sessions#destroy'
  end

  get 'start', to: 'home#index', as: :start
  get 'profile', to: 'home#profile', as: :job_seeker_profile
  get "up" => "rails/health#show", as: :rails_health_check

end
