Rails.application.routes.draw do
  root "home#welcome"

  resources :jobs
  resources :home

  devise_for :job_seekers
  devise_for :employers

  get "up" => "rails/health#show", as: :rails_health_check

end
