Rails.application.routes.draw do
  root        'home#index'

  get         'menu',                       to: 'menu#index',                 as: :menu_index
  get         'menu/:category_id/:id',      to: 'menu/foods#show',            as: :menu_food
  get         'menu/:category_id',          to: 'menu/categories#show',       as: :menu_category

  # get         'foods',                              to: 'foods#index',                as: :foods
  # get         'foods/:id',                          to: 'foods#show',                 as: :food
  # get         'categories/:category_id/foods/:id',  to: 'foods#show',                 as: :food_with_category
  # get         'categories/:category_id/foods',      to: 'foods/categories#show',      as: :foods_category


  # get         'products',                   to: 'products#index',             as: :products
  # get         'products/:category_id/:id',  to: 'products#show',              as: :product
  # get         'products/:category_id',      to: 'products/categories#show',   as: :products_category

  get         'products',                              to: 'products#index',                as: :products
  # get         'products/:id',                          to: 'products#show',                 as: :product
  get         '(categories/:category_id/)products/:id',  to: 'products#show',                 as: :product_with_category
  get         'categories/:category_id/products',      to: 'products/categories#show',      as: :products_category

  get         'robots.txt',                 to: 'home#robots'

  get         'services',                   to: 'services#index',             as: :services
  get         'services/:category_id/:id',  to: 'services#show',              as: :service
  get         'services/:category_id',      to: 'services/categories#show',   as: :services_category

  resources   :about_us,                    only: [:index]
  resources   :announcements,               only: [:index, :show]
  resources   :brochures,                   only: [:index]
  resources   :contact_us,                  only: [:index, :create]
  resources   :feedback,                    only: [:index, :create]
  resources   :galleries,                   only: [:index, :show]
  resources   :people,                      only: [:index]
  resources   :map,                         only: [:index]
  resources   :reservation,                 only: [:index, :create]

  resources   :videos,                      only: [:index]
  resources   :links,                       only: [:index]
  resources   :attachments,                 only: [:index]
end