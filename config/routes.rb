# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#welcome'

  devise_for :job_seekers, controllers: {
    registrations: 'job_seekers/registrations'
  }
  devise_for :employers, controllers: {
    registrations: 'employers/registrations'
  }

  resources :home do
    member do
      post 'apply'
    end
  end
  resources :job_seekers, only: %i[edit update destroy show] do
    member do
      get 'applys'
    end
  end

  resources :jobs do
    member do
      get :applyers
      get 'applyer/:job_seeker_id', to: 'jobs#applyer', as: :applyer
    end
  end
  resources :employers

  devise_scope :job_seeker do
    get '/job_seekers/sign_out' => 'devise/sessions#destroy'
  end
  devise_scope :employer do
    get '/employers/sign_out' => 'devise/sessions#destroy'
  end

  get 'start', to: 'home#index', as: :start
  get 'up' => 'rails/health#show', as: :rails_health_check
end
