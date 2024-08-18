Rails.application.routes.draw do
  devise_for :job_seekers
  devise_for :employers

  get "up" => "rails/health#show", as: :rails_health_check

  # root "posts#index"
end
