Rails.application.routes.draw do
  root        'home#index'

  resources   :galleries,                   only: [:index, :show]
  resources   :people,                      only: [:index]
  resources   :brochures,                   only: [:index]

  get         'products',                   to: 'products#index',             as: :products
  get         'products/:category_id/:id',  to: 'products#show',              as: :product
  get         'products/:category_id',      to: 'products/categories#show',   as: :products_category

  get         'services',                   to: 'services#index',             as: :services
  get         'services/:category_id/:id',  to: 'services#show',              as: :service
  get         'services/:category_id',      to: 'services/categories#show',   as: :services_category

  get         'menu',                       to: 'menu#index',                 as: :menu
  get         'menu/:category_id/:id',      to: 'menu/foods#show',            as: :menu_food
  get         'menu/:category_id',          to: 'menu/categories#show',       as: :menu_category

  resources   :announcements,               only: [:index, :show]

  get         'map',                        to: 'map#index'
  get         'contact_us',                 to: 'contact_us#index'
  post        'contact_us',                 to: 'contact_us#create'
  get         'about_us',                   to: 'about_us#index'
  post        'about_us',                   to: 'about_us#create'
end