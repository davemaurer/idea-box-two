Rails.application.routes.draw do
  # defaults... takes the place of
  root 'ideas#index' #, defaults: {format: 'json'}

  resources :ideas
end
