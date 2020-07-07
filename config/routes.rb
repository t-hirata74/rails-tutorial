Rails.application.routes.draw do
  get  'static_pages/home'
  # => StatigPages#home

  get  'static_pages/help'
  # => StaticPages#help

  get 'static_pages/about'

  root 'application#hello'
end
