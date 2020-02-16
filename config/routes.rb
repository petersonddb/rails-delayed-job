# frozen-string-literal: true

Rails.application.routes.draw do
  resources :bumblebees, only: %i[index] do
    collection do
      post 'random_stinging'
      get 'scheduled_stingings'
    end
  end
end
