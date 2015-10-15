Rails.application.routes.draw do
  # defaults... takes the place of
  root 'main#index'#, defaults: {format: 'json'}

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :ideas, except: [:show, :new, :edit]
    end
  end
end
