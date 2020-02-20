Rails.application.routes.draw do

  # Api definition
  namespace :api, defaults: { format: :json }  do
    namespace :v1 do
      resources :products, only: %i[create update destroy]
      resources :cart_lines, only: %i[create update destroy]
    end
  end

end
