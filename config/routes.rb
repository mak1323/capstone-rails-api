# frozen_string_literal: true
Rails.application.routes.draw do
  # resources :campaigns do
  #   resources :campaign_logs, only: [:index, :create]
  # end
  # resources :campaign_logs, only: [:show, :update, :delete]

  resources :campaigns, except: [:new, :edit] do
    resources :campaign_logs, only: [:index, :create, :new]
    end
  resources :campaign_logs, only: [:show, :update, :destroy]

  resources :examples, except: [:new, :edit]

  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  resources :users, only: [:index, :show]
end
