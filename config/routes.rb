# frozen_string_literal: true

Rails.application.routes.draw do
  resources :controllers
  resources :people
end
