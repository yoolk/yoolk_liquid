Rails.application.routes.draw do
  root        'home#index'

  get         'menu',                                             to: 'menu#index',                as: :menu_index
  get         '(menu-categories/:category_id)/menu/:id',          to: 'menu/foods#show',           as: :menu
  get         'menu-categories/:category_id/menu',                to: 'menu/categories#show',      as: :menu_category

  get         'products',                                         to: 'products#index',            as: :products
  get         '(products-categories/:category_id)/products/:id',  to: 'products#show',             as: :product
  get         'products-categories/:category_id/products',        to: 'products/categories#show',  as: :product_category_products

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