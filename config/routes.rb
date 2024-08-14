# frozen_string_literal: true

Rails.application.routes.draw do
  root "blog_posts#index"

  devise_for :users

  resources :blog_posts
end
