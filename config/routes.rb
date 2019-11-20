Rails.application.routes.draw do
  root "admin#index"
  namespace :admin do
    root "pages#home"
  end
end
