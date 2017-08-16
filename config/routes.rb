Rails.application.routes.draw do

  root 'restaurants#index'

  resources :restaurants, only: [:new, :create, :show, :index] do
    resources :reviews, only: [:create, :new]
  end

  # only the admin (me) is able to edit or destroy restaurants
  # reviews are nested within the restaurants

  # get 'reviews/new'

  # get 'restaurants/index'

  # get 'restaurants/show'

  # get 'restaurants/edit'

  # get 'restaurants/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
