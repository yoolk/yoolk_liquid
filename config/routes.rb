Rails.application.routes.draw do
  root        'home#index'

  resources   :galleries,       only: [:index, :show]
  resources   :people,          only: [:index, :show]
  resources   :products,        only: [:index, :show]
  resources   :services,        only: [:index, :show]
  resources   :foods,           only: [:index, :show]
  resources   :announcements,   only: [:index, :show]
  resources   :brochures,       only: [:index]

  get         'map',            to: 'map#index'
  get         'contact_us',     to: 'contact_us#index'
  post        'contact_us',     to: 'contact_us#create'
  get         'about_us',       to: 'about_us#index'
  post        'about_us',       to: 'about_us#create'
end