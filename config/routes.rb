# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#home'
  get 'static_page/home'
  get 'static_page/help'
  get 'static_page/about'
  get 'static_page/contact'

  resources :users
  resources :microposts
end
