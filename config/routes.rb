# frozen_string_literal: true

Rails.application.routes.draw do
  root 'uploads#new'

  resources :uploads

  %w[400 404 500].each do |code|
    get code, to: 'errors#show', code: code
  end

  get '*unmatched_route', to: 'errors#404'
end
